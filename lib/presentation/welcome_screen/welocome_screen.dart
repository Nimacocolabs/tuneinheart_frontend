import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tuneinheartapplication/Utilities/color_constant.dart';
import 'package:tuneinheartapplication/Utilities/size_utils.dart';
import 'package:tuneinheartapplication/presentation/home_screen/home_screen.dart';
import 'package:tuneinheartapplication/theme/app_style.dart';
import 'package:tuneinheartapplication/widgets/custom_button.dart';



class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}


class _WelcomeScreenState extends State<WelcomeScreen> {

  String? _deviceId;
  //Get Device Information
  void _getDeviceId() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String? deviceId;

    if (kIsWeb) {
      final webBrowserInfo = await deviceInfo.webBrowserInfo;
      deviceId =
      '${webBrowserInfo.vendor ?? '-'} + ${webBrowserInfo.userAgent ?? '-'} + ${webBrowserInfo.hardwareConcurrency.toString()}';
    } else if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id;
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor;
    } else if (Platform.isLinux) {
      final linuxInfo = await deviceInfo.linuxInfo;
      deviceId = linuxInfo.machineId;
    } else if (Platform.isWindows) {
      final windowsInfo = await deviceInfo.windowsInfo;
      deviceId = windowsInfo.deviceId;
    } else if (Platform.isMacOS) {
      final macOsInfo = await deviceInfo.macOsInfo;
      deviceId = macOsInfo.systemGUID;
    }

    setState(() {
      _deviceId = deviceId;
    });
  }

  @override
  void initState() {
    super.initState();
    _getDeviceId();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.black900,
        body: SizedBox(
          height: size.height,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/images/happy-dj-woman.png",
                alignment: Alignment.bottomCenter,
                height: 805,
                width: 414,
              ),
              Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: size.height,
                    width: double.maxFinite,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: size.height,
                            width: double.maxFinite,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/background.png",
                                  alignment: Alignment.center,
                                  height: 896,
                                  width: 414,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: getPadding(
                                      left: 52,
                                      right: 52,
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 241,
                                            margin: getMargin(
                                              top: 30,
                                              right: 69,
                                            ),
                                            child: Text(
                                              "TUNE \nIN \nHEART",
                                              maxLines: null,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFProDisplayBold60,
                                            ),
                                          ),
                                          Container(
                                            width: 187,
                                            margin: getMargin(
                                              top: 20,
                                            ),
                                            child: Text(
                                              "Enjoy the best radio stations from your home, don't miss out on anything",
                                              maxLines: null,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFProDisplayRegular16,
                                            ),
                                          ),
                                          CustomButton(
                                            height: 45,
                                            text: "Get Started",
                                            margin: getMargin(
                                              top: 360,
                                            ),
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>  HomeScreen(Device_id:_deviceId)),
                                              );
                                            },
                                          ),
                                          SizedBox(height: 30,)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

