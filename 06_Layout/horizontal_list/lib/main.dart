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
        title: const Text('Horizontal list'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraint) {
                final double _screenWidth = constraint.constrainWidth();
                const int _listLength = 10;
                final List<int> colorCodes =
                    List.generate(10, (int index) => 100 * index);
                return _screenWidth < 500
                    ? SizedBox(
                        height: 100,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.all(8),
                            itemCount: _listLength,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: 100,
                                width: 100,
                                color: Colors.green[colorCodes[index]],
                                // child: Center(child: Text(entries[index])),
                              );
                            }),
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height - 100,
                        child: ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemCount: _listLength,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: 100,
                                width: 100,
                                color: Colors.green[colorCodes[index]],
                                // child: Center(child: Text(entries[index])),
                              );
                            }),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
