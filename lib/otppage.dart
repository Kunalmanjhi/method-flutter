
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class otpPage extends StatefulWidget {
  @override
  State<otpPage> createState() => _otpPageState();
}

class _otpPageState extends State<otpPage> {
  TextEditingController phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300], // Set the background color to a light grey
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 17.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  height: 600,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      // borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20.0, top: 30.0 , right: 400.0),
                        child: Icon(Icons.arrow_back),
                      ),
                      SizedBox(height: 40,),
                      Padding(
                        padding: const EdgeInsets.only(right: 40.0),
                        child: Text("We have sent a 4 digit OTP on", style: TextStyle(fontSize: 20.0, color: Colors.black),),
                      ),
                      SizedBox(height: 20,),
                      // Container(
                      //   width: 290,
                      //   child: IntlPhoneField(
                      //     controller: phoneController,
                      //     decoration: InputDecoration(
                      //       labelText: 'Phone Number',
                      //       border: OutlineInputBorder(
                      //         borderSide: BorderSide(),
                      //       ),
                      //     ),
                      //     initialCountryCode: 'IN',
                      //     onChanged: (phone) {
                      //       print(phone.completeNumber);
                      //     },
                      //   ),
                      // )
                      // You can add other content here, which will appear below the text
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0, left: 20.0),
                        child: Text("Enter the OTP below to verify your number", style: TextStyle(fontSize: 17.0, color: Colors.grey),),
                      ),


                    ],

                  ),

                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // await FirebaseAuth.instance.verifyPhoneNumber(verificationCompleted: )// Handle button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Background color of the button
                  padding: EdgeInsets.symmetric(horizontal: 130, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(color: Colors.white ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 20);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(3 * size.width / 4, size.height - 40);
    var secondEndPoint = Offset(size.width, size.height - 20);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 20);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}