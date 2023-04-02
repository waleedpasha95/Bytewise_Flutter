// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_task8/boxes/boxes.dart';
import 'package:flutter_application_task8/models/notes_model.dart';
// ignore: unused_import
import 'package:hive_flutter/adapters.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Hive Database'),
      ),

      body: ValueListenableBuilder<Box<NotesModel>>(

        valueListenable: Boxes.getData().listenable(),
        builder: (context,box,_){

          var data = box.values.toList().cast<NotesModel>();

          return ListView.builder(

            

            itemCount: box.length,
            itemBuilder: (context, index){
              return Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Column(
                
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                
                    children: [
                
                      Text(data[index].title.toString()),
                      Text(data[index].description.toString()),
                      
                    ],
                  ),
                ),
              );
            }
            );
        },
      ),

      floatingActionButton: FloatingActionButton(
        
        // ignore: duplicate_ignore
        onPressed: () async{
          _showMyDialogue();

        },
        child:const Icon(Icons.add),
        
        ),


    );
  }

  Future<void> _showMyDialogue() async{

    return showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
         title: const Text('Add Notes'),
         content: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField( 
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: 'Enter TItle',
                  border: OutlineInputBorder()
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField( 
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Enter Description',
                  border: OutlineInputBorder()
                ),
              )
            ],
          )
         ),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text('Cancel')),


            TextButton(onPressed: (){

              final data = NotesModel(title:titleController.text,
              description: descriptionController.text);


              final box = Boxes.getData();
              box.add(data);

             // data.save();

              print(box);
              titleController.clear();
              descriptionController.clear();

              
              Navigator.pop(context);
            }, child: const Text('ADD')),
          ],


        );

      }
      
      );

  }
}