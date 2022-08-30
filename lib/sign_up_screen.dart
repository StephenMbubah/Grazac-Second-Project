
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_x/login_page.dart';
import 'package:note_x/note_home_page.dart';
import 'package:note_x/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController= TextEditingController();
  TextEditingController _emailTextController= TextEditingController();
  TextEditingController _firstNameTextController= TextEditingController();
  TextEditingController _lastNameTextController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> loginPage()));
                  },
                    child: const Icon(Icons.arrow_back)),
                const SizedBox(
                  width: 25,
                ),
                Text("Sign Up", style: TextStyle(fontSize: 20),)
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            reuseableTextField("Enter Firstname", Icons.person_outline, false, _firstNameTextController),
            const SizedBox(
              height: 20,
            ),
            reuseableTextField("Enter Lastname", Icons.person_outline, false, _lastNameTextController),
            const SizedBox(
              height: 20,
            ),
            reuseableTextField("Enter Email", Icons.email, false, _emailTextController),
            const SizedBox(
              height: 20,
            ),
            reuseableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: (){
                FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailTextController.text,
                    password: _passwordTextController.text)
                    .then((value) {
                  print("Created New Account");
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> NoteHomePage()));
                }
                ).onError((error, stackTrace) {
                  print("Error${error.toString()}");
                } );
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                child: Center(child: const Text("SIGN UP", style: TextStyle(fontWeight: FontWeight.bold),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
