import 'package:flutter/material.dart';

class MoveElementsPage extends StatefulWidget {
  const MoveElementsPage({Key? key}) : super(key: key);

  @override
  _MoveElementsPageState createState() => _MoveElementsPageState();
}

class _MoveElementsPageState extends State<MoveElementsPage> {
  final itemSize = 100.0;
  late ScrollController _scrollController;

  _moveUp() {
    var offSet = _scrollController.offset - itemSize;
    var duration = Duration(milliseconds: 500);
    var curve = Curves.linear;
    _scrollController.animateTo(offSet, duration: duration, curve: curve);
  }

  _moveDown() {
    var offSet = _scrollController.offset + itemSize;
    var duration = Duration(milliseconds: 500);
    var curve = Curves.linear;
    _scrollController.animateTo(offSet, duration: duration, curve: curve);
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Move between elements'),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_up),
                  onPressed: _moveUp,
                ),
                Text('Move elements to Up or Down'),
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_down),
                  onPressed: _moveDown,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemExtent: itemSize,
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
