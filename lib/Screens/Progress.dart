import 'package:fitness_support/Screens/Schedules.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../Components/ReusableButton.dart';
import '../Models/TaskModel.dart';

class updateProgress extends StatefulWidget {
  final int Value;
  final Function changeState;

  const updateProgress(
      {Key? key, required this.Value, required this.changeState})
      : super(key: key);

  @override
  State<updateProgress> createState() => _updateProgressState();
}

class _updateProgressState extends State<updateProgress> {
  TextEditingController _Task = TextEditingController();
  late int index;
  late int progress = 0;

  void setDetails() {
    progress = Tasks[index].Progress;
    _Task.text = Tasks[index].Tasks;
  }

  @override
  void initState() {
    super.initState();
    index = widget.Value;
    setDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.indigo.shade100,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Update Details',
              style: GoogleFonts.actor(color: Colors.indigo.shade300),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 20,
              margin: EdgeInsets.only(top: 20),
              child: SingleChildScrollView(
                child: TextField(
                  controller: _Task,
                  decoration: InputDecoration(
                      label: Text(
                        'New Task',
                        style: TextStyle(color: Colors.indigo.shade400),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(color: Colors.indigo.shade200)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(color: Colors.indigo.shade200))),
                ),
              ),
            ),
            Text("${progress}"),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Slider(
                value: progress.toDouble(),
                onChanged: (value) {
                  setState(() {
                    progress = value.toInt();
                  });
                },
                min: 0,
                max: 100,
              ),
            ),
            SubmitButton(
              Lable: 'Update Task',
              isLoading: false,
              SubmitNow: () {
                if(_Task.text.isNotEmpty
                ){
                  Task updatedTask = Task(Tasks: _Task.text, Progress: progress);
                  Tasks[index] = updatedTask;
                  widget.changeState();
                  _Task.clear();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Schedules()));
                }
                else{
                  Alert(
                    context: context,
                    type: AlertType.error,
                    title: "Task not found",
                    desc: "Invalid task please add task",
                    buttons: [
                      DialogButton(
                        onPressed: () => Navigator.pop(context),
                        width: 150,
                        child: const Text(
                          "Please add task string",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )
                    ],
                  ).show();
                }
                }

            )
          ],
        ),
      ),
    );
  }
}
