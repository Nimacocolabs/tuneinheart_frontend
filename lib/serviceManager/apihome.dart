// import 'package:dio/dio.dart';
// import 'package:time_bank/util/app_helper.dart';
// import 'package:time_bank/util/shared_prefs.dart';
// import 'package:time_bank/util/user.dart';
//
// class ApiInterceptorHome extends Interceptor {
//   int maxCharactersPerLine = 500;
//
//   @override
//   void onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     //var s1 = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo3OCwiZXhwIjoxNjM0MjI0NDMzLCJpc3MiOiJsb2NhbGhvc3QiLCJpYXQiOjE2MzE1OTQ2ODd9.mmWjnVHP3A1s0IK4LsT9FqxGsoONOUDqZK2n3lnaag8";
//     // if (User.apiToken.isNotEmpty) {
//     //   options.headers.addAll({"Authorization": "Bearer ${User.apiToken}"});
//     //   // options.headers.addAll({"Authorization": "Bearer $s1"});
//     // }
//
//     print("!!!!!!!!!!!!!! Request Begin !!!!!!!!!!!!!!!!!!!!!");
//     print(
//         "REQUEST[${options.method}] => PATH: ${options.baseUrl}${options.path}");
//     print("Headers:");
//     options.headers.forEach((k, v) => print('$k: $v'));
//     if (options.queryParameters != null) {
//       print("QueryParameters:");
//       options.queryParameters.forEach((k, v) => print('$k: $v'));
//     }
//     if (options.data != null) {
//       try {
//         print('body:');
//         FormData d = options.data;
//         d.fields.forEach((element) {
//           print('${element.key}:${element.value}');
//         });
//       } catch (e) {
//         print("${options.data}");
//       }
//     }
//     print("!!!!!!!!!!!!!!!!!!!! Request End !!!!!!!!!!!!!!!!!!!!!");
//
//     super.onRequest(options, handler);
//   }
//
//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     print("************** Response Begin ************************");
//     print("ResMethodType : [${response.requestOptions.method}]");
//     print(
//         "RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.baseUrl}${response.requestOptions.path}");
//     if (response.statusCode == 401) {
//       SharedPrefs.logOut();
//     }
//
//     String responseAsString = response.data.toString();
//     if (responseAsString.length > maxCharactersPerLine) {
//       int iterations = (responseAsString.length / maxCharactersPerLine).floor();
//       for (int i = 0; i <= iterations; i++) {
//         int endingIndex = i * maxCharactersPerLine + maxCharactersPerLine;
//         if (endingIndex > responseAsString.length) {
//           endingIndex = responseAsString.length;
//         }
//         print(
//             responseAsString.substring(i * maxCharactersPerLine, endingIndex));
//       }
//     } else {
//       print(response.data);
//     }
//     print("************** Response End ************************");
//
//     // print('status code: ${response.statusCode}');
//     // print('success response: ${response.data}');
//
//     super.onResponse(response, handler);
//   }
//
//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) {
//     print("#################### Error Begin #########################");
//     if (err.response != null) {
//       print('status code: ${err.response!.statusCode}');
//       print('error response: ${err.response!.data.toString()}');
//
//       if (err.response!.statusCode == 401) {
//         SharedPrefs.logOut();
//       }
//     } else {
//       print('${err.toString()}');
//     }
//     print("#################### Error End #########################");
//
//     super.onError(err, handler);
//   }
// }
