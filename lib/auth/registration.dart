import 'package:flutter/material.dart';
import 'package:ugrr/auth/auth_function.dart';
import 'package:ugrr/auth/login.dart';
import 'package:ugrr/colors.dart';

class RegisterationScreen extends StatefulWidget {
  const RegisterationScreen({Key key}) : super(key: key);

  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  final TextEditingController nameTextEditingController =
      TextEditingController();

  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Register",
          style: TextStyle(
            color: Color.fromARGB(255, 182, 149, 2),
          ),
        ),
        leading: IconButton(
          color: Color.fromARGB(255, 182, 149, 2),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 50),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/preload.gif',
                      height: 170,
                      width: 370,
                      fit: BoxFit.cover,
                      // width: double.maxFinite,
                    ),
                    SizedBox(height: 60),
                    TextFormField(
                      style: TextStyle(color: primaryColorO),
                      cursorColor: accentColor,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 3) {
                          return 'Please enter 3+ text';
                        }
                        return null;
                      },
                      controller: nameTextEditingController,
                      decoration: InputDecoration(
                        hintText: "Enter Your Name",
                        filled: true,
                        fillColor: Colors.white38,
                        hintStyle: TextStyle(
                          color: accentColor,
                          fontSize: 12,
                          letterSpacing: 1.5,
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      style: TextStyle(color: primaryColorO),
                      cursorColor: accentColor,
                      validator: (value) => validateEmail(value),
                      controller: emailTextEditingController,
                      decoration: InputDecoration(
                        hintText: "Enter Your Email",
                        filled: true,
                        fillColor: Colors.white38,
                        hintStyle: TextStyle(
                          color: accentColor,
                          fontSize: 12,
                          letterSpacing: 1.5,
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      style: TextStyle(color: primaryColorO),
                      cursorColor: accentColor,
                      obscureText: _isHidden,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 6) {
                          return 'Please enter 6+ text';
                        }
                        return null;
                      },
                      controller: passwordTextEditingController,
                      decoration: InputDecoration(
                        suffix: InkWell(
                          onTap: _togglePasswordView,
                          child: Icon(
                            _isHidden ? Icons.visibility : Icons.visibility_off,
                            size: 18,
                          ),
                        ),
                        hintText: "Enter Password",
                        filled: true,
                        fillColor: Colors.white38,
                        hintStyle: TextStyle(
                          color: accentColor,
                          fontSize: 12,
                          letterSpacing: 1.5,
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: Color.fromARGB(255, 182, 149, 2),
                      ),
                      child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            print("onPressed active");
                            AuthClass.register(
                              context,
                              nameTextEditingController.text.trim(),
                              emailTextEditingController.text.trim(),
                              passwordTextEditingController.text.trim(),
                            );
                          }
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
