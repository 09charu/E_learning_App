
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:untitled2/features/user_auth/presentation/widgets/form_container_widget.dart';

import '../../firebase_auth_implementation/firebase_auth_services.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _isSigning = false;



  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFCAC19A),
        title: Text("Login",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),),
      ),
      body: Container(
        color: Color(0xFFF1EBD1),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Text(
                  //   "Login",
                  //   style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  // ),
                  Image.asset(
                    "images/chairsitgirl.png", // Replace with your image path
                    width: 350.0, // Set the width as needed
                    height: 350.0, // Set the height as needed
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: FormContainerWidget(
                      controller: _emailController,
                      hintText: "Email",
                      isPasswordField: false,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: FormContainerWidget(
                      controller: _passwordController,
                      hintText: "Password",
                      isPasswordField: true,
                    ),
                  ),
                  SizedBox(height: 30,),
                  GestureDetector(
                    onTap: _signIn,
                    child: Container(
                      width: 100,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color(0xFF0CA8BC).withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child:Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 17),)),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",
                      style: TextStyle(
                        fontSize: 15,
                      ),),
                      SizedBox(width: 5,),
                      GestureDetector(
                          onTap: (){
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SignUpPage()), (route) => false);
                          },
                          child: Text("Sign Up",style: TextStyle(color: Color(0xFF0CA8BC).withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 18),))
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

  void _signIn() async {

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user!= null){
      print("User is successfully signedIn");
      Navigator.pushNamed(context, "/home");
    } else{
      print("Some error happend");
    }

  }
}
