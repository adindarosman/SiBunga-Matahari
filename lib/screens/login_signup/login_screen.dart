import 'package:SiBunga/core/core.dart';
import 'package:SiBunga/screens/login_signup/firebase_auth_services.dart';
import 'package:SiBunga/screens/login_signup/form_container_widget.dart';
import 'package:SiBunga/screens/login_signup/signup_screen.dart';
import 'package:SiBunga/screens/login_signup/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isSignin = false;

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
        backgroundColor: Colors.white,
        body: Container(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 10.0, 0, 3.0),
                    child: Text(
                      'SI BUNGA MATAHARI',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF282828),
                        fontFamily: 'Poppins',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(3.0, 0.0, 3.0, 3.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'S',
                            style: TextStyle(
                              color: Color(0xFFFECB00),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              height: 1.5,
                            ),
                          ),
                          TextSpan(
                            text: 'ISTEM ',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              height: 1.5,
                            ),
                          ),
                          TextSpan(
                            text: 'I',
                            style: TextStyle(
                              color: Color(0xFFFECB00),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              height: 1.5,
                            ),
                          ),
                          TextSpan(
                            text: 'NTEGRASI PERTUM',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              height: 1.5,
                            ),
                          ),
                          TextSpan(
                            text: 'BU',
                            style: TextStyle(
                              color: Color(0xFFFECB00),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              height: 1.5,
                            ),
                          ),
                          TextSpan(
                            text: 'HAN, PERKEMBANGA',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              height: 1.5,
                            ),
                          ),
                          TextSpan(
                            text: 'NGA',
                            style: TextStyle(
                              color: Color(0xFFFECB00),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              height: 1.5,
                            ),
                          ),
                          TextSpan(
                            text: 'N, DAN PE',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              height: 1.5,
                            ),
                          ),
                          TextSpan(
                            text: 'MA',
                            style: TextStyle(
                              color: Color(0xFFFECB00),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              height: 1.5,
                            ),
                          ),
                          TextSpan(
                            text: 'N',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              height: 1.5,
                            ),
                          ),
                          TextSpan(
                            text: 'TA',
                            style: TextStyle(
                              color: Color(0xFFFECB00),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              height: 1.5,
                            ),
                          ),
                          TextSpan(
                            text: 'UAN KESE',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              height: 1.5,
                            ),
                          ),
                          TextSpan(
                            text: 'HA',
                            style: TextStyle(
                              color: Color(0xFFFECB00),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              height: 1.5,
                            ),
                          ),
                          TextSpan(
                            text: 'TAN DI',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              height: 1.5,
                            ),
                          ),
                          TextSpan(
                            text: 'RI',
                            style: TextStyle(
                              color: Color(0xFFFECB00),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 3, 0, 5),
                    child: Text(
                      'PUSKESMAS MENTENG',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF282828),
                        fontFamily: 'Poppins',
                        letterSpacing: 1,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/matahari.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 10),
                    child: Form(
                      child: Column(
                        children: [
                          FormContainerWidget(
                            controller: _emailController,
                            hintText: "Email",
                            isPasswordField: false,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          FormContainerWidget(
                            controller: _passwordController,
                            hintText: "Kata Sandi",
                            isPasswordField: true,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          GestureDetector(
                            onTap: _signIn,
                            child: Container(
                              width: double.infinity,
                              height: 35.0,
                              decoration: BoxDecoration(
                                color: AppColors.secondaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Belum punya akun?",
                                style: TextStyle(
                                  color: Colors
                                      .black, // Set the text color to black
                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignUpPage(),
                                    ),
                                    (route) => false,
                                  );
                                },
                                child: Text(
                                  "Buat Akun",
                                  style: TextStyle(
                                    color: AppColors.secondaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ]))));
  }

  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      showToast(message: "User is succesfully Sign In");
      Navigator.pushNamed(context, "/home");
    } else {
      showToast(message: "Error Sign In page");
    }
  }
}
