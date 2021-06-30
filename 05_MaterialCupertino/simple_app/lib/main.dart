import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabBar.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[
          Builder(
            builder: (BuildContext context) => IconButton(
              onPressed: Scaffold.of(context).openEndDrawer,
              icon: const Icon(Icons.account_circle_rounded),
            ),
          ),
        ],
        title: Text(widget.title),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Container(
            color: Colors.white,
            child: const Center(child: Text('Photo')),
          ),
          Container(
            color: Colors.blue,
            child: const Center(child: Text('Chat')),
          ),
          Container(
            color: Colors.red,
            child: const Center(child: Text('Albums')),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            const DrawerHeader(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/flutter_logo.png'),
                backgroundColor: Colors.white,
              ),
            ),
            const MyListTile(title: 'Home', icon: Icon(Icons.home)),
            const MyListTile(title: 'Profile', icon: Icon(Icons.portrait)),
            const MyListTile(title: 'Images', icon: Icon(Icons.image)),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  const MyElevatedButton(
                    Text('Выход'),
                  ),
                  const MyElevatedButton(
                    Text('Регистрация'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 54,
                child: Image.asset('assets/skillbox_logo.png'),
              ),
            ),
            const Text('Jonathan')
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: BottomNavigationBar(
          onTap: (int index) => setState(() {
            _tabController.index = index;
            _currentTabIndex = index;
          }),
          currentIndex: _currentTabIndex,
          items: <BottomNavigationBarItem>[
            for (final TabItem item in _tabBar)
              BottomNavigationBarItem(
                label: item.title,
                icon: item.icon,
              )
          ],
        ),
      ),
      floatingActionButton: MyFloatingActionButton(),
    );
  }
}

class MyFloatingActionButton extends StatefulWidget {
  @override
  _MyFloatingActionButtonState createState() => _MyFloatingActionButtonState();
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton> {
  bool _show = true;

  @override
  Widget build(BuildContext context) {
    return _show
        ? FloatingActionButton(
      onPressed: () {
        // ignore: always_specify_types
        final PersistentBottomSheetController sheetController =
        showBottomSheet(
          context: context,
          builder: (BuildContext context) => SizedBox(
            height: 150,
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: const Icon(Icons.credit_card),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: const Text('Сумма'),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: const Text('200 руб'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const MyElevatedButton(Text('Оплатить')),
                ],
              ),
            ),
          ),
        );
        _showButton(false);
        sheetController.closed.then((FutureOr<dynamic> value) {
                _showButton(true);
              });
      },
      child: const Icon(Icons.add),
    )
        : Container();
  }

  void _showButton(bool value) {
    setState(() {
      _show = value;
    });
  }
}

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton(this._child);

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
          MaterialStateProperty.all<Color>(Colors.grey.shade400),
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: _child);
  }
}

class TabItem {
  TabItem({
    @required this.title,
    @required this.icon,
  });

  String title;

  Icon icon;
}

class MyListTile extends StatelessWidget {
  const MyListTile({
    @required this.title,
    @required this.icon,
  });

  final String title;

  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {},
    );
  }
}

final List<TabItem> _tabBar = <TabItem>[
  TabItem(title: 'Photo', icon: const Icon(Icons.home)),
  TabItem(title: 'Chat', icon: const Icon(Icons.chat)),
  TabItem(title: 'Album', icon: const Icon(Icons.album)),
];
