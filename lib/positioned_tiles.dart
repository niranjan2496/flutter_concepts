

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PositionedTiles extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PositionedTilesState();
}

class PositionedTilesState extends State<PositionedTiles> {
  // Stateful tiles now wrapped in padding (a stateless widget) to increase height
  // of widget tree and show why keys are needed at the Padding level.

  List<Widget> tiles = [
    StatelessColorfulTile(),
    const StatelessColorfulTile(),
  ];

  @override
  Widget build(BuildContext context) {
    var y = const BlueSquare(size: 50);
    var x = const BlueSquare(size: 50);
    print('value fo two objects=============${y==x}');
    return StreamBuilder<String>(
        stream: null,
        builder: (context, snapshot) {
          return Scaffold(
            body: Row(children: tiles),
            floatingActionButton: FloatingActionButton(
                onPressed: swapTiles,
                child: Icon(Icons.sentiment_very_satisfied)),
          );
        }
    );
  }

  swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}



class StatelessColorfulTile extends StatelessWidget {
  final Color myColor = Colors.green;
  const StatelessColorfulTile({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        color: myColor,
        child: Padding(padding: EdgeInsets.all(70.0)));
  }
}


class BlueSquare extends StatelessWidget {
  final double size;

  const BlueSquare({Key? key, required this.size}) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      color: Colors.blue,
    );
  }
}