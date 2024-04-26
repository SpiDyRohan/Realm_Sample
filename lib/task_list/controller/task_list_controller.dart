import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realm/realm.dart';
import 'package:realm_sample/models/task_list_model.dart';

class TaskListController extends GetxController{
  var config = Configuration.local([TaskListModel.schema]);
  late Realm realm;
  Rx<TimeOfDay> selectTime=TimeOfDay.fromDateTime(DateTime.now()).obs;
  TextEditingController taskNameController =TextEditingController();
  late Rx<RealmResults<TaskListModel>> taskList;



  @override
  void onInit() {
    super.onInit();
    realm = Realm(config);
    taskList = Rx<RealmResults<TaskListModel>>(realm.all<TaskListModel>());
    print("taskList ${taskList.value.length}");
  }
  void addTask() {
    try {
      realm.write(() {
        realm.add(TaskListModel(taskNameController.text, "${selectTime.value.hour} : ${selectTime.value.minute} "));
      });
      taskList.value = realm.all<TaskListModel>();
      Get.snackbar("Success", "Task Added",backgroundColor: Colors.green,colorText: Colors.white);
    } catch (error) {
      Get.snackbar("Error", error.toString(),backgroundColor: Colors.red,colorText: Colors.white);
    } finally {
      taskNameController.clear();
      Get.close(1);
    }
  }
  void deleteItem(TaskListModel itemToDelete) {
    realm.write(() {
      realm.delete(itemToDelete);
    });
    taskList.value = realm.all<TaskListModel>();
    Get.snackbar("Success", "Task Deleted!!",backgroundColor: Colors.green,colorText: Colors.white);
  }


}