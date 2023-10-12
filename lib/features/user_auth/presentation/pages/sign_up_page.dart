
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:untitled2/features/user_auth/presentation/pages/login_page.dart';
import 'package:untitled2/features/user_auth/presentation/widgets/form_container_widget.dart';

import '../../firebase_auth_implementation/firebase_auth_services.dart';
import '../widgets/form_container_widget.dart';
import 'login_page.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFCAC19A),
        title: Text("SignUp",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),),
      ),
      body: Container(
        color: Color(0xFFF1EBD1),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                  "images/laygirl.png", // Replace with your image path
                   width: 350.0, // Set the width as needed
                   height: 350.0, // Set the height as needed
                   ),

                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: FormContainerWidget(
                      controller: _usernameController,
                      hintText: "Username",
                      isPasswordField: false,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: FormContainerWidget(
                      controller: _emailController,
                      hintText: "Email",
                      isPasswordField: false,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: FormContainerWidget(
                      controller: _passwordController,

                      hintText: "Password",
                      isPasswordField: true,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: _signUp,
                    child: Container(
                      width: 100,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color(0xFF0CA8BC).withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
                          )),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      SizedBox(width: 5,),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context, MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
                          },
                          child: Text("Login", style: TextStyle(color: Color(0xFF0CA8BC).withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 18),))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if (user!= null){
      print("User is successfully created");
      Navigator.pushNamed(context, "/home");
    } else{
      print("Some error happend");
    }

  }

}
