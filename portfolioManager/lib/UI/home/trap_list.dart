import 'package:flutter/material.dart';
import 'package:portfolioManager/UI/home/trap_tile.dart';
import 'package:portfolioManager/models/trap.dart';
import 'package:provider/provider.dart';

class TrapList extends StatefulWidget {
  @override
  _TrapListState createState() => _TrapListState();
}

class _TrapListState extends State<TrapList> {
  @override
  Widget build(BuildContext context) {
    final traps = Provider.of<List<Trap>>(context);

    return ListView.builder(
      itemCount: traps.length,
      itemBuilder: (context, index) {
        return TrapTile(trap: traps[index]);
      },
    );
  }
}
