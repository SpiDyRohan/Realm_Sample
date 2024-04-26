import 'package:realm/realm.dart';  // import realm package

part 'task_list_model.realm.dart'; // declare a part file.

@RealmModel() // define a data model class named `_Car`.
class _TaskListModel {
  late String taskName;
  late String taskTime;

}