import 'package:flutter/material.dart';

void main() {
  runApp(AboutUsPage());
}

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFCAC19A),
          title: Text('About Us',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),),
        ),
        body: AboutUsScreen(),
      ),
    );
  }
}

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20.0),
          Text(
            'Welcome to Your E-Learning App',
            style: TextStyle(
              fontSize: 22,

            ),
          ),
          SizedBox(height: 18.0),
          Text(
            'At Your E-Learning App, we are dedicated to providing a world-class learning experience for our users.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Our Mission',
            style: TextStyle(
              fontSize: 18,

            ),
          ),
          Text(
            'To make education accessible, engaging, and effective for learners of all ages and backgrounds.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'What We Offer',
            style: TextStyle(
              fontSize: 18,

            ),
          ),
          Text(
            '1. Diverse Courses\n2. Interactive Learning\n3. Expert Instructors\n4. Flexibility\n5. Community',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Our Commitment',
            style: TextStyle(
              fontSize: 18,

            ),
          ),
          Text(
            'We are dedicated to maintaining the highest standards of quality and innovation in education.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 40.0),
          // Text(
          //   'Thank you for choosing Your E-Learning App as your preferred destination for learning.',
          //   style: TextStyle(
          //     fontSize: 16,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Center(
              child: Row(
                children: [
                  Container(
                    child: Image.asset(
                      'images/happy3.gif',
                      height: 100,
                      width: 100,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Image.asset(
                      'images/happy3.gif',
                      height: 100,
                      width: 100,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Image.asset(
                      'images/happy3.gif',
                      height: 100,
                      width: 100,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
