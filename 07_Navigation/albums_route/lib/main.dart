import 'package:albums_route/pages/artist_details.dart';
import 'package:albums_route/pages/artists.dart';
import 'package:albums_route/routes.dart';
import 'package:albums_route/widgets/custom_drawer.dart';
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
      initialRoute: '/',
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute<dynamic>(builder: (BuildContext context) {
          return NotFound();
        });
      },
      routes: <String, Widget Function(BuildContext)>{
        Routes.home: (BuildContext context) => const MyHomePage(),
        Routes.artists: (BuildContext context) => const ArtistsPage(),
        Routes.artistDetails: (BuildContext context) =>
            const ArtistDetailsPage(),
      },
    );
  }
}

class NotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'Page does not exist',
      textAlign: TextAlign.center,
    ));
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
      drawer: CustomDrawer(),
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
