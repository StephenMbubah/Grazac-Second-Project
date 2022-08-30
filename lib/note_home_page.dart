
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_x/add_note.dart';
import 'package:note_x/edit_note.dart';

class NoteHomePage extends StatefulWidget {
  const NoteHomePage({Key? key}) : super(key: key);


  @override
  State<NoteHomePage> createState() => _NoteHomePageState();
}

class _NoteHomePageState extends State<NoteHomePage> {
  final ref= FirebaseFirestore.instance.collection('notes');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
      backgroundColor: Colors.black87,
      centerTitle: true,
      title: const Text(
            "NotaBen", style: TextStyle(fontSize: 20,color: Colors.white),),
      actions: [
        TextButton(onPressed: (){},
            child: Icon(Icons.search,color: Colors.white,),),
      ],
    ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white54,
        child:const Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNote()));
        },
      ),
      body: StreamBuilder(
        stream: ref.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot>snapshot) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,
                childAspectRatio: 2 ),
                itemCount: snapshot.hasData?snapshot.data!.docs.length:0,
                itemBuilder: (_,index){
              return notecard(()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> EditNote(docToEdit: snapshot.data!.docs[index],))), snapshot.data!.docs[index]['title'], snapshot.data!.docs[index]['description'], context);
                }),
          );
        }
      ),
    );
  }
}

 Widget notecard( Function onTap,String title, String description,BuildContext context){
  return GestureDetector(
    onTap: (){
      onTap();
    },
    child: Container(
      height: 20,
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Text(title, textAlign: TextAlign.start,),
          const Divider(
            color: Colors.black,
            thickness: 2,
          ),
          Text(description, textAlign: TextAlign.start,)
        ],
      ),
    ),
  );
 }
