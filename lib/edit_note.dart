
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditNote extends StatefulWidget {
  DocumentSnapshot docToEdit;
  EditNote({ required this.docToEdit});
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  void initState(){
    title= TextEditingController(text: widget.docToEdit['title']);
    description= TextEditingController(text: widget.docToEdit['description']);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          TextButton(onPressed: (){
            widget.docToEdit.reference.update({
              'title': title.text,
              'description': description.text
            }).whenComplete(() => Navigator.pop(context));
          }, child: const Text("Save",style: TextStyle(color: Colors.white),)),

          TextButton(onPressed: (){
            widget.docToEdit.reference.delete().whenComplete(() => Navigator.pop(context));
          }, child: const Text("Delete",style: TextStyle(color: Colors.red),)),
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
                  decoration:const  InputDecoration(hintText: ("Description")),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
