// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class TaskListModel extends _TaskListModel
    with RealmEntity, RealmObjectBase, RealmObject {
  TaskListModel(
    String taskName,
    String taskTime,
  ) {
    RealmObjectBase.set(this, 'taskName', taskName);
    RealmObjectBase.set(this, 'taskTime', taskTime);
  }

  TaskListModel._();

  @override
  String get taskName =>
      RealmObjectBase.get<String>(this, 'taskName') as String;
  @override
  set taskName(String value) => RealmObjectBase.set(this, 'taskName', value);

  @override
  String get taskTime =>
      RealmObjectBase.get<String>(this, 'taskTime') as String;
  @override
  set taskTime(String value) => RealmObjectBase.set(this, 'taskTime', value);

  @override
  Stream<RealmObjectChanges<TaskListModel>> get changes =>
      RealmObjectBase.getChanges<TaskListModel>(this);

  @override
  TaskListModel freeze() => RealmObjectBase.freezeObject<TaskListModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'taskName': taskName.toEJson(),
      'taskTime': taskTime.toEJson(),
    };
  }

  static EJsonValue _toEJson(TaskListModel value) => value.toEJson();
  static TaskListModel _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'taskName': EJsonValue taskName,
        'taskTime': EJsonValue taskTime,
      } =>
        TaskListModel(
          fromEJson(taskName),
          fromEJson(taskTime),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(TaskListModel._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, TaskListModel, 'TaskListModel', [
      SchemaProperty('taskName', RealmPropertyType.string),
      SchemaProperty('taskTime', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
