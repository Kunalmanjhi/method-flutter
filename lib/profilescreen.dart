import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class profileScreen extends StatefulWidget {
  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  TextEditingController phoneController = TextEditingController();

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
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20.0, top: 10.0, right: 400.0),
                        child: Icon(Icons.arrow_back),
                      ),
                      SizedBox(height: 10),
                      // Profile Image and Rating
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('images/profile_image.png'),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 10.0,),
                            Text(
                              "My Rating",
                              style: TextStyle(fontSize: 18, ),
                            ),
                            RatingBar.builder(
                              initialRating: 3.6,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 0.5),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.green,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                              itemSize: 24,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "3.60",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      // Form for User Details
                      Form(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text("First Name"),
                                    Expanded(
                                      child: TextFormField(
                                        initialValue: "Sharma",
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(width: 10),
                                Text("Last Name"),
                                Expanded(
                                  child: TextFormField(
                                    initialValue: "Sharma",
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0), // Padding(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Email", style: TextStyle(fontSize: 20),),
                                  SizedBox(height:10),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white, // Background color of the input field
                                      borderRadius: BorderRadius.circular(20), // Rounded corners
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5), // Shadow color
                                          spreadRadius: 2, // How wide the shadow should spread
                                          blurRadius: 7,   // How blurry the shadow should be
                                          offset: Offset(0, 3), // Horizontal and vertical offset of the shadow
                                        ),
                                      ],
                                    ),

                                    child: TextFormField(
                                      initialValue: "sumit@gmail.com",
                                      style: TextStyle(
                                        color: Colors.grey, // Text color
                                      ),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20), // Match border radius
                                          borderSide: BorderSide.none, // No visible border
                                        ),
                                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16), // Padding inside the field
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            // Mobile text field
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0), // Padding(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Mobile", style: TextStyle(fontSize: 20),),
                                  SizedBox(height:10),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white, // Background color of the input field
                                      borderRadius: BorderRadius.circular(20), // Rounded corners
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5), // Shadow color
                                          spreadRadius: 2, // How wide the shadow should spread
                                          blurRadius: 7,   // How blurry the shadow should be
                                          offset: Offset(0, 3), // Horizontal and vertical offset of the shadow
                                        ),
                                      ],
                                    ),

                                    child: TextFormField(
                                      initialValue: "+91-8973006700",
                                      style: TextStyle(
                                        color: Colors.grey, // Text color
                                      ),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20), // Match border radius
                                          borderSide: BorderSide.none, // No visible border
                                        ),
                                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16), // Padding inside the field
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 40),
                          ],
                        ),
                      )

                      // Form(
                      //   child: Column(
                      //     children: [
                      //       Row(
                      //         children: [
                      //           Text("First Name"),
                      //           Expanded(
                      //             child: TextFormField(
                      //               initialValue: "Sumit",
                      //               decoration: InputDecoration(
                      //                 // labelText: 'First Name',
                      //                 border: OutlineInputBorder(),
                      //               ),
                      //             ),
                      //           ),
                      //           SizedBox(width: 10),
                      //           Text("Last Name"),
                      //           Expanded(
                      //             child: TextFormField(
                      //               initialValue: "Sharma",
                      //               decoration: InputDecoration(
                      //                 // labelText: 'Last Name',
                      //                 border: OutlineInputBorder(),
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //       SizedBox(height: 20),
                      //       Padding(
                      //         padding: const EdgeInsets.only(bottom: 20.0, left: 15.0, right: 15.0),
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Text("Email", style: TextStyle(fontSize: 20),),
                      //             SizedBox(height:10),
                      //             TextFormField(
                      //               initialValue: "sumit@gmail.com",style: TextStyle(
                      //               color: Colors.grey, // Set the text color to gray
                      //             ),
                      //               decoration: InputDecoration(
                      //                 // labelText: 'Email',
                      //                 border: OutlineInputBorder(),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //
                      //       SizedBox(height: 0),
                      //       Padding(
                      //         padding: const EdgeInsets.only(bottom: 20.0, left: 15.0, right: 15.0),
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Text("Mobile", style: TextStyle(fontSize: 20),),
                      //             SizedBox(height:10),
                      //             TextFormField(
                      //               initialValue: "+91-8973006700",style: TextStyle(
                      //               color: Colors.grey, // Set the text color to gray
                      //             ),
                      //
                      //               decoration: InputDecoration(
                      //                 // labelText: 'Mobile',
                      //                 border: OutlineInputBorder(
                      //                   borderRadius: BorderRadius.circular(15),
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       // TextFormField(
                      //       //   initialValue: "+91-8973006700",
                      //       //   decoration: InputDecoration(
                      //       //     // labelText: 'Mobile',
                      //       //     border: OutlineInputBorder(),
                      //       //   ),
                      //       // ),
                      //       SizedBox(height: 40),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Background color of the button
                  padding: EdgeInsets.symmetric(horizontal: 130, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Update',
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
