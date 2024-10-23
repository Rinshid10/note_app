import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app/modal/notesModal.dart';

ValueNotifier<List<NoteApp>> noteapplister = ValueNotifier([]);
Future AddNoteApp(NoteApp value) async {
  final notsDb = await Hive.openBox<NoteApp>('save_data');
  notsDb.add(value);
  noteapplister.value.add(value);
  noteapplister.notifyListeners();
}

Future getAllNotes() async {
  final notsDb = await Hive.openBox<NoteApp>('save_data');
  noteapplister.value.clear();
  noteapplister.value.addAll(notsDb.values);
  noteapplister.notifyListeners();
}
