import 'package:flutter/material.dart';

class CreatEventSheet extends StatefulWidget {
  const CreatEventSheet({Key? key}) : super(key: key);

  @override
  State<CreatEventSheet> createState() => _CreatEventSheetState();
}

class _CreatEventSheetState extends State<CreatEventSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const SizedBox(height: 100, width: 100, child: Text('events')),
    );
  }
}
