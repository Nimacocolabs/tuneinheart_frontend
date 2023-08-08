// import 'dart:async';
//
// import 'package:tuneinheartapplication/elements/response.dart';
// import 'package:tuneinheartapplication/models/adsResponse.dart';
//
// import '../Repository/requestformRepostiory.dart';
//
//
//
// class DetailBloc {
//   CommonInfoRepository _commonInfoRepository;
//
//   StreamController _detailController;
//
//   StreamSink get detailSink =>
//       _detailController.sink;
//
//   Stream  get detailStream =>
//       _detailController.stream;
//
//   DetailBloc() {
//     _commonInfoRepository = CommonInfoRepository();
//     _detailController = StreamController<ApiResponse<AdsResponse>>();
//   }
//
//   getDetail() async {
//     detailSink.add(ApiResponse.loading('Fetching detail info'));
//
//     try {
//       AdsResponse response =
//       await _commonInfoRepository.getHomeItems();
//       if (response.success==true)
//       {
//         detailSink.add(ApiResponse.completed(response));
//
//       } else {
//         detailSink.add(ApiResponse.error("Something went wrong"));
//       }
//     } catch (error) {
//       detailSink.add(ApiResponse.error());
//     }
//   }
//
//   dispose() {
//     detailSink?.close();
//     _detailController?.close();
//   }
// }
