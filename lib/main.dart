import 'package:flutter/material.dart';
// TODO Step 10: run `flutter pub add http` in the terminal, then uncomment this line
// import 'package:http/http.dart' as http;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // TODO Step 14: a List<Map<String, dynamic>> called cartsList to hold the API data

  // TODO Step 16: initState() that calls an async helper (initState itself can't be async)

  // TODO Step 12: Future<void> doTheThing() async { ... } that fetches https://dummyjson.com/carts

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Week 7B"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // TODO Step 12: make this async and await doTheThing()
              debugPrint("Button pressed!");
            },
            child: Text("Get Some Data"),
          ),
          SizedBox(height: 20),
          // TODO Step 11.5: swap this hardcoded height for an Expanded
          // TODO Step 15: give it a ListView.builder child that shows cartsList
          Container(
            height: 300,
            width: double.infinity,
            color: Colors.blueGrey,
          ),
        ],
      ),
    );
  }
}
