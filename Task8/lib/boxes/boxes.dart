

import 'package:flutter_application_task8/models/notes_model.dart';
import 'package:hive/hive.dart';

class Boxes{

  static Box<NotesModel> getData() => Hive.box<NotesModel>('notes');


}