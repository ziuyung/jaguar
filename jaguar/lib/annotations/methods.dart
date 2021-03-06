part of jaguar.src.annotations;

typedef String WsResultProcessor(dynamic response);

/// Function that modifies [context]
typedef FutureOr<void> ResponseProcessor(Context context, dynamic result);

/// [ResponseProcessor] to encode response value to json and also set mimetype
/// to [MimeType.json].
void jsonResponseProcessor(Context context, dynamic result) {
  final info = context.route.info;
  context.response = Response.json(result,
      statusCode: info.statusCode,
      mimeType: info.mimeType ?? MimeTypes.json,
      charset: info.charset ?? kDefaultCharset);
}

/// Annotation to declare a method as request handler method that processes GET
/// requests.
class Get implements HttpMethod {
  /// Path of the route
  final String path;

  /// Methods handled by the route
  final List<String> methods = _methods;

  /// Map of regular expression matchers for specific path segment
  final Map<String, String> pathRegEx;

  final int statusCode;

  final String mimeType;

  final String charset;

  final ResponseProcessor responseProcessor;

  const Get(
      {this.path: '',
      this.pathRegEx,
      this.statusCode: 200,
      this.mimeType,
      this.charset: kDefaultCharset,
      this.responseProcessor});

  HttpMethod cloneWith(
          {String path,
          List<String> methods,
          Map<String, String> pathRegEx,
          int statusCode,
          String mimeType,
          String charset: kDefaultCharset,
          ResponseProcessor responseProcessor}) =>
      HttpMethod(
          path: path ?? this.path,
          methods: methods ?? this.methods,
          pathRegEx: pathRegEx ?? this.pathRegEx,
          statusCode: statusCode ?? this.statusCode,
          mimeType: mimeType ?? this.mimeType,
          charset: charset ?? this.charset,
          responseProcessor: responseProcessor ?? this.responseProcessor);

  static const List<String> _methods = const <String>['GET'];
}

/// Annotation to declare a method as request handler method that processes POST
/// requests.
class Post implements HttpMethod {
  /// Path of the route
  final String path;

  /// Methods handled by the route
  final List<String> methods = _methods;

  /// Map of regular expression matchers for specific path segment
  final Map<String, String> pathRegEx;

  final int statusCode;

  final String mimeType;

  final String charset;

  final ResponseProcessor responseProcessor;

  const Post(
      {this.path: '',
      this.pathRegEx,
      this.statusCode: 200,
      this.mimeType,
      this.charset: kDefaultCharset,
      this.responseProcessor});

  HttpMethod cloneWith(
          {String path,
          List<String> methods,
          Map<String, String> pathRegEx,
          int statusCode,
          String mimeType,
          String charset: kDefaultCharset,
          ResponseProcessor responseProcessor}) =>
      HttpMethod(
          path: path ?? this.path,
          methods: methods ?? this.methods,
          pathRegEx: pathRegEx ?? this.pathRegEx,
          statusCode: statusCode ?? this.statusCode,
          mimeType: mimeType ?? this.mimeType,
          charset: charset ?? this.charset,
          responseProcessor: responseProcessor ?? this.responseProcessor);

  static const List<String> _methods = const <String>['POST'];
}

/// Annotation to declare a method as request handler method that processes PUT
/// requests.
class Put implements HttpMethod {
  /// Path of the route
  final String path;

  /// Methods handled by the route
  final List<String> methods = _methods;

  /// Map of regular expression matchers for specific path segment
  final Map<String, String> pathRegEx;

  final int statusCode;

  final String mimeType;

  final String charset;

  final ResponseProcessor responseProcessor;

  const Put(
      {this.path: '',
      this.pathRegEx,
      this.statusCode: 200,
      this.mimeType,
      this.charset: kDefaultCharset,
      this.responseProcessor});

  HttpMethod cloneWith(
          {String path,
          List<String> methods,
          Map<String, String> pathRegEx,
          int statusCode,
          String mimeType,
          String charset: kDefaultCharset,
          ResponseProcessor responseProcessor}) =>
      HttpMethod(
          path: path ?? this.path,
          methods: methods ?? this.methods,
          pathRegEx: pathRegEx ?? this.pathRegEx,
          statusCode: statusCode ?? this.statusCode,
          mimeType: mimeType ?? this.mimeType,
          charset: charset ?? this.charset,
          responseProcessor: responseProcessor ?? this.responseProcessor);

  static const List<String> _methods = const <String>['PUT'];
}

/// Annotation to declare a method as request handler method that processes DELETE
/// requests.
class Delete implements HttpMethod {
  /// Path of the route
  final String path;

  /// Methods handled by the route
  final List<String> methods = _methods;

  /// Map of regular expression matchers for specific path segment
  final Map<String, String> pathRegEx;

  final int statusCode;

  final String mimeType;

  final String charset;

  final ResponseProcessor responseProcessor;

  const Delete(
      {this.path: '',
      this.pathRegEx,
      this.statusCode: 200,
      this.mimeType,
      this.charset: kDefaultCharset,
      this.responseProcessor});

  HttpMethod cloneWith(
          {String path,
          List<String> methods,
          Map<String, String> pathRegEx,
          int statusCode,
          String mimeType,
          String charset: kDefaultCharset,
          ResponseProcessor responseProcessor}) =>
      HttpMethod(
          path: path ?? this.path,
          methods: methods ?? this.methods,
          pathRegEx: pathRegEx ?? this.pathRegEx,
          statusCode: statusCode ?? this.statusCode,
          mimeType: mimeType ?? this.mimeType,
          charset: charset ?? this.charset,
          responseProcessor: responseProcessor ?? this.responseProcessor);

  static const List<String> _methods = const <String>['DELETE'];
}

/// Annotation to declare a method as request handler method that processes
/// PATCH requests.
class Patch implements HttpMethod {
  /// Path of the route
  final String path;

  /// Methods handled by the route
  final List<String> methods = _methods;

  /// Map of regular expression matchers for specific path segment
  final Map<String, String> pathRegEx;

  final int statusCode;

  final String mimeType;

  final String charset;

  final ResponseProcessor responseProcessor;

  const Patch(
      {this.path: '',
      this.pathRegEx,
      this.statusCode: 200,
      this.mimeType,
      this.charset: kDefaultCharset,
      this.responseProcessor});

  HttpMethod cloneWith(
          {String path,
          List<String> methods,
          Map<String, String> pathRegEx,
          int statusCode,
          String mimeType,
          String charset: kDefaultCharset,
          ResponseProcessor responseProcessor}) =>
      HttpMethod(
          path: path ?? this.path,
          methods: methods ?? this.methods,
          pathRegEx: pathRegEx ?? this.pathRegEx,
          statusCode: statusCode ?? this.statusCode,
          mimeType: mimeType ?? this.mimeType,
          charset: charset ?? this.charset,
          responseProcessor: responseProcessor ?? this.responseProcessor);

  static const List<String> _methods = const <String>['PATCH'];
}

/// Annotation to declare a method as request handler method that processes
/// OPTIONS requests.
class OptionsMethod implements HttpMethod {
  /// Path of the route
  final String path;

  /// Methods handled by the route
  final List<String> methods = _methods;

  /// Map of regular expression matchers for specific path segment
  final Map<String, String> pathRegEx;

  final int statusCode;

  final String mimeType;

  final String charset;

  final ResponseProcessor responseProcessor;

  const OptionsMethod(
      {this.path: '',
      this.pathRegEx,
      this.statusCode: 200,
      this.mimeType,
      this.charset: kDefaultCharset,
      this.responseProcessor});

  HttpMethod cloneWith(
          {String path,
          List<String> methods,
          Map<String, String> pathRegEx,
          int statusCode,
          String mimeType,
          String charset: kDefaultCharset,
          ResponseProcessor responseProcessor}) =>
      HttpMethod(
          path: path ?? this.path,
          methods: methods ?? this.methods,
          pathRegEx: pathRegEx ?? this.pathRegEx,
          statusCode: statusCode ?? this.statusCode,
          mimeType: mimeType ?? this.mimeType,
          charset: charset ?? this.charset,
          responseProcessor: responseProcessor ?? this.responseProcessor);

  static const List<String> _methods = const <String>['OPTIONS'];
}

/// Annotation to declare a method as request handler method that processes GET
/// requests with JSON response.
class GetJson implements HttpMethod {
  /// Path of the route
  final String path;

  /// Methods handled by the route
  final List<String> methods = Get._methods;

  /// Map of regular expression matchers for specific path segment
  final Map<String, String> pathRegEx;

  final int statusCode;

  final String mimeType;

  final String charset;

  final ResponseProcessor responseProcessor;

  const GetJson(
      {this.path: '',
      this.pathRegEx,
      this.statusCode: 200,
      this.mimeType,
      this.charset: kDefaultCharset,
      this.responseProcessor: jsonResponseProcessor});

  HttpMethod cloneWith(
          {String path,
          List<String> methods,
          Map<String, String> pathRegEx,
          int statusCode,
          String mimeType,
          String charset: kDefaultCharset,
          ResponseProcessor responseProcessor}) =>
      HttpMethod(
          path: path ?? this.path,
          methods: methods ?? this.methods,
          pathRegEx: pathRegEx ?? this.pathRegEx,
          statusCode: statusCode ?? this.statusCode,
          mimeType: mimeType ?? this.mimeType,
          charset: charset ?? this.charset,
          responseProcessor: responseProcessor ?? this.responseProcessor);
}

/// Annotation to declare a method as request handler method that processes PUT
/// requests with JSON response.
class PutJson implements HttpMethod {
  /// Path of the route
  final String path;

  /// Methods handled by the route
  final List<String> methods = Put._methods;

  /// Map of regular expression matchers for specific path segment
  final Map<String, String> pathRegEx;

  final int statusCode;

  final String mimeType;

  final String charset;

  final ResponseProcessor responseProcessor;

  const PutJson(
      {this.path: '',
      this.pathRegEx,
      this.statusCode: 200,
      this.mimeType,
      this.charset: kDefaultCharset,
      this.responseProcessor: jsonResponseProcessor});

  HttpMethod cloneWith(
          {String path,
          List<String> methods,
          Map<String, String> pathRegEx,
          int statusCode,
          String mimeType,
          String charset: kDefaultCharset,
          ResponseProcessor responseProcessor}) =>
      HttpMethod(
          path: path ?? this.path,
          methods: methods ?? this.methods,
          pathRegEx: pathRegEx ?? this.pathRegEx,
          statusCode: statusCode ?? this.statusCode,
          mimeType: mimeType ?? this.mimeType,
          charset: charset ?? this.charset,
          responseProcessor: responseProcessor ?? this.responseProcessor);
}

/// Annotation to declare a method as request handler method that processes POST
/// requests with JSON response.
class PostJson implements HttpMethod {
  /// Path of the route
  final String path;

  /// Methods handled by the route
  final List<String> methods = Post._methods;

  /// Map of regular expression matchers for specific path segment
  final Map<String, String> pathRegEx;

  final int statusCode;

  final String mimeType;

  final String charset;

  final ResponseProcessor responseProcessor;

  const PostJson(
      {this.path: '',
      this.pathRegEx,
      this.statusCode: 200,
      this.mimeType,
      this.charset: kDefaultCharset,
      this.responseProcessor: jsonResponseProcessor});

  HttpMethod cloneWith(
          {String path,
          List<String> methods,
          Map<String, String> pathRegEx,
          int statusCode,
          String mimeType,
          String charset: kDefaultCharset,
          ResponseProcessor responseProcessor}) =>
      HttpMethod(
          path: path ?? this.path,
          methods: methods ?? this.methods,
          pathRegEx: pathRegEx ?? this.pathRegEx,
          statusCode: statusCode ?? this.statusCode,
          mimeType: mimeType ?? this.mimeType,
          charset: charset ?? this.charset,
          responseProcessor: responseProcessor ?? this.responseProcessor);
}

/// Annotation to declare a method as request handler method that processes DELETE
/// requests with JSON response.
class DeleteJson implements HttpMethod {
  /// Path of the route
  final String path;

  /// Methods handled by the route
  final List<String> methods = Delete._methods;

  /// Map of regular expression matchers for specific path segment
  final Map<String, String> pathRegEx;

  final int statusCode;

  final String mimeType;

  final String charset;

  final ResponseProcessor responseProcessor;

  const DeleteJson(
      {this.path: '',
      this.pathRegEx,
      this.statusCode: 200,
      this.mimeType,
      this.charset: kDefaultCharset,
      this.responseProcessor: jsonResponseProcessor});

  HttpMethod cloneWith(
          {String path,
          List<String> methods,
          Map<String, String> pathRegEx,
          int statusCode,
          String mimeType,
          String charset: kDefaultCharset,
          ResponseProcessor responseProcessor}) =>
      HttpMethod(
          path: path ?? this.path,
          methods: methods ?? this.methods,
          pathRegEx: pathRegEx ?? this.pathRegEx,
          statusCode: statusCode ?? this.statusCode,
          mimeType: mimeType ?? this.mimeType,
          charset: charset ?? this.charset,
          responseProcessor: responseProcessor ?? this.responseProcessor);
}

/// Annotation to declare a method as request handler method that processes GET
/// requests with HTML response.
class GetHtml implements HttpMethod {
  /// Path of the route
  final String path;

  /// Methods handled by the route
  final List<String> methods = Get._methods;

  /// Map of regular expression matchers for specific path segment
  final Map<String, String> pathRegEx;

  final int statusCode;

  final String mimeType;

  final String charset;

  final ResponseProcessor responseProcessor;

  const GetHtml(
      {this.path: '',
      this.pathRegEx,
      this.statusCode: 200,
      this.mimeType: MimeTypes.html,
      this.charset: kDefaultCharset,
      this.responseProcessor});

  HttpMethod cloneWith(
          {String path,
          List<String> methods,
          Map<String, String> pathRegEx,
          int statusCode,
          String mimeType,
          String charset: kDefaultCharset,
          ResponseProcessor responseProcessor}) =>
      HttpMethod(
          path: path ?? this.path,
          methods: methods ?? this.methods,
          pathRegEx: pathRegEx ?? this.pathRegEx,
          statusCode: statusCode ?? this.statusCode,
          mimeType: mimeType ?? this.mimeType,
          charset: charset ?? this.charset,
          responseProcessor: responseProcessor ?? this.responseProcessor);
}

///An annotation to define a route
class HttpMethod {
  /// Path of the route
  final String path;

  /// Methods handled by the route
  final List<String> methods;

  /// Map of regular expression matchers for specific path segment
  final Map<String, String> pathRegEx;

  final int statusCode;

  final String mimeType;

  final String charset;

  final ResponseProcessor responseProcessor;

  const HttpMethod(
      {this.path: '',
      this.methods: _methods,
      this.pathRegEx,
      this.statusCode: 200,
      this.mimeType,
      this.charset,
      this.responseProcessor});

  static const List<String> _methods = const <String>['*'];

  String toString() => '$methods $path';

  HttpMethod cloneWith(
          {String path,
          List<String> methods,
          Map<String, String> pathRegEx,
          int statusCode,
          String mimeType,
          String charset: kDefaultCharset,
          ResponseProcessor responseProcessor}) =>
      HttpMethod(
          path: path ?? this.path,
          methods: methods ?? this.methods,
          pathRegEx: pathRegEx ?? this.pathRegEx,
          statusCode: statusCode ?? this.statusCode,
          mimeType: mimeType ?? this.mimeType,
          charset: charset ?? this.charset,
          responseProcessor: responseProcessor ?? this.responseProcessor);
}

const String kDefaultMimeType = 'text/plain';
const String kDefaultCharset = 'utf-8';
