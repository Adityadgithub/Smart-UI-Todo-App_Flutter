import 'package:flutter/material.dart';

import 'card.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(TodoApp());
}

var placeselected = "Today";
bool? todayselected = false;
bool? weekselected = false;
bool? monthselected = false;

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List todaycardtitle = [];
  List weekcardtitle = [];
  List monthcardtitle = [];

  List todoList = [];

  var todaytask = 0;

  bool? empty = false;

  var curday = DateTime.now().day;

  List months = [
    'January',
    'Febuary',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  var curmonth = DateTime.now().month;

  var curyear = DateTime.now().year;

  void addcard(title) {
    if (placeselected == "Today") {
      todaytask = todaytask + 1;
      todaycardtitle.add(title);
    } else if (placeselected == "Week") {
      weekcardtitle.add(title);
    } else if (placeselected == "Month") {
      monthcardtitle.add(title);
    }
    textcontroller.clear();
  }

  List todaygetcards() {
    List<Widget> todaycardwidget = [];

    for (String i in todaycardtitle) {
      todaycardwidget.add(buildcard(i));
    }

    textcontroller.clear();

    return todaycardwidget;
  }

  List weekgetcards() {
    List<Widget> weekcardwidget = [];

    for (String i in weekcardtitle) {
      weekcardwidget.add(buildcard(i));
    }

    print(weekcardtitle);
    textcontroller.clear();
    return weekcardwidget;
  }

  List monthgetcards() {
    List<Widget> monthcardwidget = [];

    for (String i in monthcardtitle) {
      monthcardwidget.add(buildcard(i));
    }

    textcontroller.clear();
    return monthcardwidget;
  }

  ListTile buildcard(title) {
    return ListTile(
      title: thecard(title: title),
    );
  }

  TextEditingController textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("To Do List",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            Text(
              "All",
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
        actions: [
          Icon(Icons.search),
          SizedBox(
            width: 15,
          ),
          Container(
              height: 50.0,
              width: 50.0,
              child: FittedBox(
                  child: FloatingActionButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Add an Item"),
                                content: TextFormField(
                                  validator: (value) {
                                    setState(() {});
                                    if (value!.isEmpty) {
                                      return "Field can't be empty";
                                    }
                                  },
                                  controller: textcontroller,
                                  decoration: const InputDecoration(
                                      hintText: 'Enter task here'),
                                ),
                                actions: [
                                  TextButton(
                                      child: Text("ADD"),
                                      onPressed: () {
                                        placeselected == "Today"
                                            ? todayselected = true
                                            : placeselected == "Week"
                                                ? weekselected = true
                                                : monthselected = true;
                                        Navigator.of(context).pop();

                                        setState(() {});
                                        addcard(textcontroller.text);
                                      }),
                                  SelectPlace()
                                ],
                              );
                            });
                      },
                      child: Icon(
                        Icons.add,
                        size: 30,
                      )))),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  40,
                  10,
                  20,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                            minRadius: 25,
                            child: Icon(
                              Icons.person,
                              size: 30,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hey User!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Text(
                              "You have $todaytask task today ",
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Task",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          Text(
                            "${curday}",
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 160, 160, 160),
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "${months[curmonth - 1] + ","}",
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 160, 160, 160),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "$curyear",
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 160, 160, 160),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                DefaultTabController(
                  length: 3, // length of tabs
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        child: TabBar(
                          indicatorSize: TabBarIndicatorSize.label,
                          labelColor: Colors.green,
                          unselectedLabelColor: Colors.black,
                          tabs: [
                            Tab(text: 'Today'),
                            Tab(text: 'Week'),
                            Tab(text: 'Month'),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height *
                            0.486, //height of TabBarView
                        child: TabBarView(
                          children: <Widget>[
                            Container(
                                child: todayselected == false
                                    ? Idle()
                                    : ListView(
                                        children: [...todaygetcards()],
                                      )),
                            Container(
                                child: weekselected == false
                                    ? Idle()
                                    : ListView(
                                        children: [...weekgetcards()],
                                      )),
                            Container(
                                child: monthselected == false
                                    ? Idle()
                                    : ListView(
                                        children: [...monthgetcards()],
                                      )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SelectPlace extends StatefulWidget {
  const SelectPlace({Key? key}) : super(key: key);

  @override
  State<SelectPlace> createState() => _SelectPlaceState();
}

class _SelectPlaceState extends State<SelectPlace> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: DropdownButtonFormField<String>(
        value: placeselected,
        items: <String>['Today', 'Week', 'Month'].map((value) {
          print(value);
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            placeselected = value ?? "";
          });
        },
        onSaved: (value) {
          setState(() {
            placeselected = value!;
          });
        },
      ),
    );
  }
}

class Idle extends StatelessWidget {
  const Idle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.add_task_rounded,
          size: 35,
        ),
        SizedBox(width: 15),
        Text(
          "Add you Task!",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ],
    ));
  }
}
