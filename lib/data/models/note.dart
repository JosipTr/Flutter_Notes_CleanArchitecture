import 'package:floor/floor.dart';

@entity
class Note {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String title;
  String description;

  Note({this.id, required this.title, required this.description});

  void setTitle(String title) {
    this.title = title;
  }

  void setDescription(String description) {
    this.description = description;
  }
}