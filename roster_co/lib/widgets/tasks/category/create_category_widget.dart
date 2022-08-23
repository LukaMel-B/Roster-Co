import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roster_co/constants/close_button.dart';
import 'package:roster_co/constants/create_task_consts.dart';
import 'package:roster_co/constants/popmenu_icon_class.dart';
import 'package:roster_co/constants/title_const_class.dart';

class CreateTaskCategory extends StatefulWidget {
  const CreateTaskCategory({Key? key}) : super(key: key);

  @override
  State<CreateTaskCategory> createState() => _CreateTaskCategoryState();
}

class _CreateTaskCategoryState extends State<CreateTaskCategory> {
  TextEditingController nameController = TextEditingController();
  TextEditingController desController = TextEditingController();
  IconData? _selectedIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.68,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35), topRight: Radius.circular(35)),
      ),
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Expanded(
            child: Wrap(
              runSpacing: 20,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      'Create New Category',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    CustomCloseButton(
                      size: 35,
                    ),
                  ],
                ),

                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: CreatePageTitle(title: 'Category Title'),
                ),

                TextFormField(
                  style: txStyle,
                  validator: validator,
                  controller: nameController,
                  decoration: textfieldDeco,
                ),

                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xffCBCBCB),
                      width: .8,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      final IconData? result = await showIconPicker(
                          context: context, defalutIcon: _selectedIcon);
                      setState(() {
                        _selectedIcon = result;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        (_selectedIcon == null)
                            ? Image.asset(
                                'assets/icons/add_icon.png',
                                height: 30,
                              )
                            : Icon(
                                _selectedIcon,
                                size: 30,
                                color: Colors.black,
                              ),
                        (_selectedIcon == null)
                            ? const Text(
                                'Pick the icon',
                                style: TextStyle(
                                    fontFamily: 'Metropolis',
                                    color: Colors.black,
                                    fontSize: 19),
                              )
                            : const Text(
                                'Picked Icon',
                                style: TextStyle(
                                    fontFamily: 'Metropolis',
                                    color: Colors.black,
                                    fontSize: 19),
                              ),
                        const SizedBox(
                          width: 80,
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.black,
                          size: 24,
                        )
                      ],
                    ),
                  ),
                ),
                // const Padding(
                //   padding: EdgeInsets.only(left: 8.0, top: 5),
                //   child: Text(
                //     'This icon is used to get quick attention for your category',
                //     style: TextStyle(color: Color(0xffADADAD), fontSize: 11),
                //   ),
                // ),

                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: CreatePageTitle(title: 'Descriprtion'),
                ),

                TextFormField(
                  style: txStyle,
                  validator: validator,
                  controller: desController,
                  decoration: textfieldDeco,
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                ),
                // const Padding(
                //   padding: EdgeInsets.only(left: 8.0, top: 5),
                //   child: Text(
                //     'A brief description about your category',
                //     style: TextStyle(color: Color(0xffADADAD), fontSize: 11),
                //   ),
                // ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 45,
                      width: 45,
                      child: FloatingActionButton(
                        onPressed: () {
                          Get.back();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 25,
                        backgroundColor: Colors.black,
                        child: const Icon(
                          Icons.done,
                          size: 33,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
