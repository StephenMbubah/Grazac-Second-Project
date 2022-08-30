
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_x/login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
           const SizedBox(
              height: 150,
            ),
            Container(
              height: 100,
              width: 50,
              child: Image.asset('assets/images/notepad_icon.png'),
            ),
            const SizedBox(
              height: 13,
            ),
            const Text("WELCOME TO", style: TextStyle(fontSize: 20),),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("N", style: TextStyle(fontSize: 40, color: Colors.red, fontWeight: FontWeight.w700),),
                  Text("0", style: TextStyle(fontSize: 40,color: Colors.white24)),
                  Text("T", style: TextStyle(fontSize: 50),),
                  Text("A", style: TextStyle(fontSize: 40, color: Colors.brown),),
                  Text("B", style: TextStyle(fontSize: 50),),
                  Text("E", style: TextStyle(fontSize: 40,color: Colors.white54),),
                  Text("N", style: TextStyle(fontSize: 40),),
                ],
              ),
            ),
            const Text("A quick and easy way to note your ideas", style: TextStyle(fontSize: 20),),
            const SizedBox(
              height: 230,
            ),

            GestureDetector(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  const loginPage()));
              },
              child: Center(
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), shape: BoxShape.rectangle,color: Colors.white ),
                  child: Center(child: Text("Get Started", style: TextStyle( fontWeight: FontWeight.w500, color: Colors.black, fontSize: 20),)),
                ),
              ),
            )

          ],
        ),
      ),

    );
  }
}
