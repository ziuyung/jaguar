library jaguar.src.interceptors.pre;

import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:http_server/http_server.dart';
import 'package:mime/mime.dart';

import '../../../generator/pre_interceptors/function.dart';
import '../../../generator/pre_interceptors/pre_interceptor.dart';
import '../../../generator/parameter.dart';

part 'function.g.dart';

@PreInterceptorFunction(
    authorizedMethods: const <String>['POST', 'PUT', 'PATCH', 'DELETE'])
Future<String> getStringFromBody(HttpRequest request) {
  Completer<String> completer = new Completer<String>();
  String datas = "";
  request.transform(UTF8.decoder).listen((String data) {
    datas += data;
  }, onDone: () => completer.complete(datas));
  return completer.future;
}

@PreInterceptorFunction(
    authorizedMethods: const <String>['POST', 'PUT', 'PATCH', 'DELETE'])
void mustBeMimeType(HttpRequest request, String mimeType) {
  if (request.headers.contentType?.mimeType != mimeType) {
    throw "Mime type is ${request.headers.contentType?.mimeType} instead of $mimeType";
  }
}

@PreInterceptorFunction(
    authorizedMethods: const <String>['POST', 'PUT', 'PATCH', 'DELETE'])
Future<String> getJsonFromBody(HttpRequest request) async {
  mustBeMimeType(request, "application/json");
  return JSON.decode(await getStringFromBody(request));
}

class FormField {
  final String name;
  final value;
  final String contentType;
  final String filename;

  FormField(String this.name, this.value,
      {String this.contentType, String this.filename});

  bool operator ==(other) {
    if (value.length != other.value.length) return false;
    for (int i = 0; i < value.length; i++) {
      if (value[i] != other.value[i]) {
        return false;
      }
    }
    return name == other.name &&
        contentType == other.contentType &&
        filename == other.filename;
  }

  int get hashCode => name.hashCode;

  String toString() {
    return "FormField('$name', '$value', '$contentType', '$filename')";
  }
}

@PreInterceptorFunction(
    authorizedMethods: const <String>['POST', 'PUT', 'PATCH', 'DELETE'])
Future<Map<String, FormField>> getFormDataFromBody(HttpRequest request) async {
  if (!request.headers.contentType.parameters.containsKey('boundary')) {
    return null;
  }
  String boundary = request.headers.contentType.parameters['boundary'];
  return request
      .transform(new MimeMultipartTransformer(boundary))
      .map(HttpMultipartFormData.parse)
      .map((HttpMultipartFormData multipart) async {
        Future future;
        if (multipart.isText) {
          future = multipart.join();
        } else {
          future = multipart.fold([], (b, s) => b..addAll(s));
        }
        var data = await future;
        String contentType;
        if (multipart.contentType != null) {
          contentType = multipart.contentType.mimeType;
        }
        Map<String, FormField> map = <String, FormField>{};
        map[multipart.contentDisposition.parameters['name']] = new FormField(
            multipart.contentDisposition.parameters['name'], data,
            contentType: contentType,
            filename: multipart.contentDisposition.parameters['filename']);
        return map;
      })
      .toList()
      .then(Future.wait);
}