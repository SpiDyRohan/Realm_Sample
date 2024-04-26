import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:realm_sample/task_list/controller/task_list_controller.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final controller = Get.put(TaskListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => ListView.builder(
              shrinkWrap: true,
              itemCount: controller.taskList.value.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(controller.taskList.value[index].taskName+" at "+controller.taskList.value[index].taskTime),
                  // leading: Text(),
                  trailing: GestureDetector(
                      onTap: () {
                        controller.deleteItem(controller.taskList.value[index]);
                      },
                      child: Icon(Icons.delete)),
                );
              },
            )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: Get.width,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextField(
                        controller: controller.taskNameController,
                        decoration:
                            InputDecoration(hintText: "Enter Task Name"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                          onTap: () async {
                            FocusManager.instance.primaryFocus!.unfocus();
                            controller.selectTime.value = (await showTimePicker(
                              context: context,
                              initialTime: controller.selectTime.value,
                            ))!;
                          },
                          child: Obx(() => Text("Select Date:- " +
                              "${controller.selectTime.value.hour}  : ${controller.selectTime.value.minute}  ${controller.selectTime.value.period.name.toUpperCase()}"))),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if(controller.taskNameController.text!=""){
                              controller.addTask();
                            }else{
                              Get.snackbar("Error", "Fields Are Required",backgroundColor: Colors.red,colorText: Colors.white);
                            }
                          },
                          child: Text("Add Task"))
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
