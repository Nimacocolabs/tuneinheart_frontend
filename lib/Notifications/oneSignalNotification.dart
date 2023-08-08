
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuneinheartapplication/Utilities/preferenceUtils.dart';


class OneSignalNotifications {
  void initializeOnesignal() async {
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    print("***********");
    print("Initialize Onesignal");
    print("***********");
    try {
      OneSignal.shared.setAppId("e132f07e-4963-4e76-97cb-4479afdb7cfb");
      //   handleSendTags();
      OneSignal.shared.setNotificationWillShowInForegroundHandler(
              (OSNotificationReceivedEvent event) {
            print('FOREGROUND HANDLER CALLED WITH: $event');
          });
      OneSignal.shared.setNotificationOpenedHandler(
              (OSNotificationOpenedResult result) async {
            print('NOTIFICATION OPENED HANDLER CALLED WITH: $result');
            bool? isLogged = false;
            SharedPreferences prefs = await SharedPreferences.getInstance();
            isLogged = prefs.getBool(PreferenceUtils.prefIsLoggedIn) == null
                ? false
                : prefs.getBool(PreferenceUtils.prefIsLoggedIn);
            print("***");
            print(isLogged);
            print("***");
            if (isLogged == true) {
              print("islogged");
              // checkPayload(result);
            } else {
              print("is not logged");
            }
          });
      OneSignal.shared
          .setPermissionObserver((OSPermissionStateChanges changes) {
        // will be called whenever the permission changes
        // (ie. user taps Allow on the permission prompt in iOS)
      });
      OneSignal.shared
          .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
        // will be called whenever the subscription changes
        //(ie. user gets registered with OneSignal and gets a user ID)
      });
// If you want to know if the user allowed/denied permission,
// the function returns a Future<bool>:
      OneSignal.shared
          .promptUserForPushNotificationPermission()
          .then((accepted) {
        print("Accepted permission: $accepted");
      });

      OneSignal.shared
          .promptUserForPushNotificationPermission(fallbackToSettings: true);
    } catch (exception) {}
  }


  void removeTags() {
    print("Removing tags");
    OneSignal.shared.deleteTags(["user_id"]).then((response) {
      print("Successfully removed tags with response: $response");
    }).catchError((error) {
      print("Encountered an error removing tags: $error");
    });
  }
}
