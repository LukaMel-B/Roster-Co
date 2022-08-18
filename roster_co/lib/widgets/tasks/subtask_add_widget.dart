import 'package:flutter/material.dart';
import 'package:roster_co/constants/create_task_consts.dart';
import 'package:roster_co/constants/title_const_class.dart';

class AddedSubTasks extends StatefulWidget {
  const AddedSubTasks({Key? key}) : super(key: key);

  @override
  State<AddedSubTasks> createState() => _AddedSubTasksState();
}

class _AddedSubTasksState extends State<AddedSubTasks> {
  List<Widget> _subTasks = [];
  final List<TextEditingController> _controllers = [];
  int _count = 0;
  @override
  void initState() {
    _add();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CreatePageTitle(title: 'Sub-Task'),
            IconButton(
              onPressed: () {
                _add();
              },
              icon: const Icon(
                Icons.add_rounded,
                size: 27,
              ),
            )
          ],
        ),
        Column(
          children: _subTasks,
        ),
      ],
    );
  }

  void _add() {
    TextEditingController controller = TextEditingController();
    _controllers.add(controller);
    _subTasks = List.from(_subTasks)
      ..add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: TextFormField(
          style: txStyle,
          validator: validator,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(19),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide:
                    const BorderSide(color: Color(0xffCBCBCB), width: .8),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide:
                    const BorderSide(color: Color(0xffCBCBCB), width: .8),
              ),
              hintText: 'Enter subtask ${_count + 1} ...',
              hintStyle: const TextStyle(
                fontFamily: 'Metropolis',
                color: Color(0xffADADAD),
              )),
          controller: controller,
        ),
      ));
    setState(() => ++_count);
    print(_controllers);
  }
}
