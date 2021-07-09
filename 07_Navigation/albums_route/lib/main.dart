import 'package:albums_route/pages/artist_details.dart';
import 'package:albums_route/pages/artists.dart';
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
      // home: const MyHomePage(),
      initialRoute: '/',
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          return NotFound();
        });
      },
      routes: {
        MyHomePage.routeName: (BuildContext context) => const MyHomePage(),
        ArtistsPage.routeName: (BuildContext context) => const ArtistsPage(),
        ArtistDetailsPage.routeName: (BuildContext context) =>
            const ArtistDetailsPage(),
      },
    );
  }
}

class NotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  static const String routeName = '/';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static bool _selected = false;

  void _toggleActive() {
    setState(() {
      _selected = !_selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <ListTile>[
            ListTile(
              selected: !_selected,
              title: const Text('Home'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  MyHomePage.routeName,
                );
                if (_selected) {
                  _toggleActive();
                }
              },
            ),
            ListTile(
              selected: _selected,
              title: const Text('Artists'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ArtistsPage.routeName,
                );
                if (!_selected) {
                  _toggleActive();
                }
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Routes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Routes',
            ),
          ],
        ),
      ),
    );
  }
}
