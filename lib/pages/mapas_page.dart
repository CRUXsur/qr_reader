import 'package:flutter/material.dart';

class MapasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (_, i) => ListTile(
        leading: Icon(Icons.map, color: Theme.of(context).primaryColor),
        title: const Text('httplsdjhflshf'),
        subtitle: const Text('ID : 1'),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
          color: Colors.green,
        ),
        onTap: () => print('abrir algo....'),
      ),
    );
  }
}
