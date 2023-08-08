import 'package:flutter/material.dart';
import 'package:tuneinheartapplication/Utilities/color_constant.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String number="+917560911122";
    String mail="info@cocoalabs.in";
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: ColorConstant.pink500,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/app_logo.png",height:80,width: 130,),
              Image.asset("assets/images/logo name-06.png",height:50,width: 130,),
              SizedBox(height: 15),
              Text(
                'Welcome to Tuneinheart! We are dedicated to providing you with the best radio experience on your mobile device. Our app allows you to listen to a wide range of radio stations from around the world, offering diverse music, news, and entertainment content.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Our Team',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Tuneinheart is developed and maintained by a passionate team of developers and designers who are committed to delivering a seamless and enjoyable radio experience to our users.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'If you have any questions, feedback, or suggestions, we would love to hear from you. Feel free to contact us at:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: ()=> launch("mailto:$mail"),
                child: Text(mail,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      fontSize:18.0),
                ),
              ),
              Text("OR"),
              InkWell(
                onTap: ()=>launch("tel: $number"),
                child: Text(
                  number,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
