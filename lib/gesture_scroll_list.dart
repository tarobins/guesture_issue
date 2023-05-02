import 'package:flutter/material.dart';

class GestureScrollList extends StatelessWidget {
  final bool addPanDownEventHandler;

  const GestureScrollList({super.key, required this.addPanDownEventHandler});

  @override
  Widget build(BuildContext context) => GestureDetector(
        child: MyListView(),
        onPanDown: addPanDownEventHandler
            ? (details) => print('onPanDown: $details')
            : null,
      );
}

class MyListView extends StatelessWidget {
  const MyListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        key: ValueKey('key $index'),
        title: Text('Item $index'),
      ),
      itemCount: 100,
    );
  }
}