// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:tuneinheartapplication/serviceManager/apiProvider.dart';
//
//
//
// class CommonInfoRepository {
//   ApiProvider? apiProvider;
//
//   CommonInfoRepository() {
//     apiProvider = new ApiProvider();
//   }
//
//   Future requestForm(String? userName,songName,language,album,singerName,year) async {
//     Map<String, dynamic> formData = {
//       'user_name': userName,
//       'song_name': songName,
//     };
//     if (language != null && language.isNotEmpty) {
//       formData['language'] = language;
//     }
//     if (album != null && album.isNotEmpty) {
//       formData['album'] = album;
//     }
//     if (album != null && album.isNotEmpty) {
//       formData['album'] = album;
//     }
//     if (singerName != null && singerName.isNotEmpty) {
//       formData['singer_name'] = singerName;
//     }
//     if (year != null && year.isNotEmpty) {
//       formData['year'] = year;
//     }
//     try {
//       final response =
//       await apiProvider!.getInstance()!.post("song/request/store",data :formData);
//       if (response!.statusCode == 200) {
//         print('Successfully requested');
//       } else {
//         print('Upload failed');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//
//
//
//   }
// }