import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> nav = ['Список 1', 'Список 2'];
  final List fakeData = List.generate(100, (index) => index.toString());

  Map<String, dynamic> data = {
    'Мои фото': [
      'https://picsum.photos/1200/501',
      'https://picsum.photos/1200/502',
      'https://picsum.photos/1200/503',
      'https://picsum.photos/1200/504',
      'https://picsum.photos/1200/505',
      'https://picsum.photos/1200/506',
      'https://picsum.photos/1200/507',
      'https://picsum.photos/1200/508',
      'https://picsum.photos/1200/509',
      'https://picsum.photos/1200/510',
    ],
    'Галерея': [
      'https://picsum.photos/1200/511',
      'https://picsum.photos/1200/512',
      'https://picsum.photos/1200/513',
      'https://picsum.photos/1200/514',
      'https://picsum.photos/1200/515',
      'https://picsum.photos/1200/516',
      'https://picsum.photos/1200/517',
      'https://picsum.photos/1200/518',
      'https://picsum.photos/1200/519',
      'https://picsum.photos/1200/520',
    ]
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: nav.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Homework example'),
          bottom: TabBar(
            tabs: nav
                .map((tabTitle) => Tab(
                      text: tabTitle,
                    ))
                .toList(),
          ),
        ),
        body: TabBarView(
          children: [
            TabPage(
              data: data,
              mapKey: 0,
              pageStorageKey: PageStorageKey(nav[0]),
            ),
            TabPage(
              data: data,
              mapKey: 1,
              pageStorageKey: PageStorageKey(nav[1]),
            ),
          ],
        ),
      ),
    );
  }
}

class TabPage extends StatelessWidget {
  final data;
  final mapKey;
  final pageStorageKey;

  TabPage({this.data, this.mapKey, this.pageStorageKey});

  @override
  Widget build(BuildContext context) {
    final dataKey = data.keys.toList()[mapKey];

    return ListView.builder(
      key: pageStorageKey,
      itemCount: data[dataKey].length,
      itemBuilder: (context, index) {
        return Image.network(data[dataKey][index]);
      },
    );
  }
}
