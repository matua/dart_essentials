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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.account_circle_rounded),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
          ],
          title: Text(widget.title),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/skillbox_avatar.png'),
                  ),
                ),
                child: null,
              ),
              Column(
                children: [
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
                ],
              ),
              Expanded(
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.grey.shade400),
                        textStyle: MaterialStateProperty.all(
                          TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text('Выход'),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.grey.shade400),
                        textStyle: MaterialStateProperty.all(
                          TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text('Регистрация'),
                    ),
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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          onTap: (int index) {},
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Photo"),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
            BottomNavigationBarItem(icon: Icon(Icons.album), label: "Albums"),
          ],
        ),
        floatingActionButton: MyFloatingActionButton(),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.grey.shade400),
                              textStyle: MaterialStateProperty.all(
                                TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            child: const Text('Оплатить'),
                            onPressed: () {
                              Navigator.pop(context);
                            })
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
