// ignore_for_file: file_names, prefer_const_constructors

import 'package:fitness_support/commonStyles.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/TaskModel.dart';
import 'Progress.dart';

class Schedules extends StatefulWidget {
  Schedules({Key? key}) : super(key: key);

  @override
  State<Schedules> createState() => _SchedulesState();
}

class _SchedulesState extends State<Schedules> {
  late String newTask;

  void changeState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          child: Icon(FluentSystemIcons.ic_fluent_calendar_add_filled),
          backgroundColor: Colors.indigo.shade600,
          onPressed: () async {
            final _newTask = await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      content: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Text(
                              'Add New Task',
                              style: GoogleFonts.actor(
                                  color: Colors.indigo.shade300),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(top: 20),
                              child: SingleChildScrollView(
                                child: TextField(
                                  onChanged: (Value) {
                                    newTask = Value;
                                  },
                                  decoration: InputDecoration(
                                      label: Text(
                                        'New Task',
                                        style: TextStyle(
                                            color: Colors.indigo.shade400),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide: BorderSide(
                                              color: Colors.indigo.shade200)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide: BorderSide(
                                              color: Colors.indigo.shade200))),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                width: 100,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Cencel'),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red.shade400))),
                            Container(
                                width: 100,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(newTask);
                                    },
                                    child: Text('Add'),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Colors.greenAccent.shade400))),
                          ],
                        )
                      ],
                    ));
            if (_newTask != null && _newTask != "") {
              Task newTask = Task(Progress: 0, Tasks: _newTask as String);
              Tasks.add(newTask);
              setState(() {});
            }
          },
        ),
        body: Container(
            color: Styles.backgroundColor.withOpacity(0.2),
            child: Container(
                child: ListView.builder(
              itemBuilder: (context, index) => Container(
                height: 120,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.indigo.shade100,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.indigo.shade300,
                        ),
                        Gap(10),
                        Text("${Tasks[index].Tasks}",
                            style: GoogleFonts.actor(fontSize: 20)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, top: 8.0),
                      child: Text(
                        "You have completed ${Tasks[index].Progress}% of task",
                        style: GoogleFonts.actor(color: Colors.indigo.shade300),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>updateProgress(Value: index, changeState: changeState)));

                            },
                            child: Text('Update Progress'),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.indigo.shade400)),
                        Container(
                            width: 150,
                            child: ElevatedButton(
                                onPressed: () {
                                  Tasks.removeAt(index);
                                  setState(() {});
                                },
                                child: Text('Completed'),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.indigo.shade400))),
                      ],
                    )
                  ],
                ),
              ),
              itemCount: Tasks.length,
            ))));
  }
}
