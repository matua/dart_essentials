import 'package:flutter/material.dart';

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, @required this.title}) : super(key: key);
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
        actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: Scaffold.of(context).openEndDrawer,
              icon: Icon(Icons.account_circle_rounded),
            ),
          ),
        ],
        title: Text(widget.title),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            color: Colors.white,
            child: Center(child: Text('Photo')),
          ),
          Container(
            color: Colors.blue,
            child: Center(child: Text('Chat')),
          ),
          Container(
            color: Colors.red,
            child: Center(child: Text('Albums')),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/flutter_logo.png'),
                backgroundColor: Colors.white,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.portrait),
              title: Text('Profile'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Images'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyElevatedButton(
                    const Text('Выход'),
                  ),
                  MyElevatedButton(
                    const Text('Регистрация'),
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
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 54,
                child: Image.asset('assets/skillbox_logo.png'),
              ),
            ),
            Text('Jonathan')
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: BottomNavigationBar(
          onTap: (index) => setState(() {
            _tabController.index = index;
            _currentTabIndex = index;
          }),
          currentIndex: _currentTabIndex,
          items: [
            for (final item in _tabBar)
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
            child: const Icon(Icons.add),
            onPressed: () {
              var sheetController = showBottomSheet(
                context: context,
                builder: (context) => Container(
                  height: 150,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Icon(Icons.credit_card),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Сумма'),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Text('200 руб'),
                                ),
                                flex: 2,
                              ),
                            ],
                          ),
                        ),
                        MyElevatedButton(const Text('Оплатить')),
                      ],
                    ),
                  ),
                ),
              );
              _showButton(false);
              sheetController.closed.then((value) {
                _showButton(true);
              });
            },
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
  MyElevatedButton(this._child);

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.grey.shade400),
          textStyle: MaterialStateProperty.all(
            TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        child: _child,
        onPressed: () {
          Navigator.pop(context);
        });
  }
}

class TabItem {
  String title;
  Icon icon;

  TabItem({
    @required this.title,
    @required this.icon,
  });
}

final List<TabItem> _tabBar = [
  TabItem(title: "Photo", icon: Icon(Icons.home)),
  TabItem(title: "Chat", icon: Icon(Icons.chat)),
  TabItem(title: "Album", icon: Icon(Icons.album)),
];
