import 'package:hive/hive.dart';
part 'notesModal.g.dart';

@HiveType(typeId: 0)
class NoteApp {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? description;
  NoteApp({
    required this.title,
    required this.description,
  });
}
