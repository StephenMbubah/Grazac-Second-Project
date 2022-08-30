import 'package:flutter/material.dart';

TextField reuseableTextField(String text, IconData icon,bool isPasswordType, TextEditingController controller){
  return TextField(
   controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.black54,
    style: TextStyle(color: Colors.black54.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.black54
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.black54.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior:FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide:  BorderSide(width: 0, style: BorderStyle.none)
      ),
    ),
    keyboardType: isPasswordType
      ? TextInputType.visiblePassword
      :TextInputType.emailAddress,

  );
}

signInsignUpButton(BuildContext context,bool isLogin, Function onTap){
  return Container(
    height: 50,
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.fromLTRB(0, 10, 20, 0),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: (){
        onTap();
      },
      child: Text(
        isLogin ? 'Log IN' : 'SIGN UP',
        style:const  TextStyle(
          color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if(states.contains(MaterialState.pressed)){
            return Colors.black26;
          }
          return Colors.white;
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))
      ),
    ),

  );
}
