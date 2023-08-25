import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tuneinheartapplication/Utilities/color_constant.dart';
import 'package:tuneinheartapplication/Utilities/size_utils.dart';
import 'package:tuneinheartapplication/Utilities/string_formatter_and_validator.dart';
import 'package:tuneinheartapplication/widgets/app_text_field.dart';
import 'package:tuneinheartapplication/widgets/custom_button.dart';
import 'package:http/http.dart' as http;

class SongRequestFormScreen extends StatefulWidget {
  const SongRequestFormScreen({Key? key}) : super(key: key);

  @override
  State<SongRequestFormScreen> createState() => _SongRequestFormScreenState();
}

class _SongRequestFormScreenState extends State<SongRequestFormScreen> {
  FormatAndValidate formatAndValidate = FormatAndValidate();
  final String apiUrl = 'https://cocoalabs.in/RadioApp/public/api/song/request/store';
  TextFieldControl _songName = TextFieldControl();
  TextFieldControl _language = TextFieldControl();
  TextFieldControl _userName = TextFieldControl();
  TextFieldControl _singerName = TextFieldControl();
  TextFieldControl _albumName = TextFieldControl();
  TextFieldControl _year = TextFieldControl();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Request Song"),
        backgroundColor: ColorConstant.pink500,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "User Name *",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  AppTextBox(
                    textFieldControl: _userName,
                    hintText: 'Enter your name',
                  ),
                  Text(
                    "Song Name *",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  AppTextBox(
                    textFieldControl: _songName,
                    hintText: 'Enter song name',
                  ),
                  Text(
                    "Language (Optional)",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  AppTextBox(
                    textFieldControl: _language,
                    hintText: 'Enter language ',
                    keyboardType: TextInputType.streetAddress,
                  ),
                  Text(
                    "Album Name (Optional)",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  AppTextBox(
                    textFieldControl: _albumName,
                    hintText: 'Enter album name',
                  ),
                  Text(
                    "Singer Name (Optional)",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  AppTextBox(
                    textFieldControl: _singerName,
                    hintText: 'Enter singer name ',
                  ),
                  Text(
                    "Year (Optional)",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  AppTextBox(
                    textFieldControl: _year,
                    hintText: 'Enter year ',
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: CustomButton(
                      height: 45,
                      width: 240,
                      text: "Request Send",
                      onTap: () {
                        _validate();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  _validate() async {
    var user_name = _userName.controller.text;
    var song_name = _songName.controller.text;
    if (formatAndValidate.validateName(user_name) != null) {
      return toastMessage(formatAndValidate.validateName(user_name));
    }  else if (formatAndValidate.validateSong(song_name) != null) {
      return toastMessage(formatAndValidate.validateSong(song_name));
    }
    return await _requestForm(
        _userName.controller.text,
        _songName.controller.text,
        _language.controller.text,
        _albumName.controller.text,
        _singerName.controller.text,
        _year.controller.text);
  }
   _requestForm(
      String? userName, songName, language, album, singerName, year) async {
    Map<String, dynamic> formData = {
      'user_name': userName,
      'song_name': songName,
    };
    if (language != null && language.isNotEmpty) {
      formData['language'] = language;
    }
    if (album != null && album.isNotEmpty) {
      formData['album'] = album;
    }
    if (album != null && album.isNotEmpty) {
      formData['album'] = album;
    }
    if (singerName != null && singerName.isNotEmpty) {
      formData['singer_name'] = singerName;
    }
    if (year != null && year.isNotEmpty) {
      formData['year'] = year;
    }
    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        body: formData,
      );
      if (response!.statusCode == 200) {
        print('Successfully requested');
        print("Response --->${response.body}");
        Fluttertoast.showToast(msg: "Song request sent successfully");
        Navigator.pop(context);
      } else {
        Fluttertoast.showToast(msg: "Song request sent failed");
        print('Failed request');
        // Navigator.pop(context);
      }
    } catch (e) {
      print('Error: $e');
      toastMessage('Something went wrong. Please try again');
    }
  }

}
