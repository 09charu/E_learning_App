import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFCAC19A),
        title: Text('Contact Us',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),),
      ),
      body: Container(
        color: Color(0xFFFFFBF3),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'For any inquiries or support, please feel free to contact us:',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 16.0),
              ListTile(
                leading: Icon(Icons.email_outlined, color: Colors.grey,),
                title: Text('Email'),
                subtitle: Text('info@elearningapp.com'),
                onTap: () => _sendEmail('info@elearningapp.com'),
              ),
              ListTile(
                leading: Icon(Icons.phone_outlined,color: Colors.grey,),
                title: Text('Phone'),
                subtitle: Text('+1 123-456-7890'),
                onTap: () => _callNumber('+11234567890'),
              ),
              ListTile(
                leading: Icon(Icons.location_on_outlined, color: Colors.grey,),
                title: Text('Address'),
                subtitle: Text('123 Main Street, City, Country'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _sendEmail(String email) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Inquiry%20from%20E-Learning%20App',
    );
    String url = params.toString();

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _callNumber(String phoneNumber) async {
    final Uri params = Uri(scheme: 'tel', path: phoneNumber);
    String url = params.toString();

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

