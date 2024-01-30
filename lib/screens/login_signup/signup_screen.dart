import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:SiBunga/core/app_colors.dart';
import 'package:SiBunga/screens/login_signup/firebase_auth_services.dart';
import 'package:SiBunga/screens/login_signup/form_container_widget.dart';
import 'package:SiBunga/screens/login_signup/login_screen.dart';
import 'package:SiBunga/screens/login_signup/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isSignup = false;

  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _namaController = TextEditingController();
  TextEditingController _tempatLahirController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _tanggalLahirController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
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
                            controller: _namaController,
                            hintText: "Nama Lengkap Anak",
                            isPasswordField: false,
                            isDateBirth: false,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          FormContainerWidget(
                            controller: _tempatLahirController,
                            hintText: "Tempat Lahir Anak",
                            isPasswordField: false,
                            isDateBirth: false,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          FormContainerWidget(
                            controller: _tanggalLahirController,
                            hintText: "Tanggal Lahir Anak",
                            isPasswordField: false,
                            isDateBirth: true,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FormContainerWidget(
                            controller: _emailController,
                            hintText: "Email",
                            isPasswordField: false,
                            isDateBirth: false,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FormContainerWidget(
                            controller: _passwordController,
                            hintText: "Kata Sandi",
                            isPasswordField: true,
                            isDateBirth: false,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: _signUp,
                            child: Container(
                              width: double.infinity,
                              height: 45,
                              decoration: BoxDecoration(
                                color: AppColors.secondaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Text(
                                "Buat Akun",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Sudah punya akun?",
                                style: TextStyle(
                                  color: Colors
                                      .black, // Set the text color to black
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()),
                                    (route) => false,
                                  );
                                },
                                child: Text(
                                  "Login",
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

  void _signUp() async {
    String nama = _namaController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String tempatLahir = _tempatLahirController.text;
    String tanggalLahir = _tanggalLahirController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if (user != null) {
      // Convert the String to a DateTime
      DateTime parsedDate = DateTime.parse(tanggalLahir);
      await saveUserDataToFirestore(user.uid, nama, tempatLahir, parsedDate);

      showToast(message: "User is succesfully created");
      Navigator.pushNamed(context, "/home");
    } else {
      showToast(message: "Error sign up page");
    }
  }

  Future<void> saveUserDataToFirestore(String uid, String nama,
      String tempatLahir, DateTime tanggalLahir) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    try {
      await users.doc(uid).set({
        'nama': nama,
        'tempatLahir': tempatLahir,
        'tanggalLahir': tanggalLahir,
        // Add other fields if needed
      });

      print('User data added to Firestore');
    } catch (e) {
      print('Error adding user data to Firestore: $e');
    }
  }
}
