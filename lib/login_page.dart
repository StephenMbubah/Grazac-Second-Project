
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_x/note_home_page.dart';
import 'package:note_x/sign_up_screen.dart';
import 'package:note_x/widgets.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController _passwordTextController= TextEditingController();
  TextEditingController _emailTextController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset("assets/images/notepad_icon.png"),
            const SizedBox(
              height: 12,
            ),
            const Text("let's take down some notes", style: TextStyle(fontSize: 20,color: Colors.red),),
            const SizedBox(
              height: 170,
            ),
            reuseableTextField("Enter Email",Icons.person_outline_rounded , false, _emailTextController),
            const SizedBox(
              height: 20,
            ),
            reuseableTextField("Enter Password",Icons.lock_outline , true, _passwordTextController),
            signInsignUpButton(context, true, (){
              FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailTextController.text,
                  password: _passwordTextController.text)
                  .then((value) {
                print("Account Logged In");
                Navigator.push(context, MaterialPageRoute(builder: (context)=> NoteHomePage()));
              }
              ).onError((error, stackTrace) {
                print("Error${error.toString()}");
              } );
            }),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const Text("Don't have an account?", style: TextStyle(color: Colors.black26),),
                GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
                    },
                    child:const  Text("Sign up", style: TextStyle(color: Colors.blue),))
              ],
            ),

          ],
        ),
      ),
    );
  }
}
