library example.basic_auth.server;

import 'dart:async';
import 'package:jaguar/jaguar.dart';
import 'package:jaguar_reflect/jaguar_reflect.dart';
import 'package:jaguar_auth/jaguar_auth.dart';

import 'package:jaguar_example_session_models/jaguar_example_session_models.dart';

final Map<String, Book> _books = {
  '0': new Book(id: '0', name: 'Book0'),
  '1': new Book(id: '1', name: 'Book1'),
};

/// This route group contains login and logout routes
@GenController()
class AuthRoutes extends Controller {
  @PostJson(path: '/login')
  Future<User> login(Context ctx) => JsonAuth.authenticate<User>(ctx);

  @Post(path: '/logout')
  Future logout(Context ctx) async {
    // Clear session data
    (await ctx.session).clear();
  }
}

/// Collection of routes students can also access
@GenController(path: '/book')
class StudentRoutes extends Controller {
  @GetJson()
  Future<List<Book>> getAllBooks(Context ctx) async {
    return _books.values.toList();
  }

  @GetJson(path: '/:id')
  Future<Book> getBook(Context ctx) async {
    String id = ctx.pathParams.get('id');
    return _books[id];
  }

  @override
  Future<void> before(Context ctx) async {
    // Authorize. Throws 401 http error, if authorization fails!
    await Authorizer.authorize<User>(ctx);
  }
}

@GenController(path: '/api')
class LibraryApi extends Controller {
  @IncludeController()
  final auth = AuthRoutes();

  @IncludeController()
  final books = StudentRoutes();
}

server() async {
  final server = Jaguar(port: 10000)..add(reflect(LibraryApi()));
  server.userFetchers[User] = DummyUserFetcher(users);
  await server.serve();
}
