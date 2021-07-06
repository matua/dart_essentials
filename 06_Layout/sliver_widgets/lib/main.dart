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
      drawer: const Drawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            // backgroundColor: Colors.black.withOpacity(0.5),
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Page title'),
              background: Image.network('https://picsum.photos/200/300',
                  fit: BoxFit.cover),
            ),
          ),
          const SliverToBoxAdapter(
            child: Text('Sed ut perspiciatis unde omnis iste natus error '
                'sit voluptatem accusantium doloremque laudantium, totam rem'
                ' aperiam, '
                'eaque '
                'ipsa quae ab illo inventore veritatis et quasi architecto'
                ' beatae vitae '
                'dicta sunt explicabo. Nemo enim ipsam voluptatem quia volu '
                'ptas'
                'sit '
                'aspernatur aut odit aut fugit, sed quia consequuntur magni do '
                'lores eos'
                ' qui ratione voluptatem sequi nesciunt. Neque porro quisquam'
                ' est, qui'
                ' dolorem ipsum quia dolor sit amet, consectetur, adipisci vel '
                'it, sed '
                'quia non numquam eius modi tempora incidunt ut labore et dolo '
                're magnam '
                'aliquam quaerat voluptatem. Ut enim ad minima veniam, quis no '
                'strum '
                'exercitationem ullam corporis suscipit laboriosam, nisi ut al '
                'iquid ex ea'
                ' commodi consequatur? Quis autem vel eum iure reprehenderit q '
                'ui in ea'
                ' voluptate velit esse quam nihil molestiae consequatur, vel '
                'illum qui '
                'dolorem eum fugiat quo voluptas nulla pariatur? '
                'Sed ut perspiciatis unde omnis iste natus error '
                'sit voluptatem accusantium doloremque laudantium, totam rem'
                ' aperiam, '
                'eaque '
                'ipsa quae ab illo inventore veritatis et quasi architecto be '
                'atae vitae '
                'dicta sunt explicabo. Nemo enim ipsam voluptatem quia volupt '
                'as sit '
                'aspernatur aut odit aut fugit, sed quia consequuntur magni d '
                'olores eos'
                ' qui ratione voluptatem sequi nesciunt. Neque porro quisquam '
                ' est, qui'
                ' dolorem ipsum quia dolor sit amet, consectetur, adipisci ve '
                'lit, sed '
                'quia non numquam eius modi tempora incidunt ut labore et dol '
                'ore magnam '
                'aliquam quaerat voluptatem. Ut enim ad minima veniam, quis n '
                'ostrum '
                'exercitationem ullam corporis suscipit laboriosam, nisi ut a '
                'liquid ex ea'
                ' commodi consequatur? Quis autem vel eum iure reprehenderit '
                'qui in ea'
                ' voluptate velit esse quam nihil molestiae consequatur, vel'
                ' illum qui '
                'dolorem eum fugiat quo voluptas nulla pariatur?'),
          ),
        ],
      ),
    );
  }
}
