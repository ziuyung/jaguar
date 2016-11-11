library jaguar.test_all;

import 'jaguar/route/route.dart' as route;
import 'jaguar/group/main.dart' as groupNormal;
import 'jaguar/websocket/websocket.dart' as websocket;
import 'interceptor/param/param.dart' as interceptorParam;
import 'exception/exception.dart' as exceptionExcept;

void main() {
  route.main();
  groupNormal.main();
  websocket.main();
  interceptorParam.main();
  exceptionExcept.main();
}