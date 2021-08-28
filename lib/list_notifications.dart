import 'package:flutter/material.dart';

class ListenNotifications extends StatefulWidget {
  const ListenNotifications({Key? key}) : super(key: key);

  @override
  _ListenNotificationsState createState() => _ListenNotificationsState();
}

class _ListenNotificationsState extends State<ListenNotifications> {
  String message = '';

  _onStartScroll(ScrollMetrics scrollMetrics) {
    setState(() {
      message = 'Scroll Start';
    });
  }

  _onUpdateScroll(ScrollMetrics scrollMetrics) {
    setState(() {
      message = 'Scroll Update';
    });
  }

  _onEndScroll(ScrollMetrics scrollMetrics) {
    setState(() {
      message = 'Scroll End';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listen Notifications'),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            color: Colors.blue,
            child: Center(
              child: Text(message),
            ),
          ),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollStartNotification) {
                  _onStartScroll(scrollNotification.metrics);
                } else if (scrollNotification is ScrollUpdateNotification) {
                  _onUpdateScroll(scrollNotification.metrics);
                } else if (scrollNotification is ScrollEndNotification) {
                  _onEndScroll(scrollNotification.metrics);
                }
                return true;
              },
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Index: $index'),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
