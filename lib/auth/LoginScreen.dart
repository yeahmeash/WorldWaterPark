import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../controllers/LoginController.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffddeff7), // Light blue background
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 80),

              // Welcome Text above the logo
              Text(
                "Welcome to",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff003366), // Dark blue color
                ),
              ),
              SizedBox(height: 4),

              // Logo with reduced size
              Image.asset(
                'assets/images/logo.png',
                height: 120, // Reduced from 150 to 120 for a professional look
              ),
              SizedBox(height: 20),

              // "Sign in" Text
              Text(
                "Sign in",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff003366), // Dark blue
                ),
              ),
              SizedBox(height: 20),

              // Email Input
              // TextField(
              //   decoration: InputDecoration(
              //     labelText: "Enter Email",
              //     labelStyle: TextStyle(color: Colors.black87),
              //     prefixIcon: Icon(Icons.email, color: Colors.black54),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     filled: true,
              //     fillColor: Colors.white,
              //   ),
              //   keyboardType: TextInputType.emailAddress,
              //   onChanged: (value) => controller.email.value = value,
              // ),
              // SizedBox(height: 16),

              // Mobile Number Input without a box design
              IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'Enter Phone Number',
                  labelStyle: TextStyle(color: Colors.black87),
                  prefixIcon: Icon(Icons.phone, color: Colors.black54),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                initialCountryCode: 'US',
                onChanged: (phone) {
                  controller.phoneNumber.value = phone.completeNumber;
                },
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: true, // Hide password input
                decoration: InputDecoration(
                  labelText: "Enter Password",
                  labelStyle: TextStyle(color: Colors.black87),
                  prefixIcon: Icon(Icons.lock, color: Colors.black54), // Change icon to lock
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (value) => controller.password.value = value, // Store password
              ),
              SizedBox(height: 20),


              // Next Button
              Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    colors: [Color(0xffd71920), Color(0xff003366)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {
                    if (controller.phoneNumber.value.isNotEmpty) {
                      Get.toNamed("/userPassword");
                    } else {
                      Get.snackbar("Invalid", "Please enter a valid phone number",
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  },
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              // Signup Option
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ", style: TextStyle(color: Colors.black87)),
                  GestureDetector(
                    onTap: () => Get.toNamed("/userRegister"),
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: Color(0xffd71920),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}