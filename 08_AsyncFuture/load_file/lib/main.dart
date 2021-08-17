import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(
            color: Colors.purple,
          ),
          border: blackBorder(),
          enabledBorder: blackBorder(),
          focusedBorder: blackBorder(),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Homework 8.7'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  String _textFromFile = 'No file chosen';

  void _setText(String text) {
    setState(() {
      _textFromFile = text;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Stack(children: <Widget>[
                TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter file name'),
                  controller: _controller,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    height: 57,
                    width: 90,
                    child: TextButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0)),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: () => _setText(_controller.text),
                      child: const Text('Find'),
                    ),
                  ),
                ),
              ]),
              const SizedBox(
                height: 21,
              ),
              FutureBuilder<dynamic>(
                future: fetchFileFromAssets(fileName: _textFromFile),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(_textFromFile));
                },
              ),
              const SizedBox(
                height: 21,
              ),
              FutureBuilder<dynamic>(
                future: fetchFileFromAssets(fileName: _textFromFile),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(snapshot.data.toString()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<String> fetchFileFromAssets({String fileName = 'file1.txt'}) {
  return rootBundle
      .loadString('assets/$fileName')
      .then((String file) => file.toString())
      .catchError((dynamic error) => 'No file found');
}

OutlineInputBorder blackBorder() {
  return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(
        width: 2.0,
      ));
}
