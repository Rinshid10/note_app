import 'package:flutter/material.dart';
import 'package:note_app/addNots.dart';
import 'package:note_app/database/functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getAllNotes();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => AddNots()));
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'SaveNots',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: ValueListenableBuilder(
        valueListenable: noteapplister,
        builder: (context, datas, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final data = datas[index];
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  color: Colors.yellow[100],
                  child: ListTile(
                    title: Text(data.title.toString().toUpperCase(),
                        style: TextStyle(color: Colors.black)),
                  ),
                ),
              );
            },
            itemCount: datas.length,
          );
        },
      ),
    );
  }
}
