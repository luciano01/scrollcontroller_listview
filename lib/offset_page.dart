import 'package:flutter/material.dart';

class OffSetPage extends StatefulWidget {
  const OffSetPage({Key? key}) : super(key: key);

  @override
  _OffSetPageState createState() => _OffSetPageState();
}

class _OffSetPageState extends State<OffSetPage> {
  String message = '';
  late ScrollController _scrollController;

  _scrollListener() {
    bool maxScroll = _scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange;

    bool minScroll = _scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange;

    if (maxScroll) {
      setState(() {
        message = 'Reach the bottom';
      });
    }

    if (minScroll) {
      setState(() {
        message = 'Reach the top';
      });
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offset max-min'),
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
            child: ListView.builder(
              controller: _scrollController,
              itemCount: 30,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Index: $index'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
