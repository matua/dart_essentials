import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(
            color: Colors.purple,
          ),
          border: purpleBorder(),
          enabledBorder: purpleBorder(),
          focusedBorder: purpleBorder(),
        ),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text field styled'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Введите значение',
            hintStyle: TextStyle(color: Colors.grey.shade500),
            labelText: 'Search',
            helperText: 'Поле для поиска заметок',
            suffixIcon: const Icon(
              Icons.search,
              color: Colors.purple,
            ),
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder purpleBorder() {
  return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide(
        width: 2,
        color: Colors.purple,
      ));
}
