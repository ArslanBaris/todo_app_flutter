import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/todo_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> tasks = ["Study Lessons", "Run 5K", "Go to Gym"];
  List<String> completedTasks = ["Game meetup", "Take out the trash"];

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: Column(
            children: [
              // HEADER
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/assets/images/header.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                width: deviceWidth,
                height: deviceHeight / 4,
                child: const Column(children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      "January, 27, 2024",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40.0),
                    child: Text(
                      "My TODO List",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  )
                ]),
              ),
              // TOP COLUMN
              Expanded(
                // to make the list take the rest of the screen
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  child: SingleChildScrollView(
                      // to make the list scrollable
                      child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return TodoItem(title: tasks[index]);
                    },
                  )),
                ),
              ),
              // COLUMN TITLE
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text("Completed Tasks: 0/0",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      )),
                ),
              ),
              // BOTTOM COLUMN
              Expanded(
                // to make the list take the rest of the screen
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  child: SingleChildScrollView(
                    // to make the list scrollable
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: completedTasks.length,
                      itemBuilder: (context, index) {
                        return TodoItem(title: completedTasks[index]);
                      },
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddNewTaskScreen(),
                    ));
                  },
                  child: const Text("Add Task"))
            ],
          ),
        ),
      ),
    );
  }
}
