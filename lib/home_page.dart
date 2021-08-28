import 'package:flutter/material.dart';
import 'package:scrollcontroller_listview/offset_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScrollController ListView'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Offset max-min'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OffSetPage()),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Move between elements'),
              onPressed: () {},
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Listen ScrollNotifications'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
