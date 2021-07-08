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
      home: const MyHomePage(),
      initialRoute: '/',
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          return NotFound();
        });
      },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case MyHomePage.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return const MyHomePage();
            });
            break;
          case ArtistsPage.routeName:
            final Map<String, String> args =
                settings.arguments as Map<String, String>;
            return MaterialPageRoute(builder: (BuildContext context) {
              // if (testArgs != null && testArgs.containsKey('test'))
              return ArtistsPage(test: args['test']);
              //
            });
            break;
          case ArtistDetailsPage.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return const ArtistDetailsPage();
            });
            break;
          default:
            return MaterialPageRoute(builder: (BuildContext context) {
              return NotFound();
            });
        }
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <ListTile>[
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.of(context).pushNamed('/');
              },
            ),
            ListTile(
              title: const Text('Artists'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ArtistsPage.routeName,
                  arguments: <String, String>{'test': 'test data'},
                );
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
