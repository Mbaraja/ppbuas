import 'package:flutter/material.dart';
import 'package:bar_app/provider/auth_provider.dart';
import 'package:bar_app/widget/imgpick/imgpick_widget.dart';
import 'package:bar_app/widget/textfield/textfield_email_widget.dart';
import 'package:bar_app/widget/textfield/textfield_pass_widget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var loadAuth = Provider.of<AuthProvider>(context);
    return Container(
      color: Colors.white, // Set background color to white for light theme
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/light_pattern.jpg"), // Change to a light-themed image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 4 - 20,
                decoration: BoxDecoration(
                  color: Colors.white, // Set background color to white
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue, // Change to a lighter shadow color
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  const Spacer(),
                  Container(
                    height: MediaQuery.of(context).size.height / 4 - 20,
                    decoration: BoxDecoration(
                      color: Colors.white, // Set background color to white
                      borderRadius: BorderRadius.only(topRight: Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue, // Change to a lighter shadow color
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, -5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      loadAuth.islogin ? "Login" : "Register",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
                        color: Colors.black, // Set text color to black
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey, // Set background color to white
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue, // Change to a lighter shadow color
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Form(
                        key: loadAuth.form,
                        child: Column(
                          children: [
                            if (!loadAuth.islogin) ImagePickWidget(),
                            TextfieldEmailWidget(controller: email),
                            const SizedBox(
                              height: 15,
                            ),
                            TextfieldPasswordWidget(controller: password),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                onPressed: () {
                                  loadAuth.submit();
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue, // Change to a lighter primary color
                                ),
                                child: Text(
                                  loadAuth.islogin ? "Login" : "Register",
                                  style: TextStyle(color: Colors.black), // Set text color to white
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  loadAuth.islogin = !loadAuth.islogin;
                                });
                              },
                              style: TextButton.styleFrom(
                                primary: Colors.blue, // Change to a lighter primary color
                              ),
                              child: Text(
                                loadAuth.islogin ? "Create account" : "I already have an account",
                                style: TextStyle(color: Colors.black), // Set text color to black
                              ),
                            ),
                          ],
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
}
