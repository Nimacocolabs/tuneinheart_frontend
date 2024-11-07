import 'dart:async';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tuneinheartapplication/presentation/welcome_screen/welocome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds:5),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => WelcomeScreen())));
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        constraints:BoxConstraints.expand(),
        decoration:BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/splash_logo.png'),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.95),
            FutureBuilder<String>(
                future: _getAppVersion(),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  String version = '';
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData)
                    version = snapshot.data == null
                        ? ''
                        : 'Version : ${snapshot.data}';
                  return Text(
                    '$version',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.grey),
                  );
                }),
            SizedBox(
              height: 18,
            ),
          ],
        ),
      ),
    );
  }
  Future<String> _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }
}
