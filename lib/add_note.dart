
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddNote extends StatelessWidget {

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  CollectionReference ref= FirebaseFirestore.instance.collection('notes');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          TextButton(onPressed: (){
            ref.add({
              'title': title.text,
              'description': description.text
            }).whenComplete(() => Navigator.pop(context));
          }, child: const Text("Save",style: TextStyle(color: Colors.white),)),

        ],
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: title,
                decoration: const InputDecoration(hintText: ("Title")),),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child:  TextField(
                  controller: description,
                  maxLength: 500,
                  maxLines: null,
                  expands: true,
                  decoration:const  InputDecoration(hintText: ("Input Note")),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
