import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class loginauth extends StatefulWidget {
  @override
  State<loginauth> createState() => _loginauthState();
}

class _loginauthState extends State<loginauth> {
  TextEditingController phoneController = TextEditingController();

  // Function to send OTP
  Future<void> sendOtp(String isd, String phoneNumber, String timezone) async {
    // final url = Uri.parse('https://your-api-base-url.com/api/v1/service-customer-otp-generation/');
    // final url = Uri.parse('https://your-api-base-sendotp.com/api/v1/service-customer-otp-generation/');
    final url = Uri.parse('https://api.example.com/api/v1/service-customer-otp-generation/');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'isd': isd,
        'phone_number': phoneNumber,
        'timezone': timezone,
      }),
    );

    if (response.statusCode == 200) {
      // Handle success
      print('OTP sent successfully');
    } else {
      // Handle error
      print('Failed to send OTP: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Image.asset(
                  'images/img_splash.png',
                  height: 200,
                  width: 260,
                ),
              ),
              SizedBox(height: 30),
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Hello",
                              style: TextStyle(color: Colors.green, fontSize: 30),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "there!",
                              style: TextStyle(fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.only(right: 100.0),
                        child: Text(
                          "Enter Mobile Number",
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 290,
                        child: IntlPhoneField(
                          controller: phoneController,
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                          initialCountryCode: 'IN',
                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String isd = '91'; // Default ISD code, you may change this based on your requirement
                  String phoneNumber = phoneController.text;
                  String timezone = 'Asia/Kolkata'; // Default timezone, adjust as needed

                  // Call the sendOtp function when the button is pressed
                  sendOtp(isd, phoneNumber, timezone);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 130, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(color: Colors.white),
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
