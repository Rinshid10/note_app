import 'package:flutter/material.dart';
import 'package:note_app/database/functions.dart';
import 'package:note_app/homeScreen.dart';
import 'package:note_app/modal/notesModal.dart';

class AddNots extends StatefulWidget {
  const AddNots({super.key});

  @override
  State<AddNots> createState() => _AddNotsState();
}

class _AddNotsState extends State<AddNots> {
  final titileController = TextEditingController();
  final descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: TextField(
                controller: titileController,
                decoration: InputDecoration(
                    hintText: 'enter a title.....',
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white, width: 20))),
              ),
            ),
            Container(
              height: 500,
              margin: EdgeInsets.all(15),
              child: TextField(
                controller: descriptionController,
                expands: true,
                maxLines: null,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                    hintText: 'enter the Description......',
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white, width: 20))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      minimumSize: Size(double.infinity, 50)),
                  onPressed: () {
                    addAndSave();
                  },
                  child: Text(
                    'Save ',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Future addAndSave() async {
    final titleAdd = titileController.text;
    final descriptionAdd = descriptionController.text;
    final addTheValues = NoteApp(title: titleAdd, description: descriptionAdd);
    AddNoteApp(addTheValues);
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => HomeScreen()));
  }
}
