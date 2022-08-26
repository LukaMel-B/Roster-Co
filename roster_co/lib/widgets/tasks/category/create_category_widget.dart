import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roster_co/constants/category_title.dart';
import 'package:roster_co/constants/create_task_consts.dart';
import 'package:roster_co/constants/cutom_bottom_sheet_text.dart';
import 'package:roster_co/constants/popmenu_icon_class.dart';
import 'package:roster_co/constants/title_padding.dart';
import 'package:roster_co/constants/warning_alert.dart';
import 'package:roster_co/controllers/category_db_controller.dart';
import 'package:roster_co/db/functions/category_db_functions.dart';
import 'package:roster_co/db/models/task_category_model.dart';

class CreateTaskCategory extends StatefulWidget {
  const CreateTaskCategory({Key? key}) : super(key: key);

  @override
  State<CreateTaskCategory> createState() => _CreateTaskCategoryState();
}

class _CreateTaskCategoryState extends State<CreateTaskCategory> {
  TextEditingController nameController = TextEditingController();
  TextEditingController desController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  final CategoryDbController _categoryDbController =
      Get.put(CategoryDbController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.72,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35), topRight: Radius.circular(35)),
      ),
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Expanded(
            child: Form(
              key: formKey,
              child: Wrap(
                runSpacing: 20,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'Create New Category',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      TextButton(
                          onPressed: () {
                            Get.back();
                            _categoryDbController.resetIcon();
                          },
                          child: const Icon(
                            Icons.close,
                            color: Colors.black,
                            size: 35,
                          ))
                    ],
                  ),
                  const TitlePadding(
                    title: 'Category Title',
                  ),
                  TextFormField(
                    style: txStyle,
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return "Title is required!";
                      } else {
                        return null;
                      }
                    }),
                    controller: nameController,
                    decoration: textfieldDeco,
                  ),
                  Container(
                      padding: const EdgeInsets.all(10),
                      decoration: btDeco,
                      child: GetBuilder<CategoryDbController>(builder: ((_) {
                        return TextButton(
                          onPressed: () async {
                            final IconData? result = await showIconPicker(
                                context: context,
                                defalutIcon:
                                    _categoryDbController.selectedIcon);
                            _categoryDbController.resetIcon();
                            (result == null)
                                ? _categoryDbController.selectedIcon
                                : _categoryDbController.updateIcon(result);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              (_categoryDbController.selectedIcon == null)
                                  ? Image.asset(
                                      'assets/icons/add_icon.png',
                                      height: 30,
                                    )
                                  : Icon(
                                      _categoryDbController.selectedIcon,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                              (_categoryDbController.selectedIcon == null)
                                  ? const CustomBottomSheetText(
                                      text: 'Pick the icon')
                                  : const CustomBottomSheetText(
                                      text: 'Picked Icon'),
                              sixw_8,
                              downIcon,
                            ],
                          ),
                        );
                      }))),
                  const TitlePadding(title: 'Description'),
                  TextFormField(
                    style: txStyle,
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return "Description is required!";
                      } else {
                        return null;
                      }
                    }),
                    controller: desController,
                    decoration: textfieldDeco,
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                  ),
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
                            if (formKey.currentState!.validate()) {
                              {
                                if (_categoryDbController.selectedIcon ==
                                    null) {
                                  showIconAlert(context);
                                } else {
                                  onButtonPress();
                                }
                              }
                            }
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
          ),
        ],
      ),
    );
  }

  void onButtonPress() async {
    _categoryDbController.updateIndex();
    final category = TaskCategoryModel(
        icon: _categoryDbController.selectedIcon!.codePoint,
        title: nameController.text.trim(),
        description: desController.text.trim(),
        bgColor: _categoryDbController
            .bgColorList[_categoryDbController.bgColorIndex],
        iconColor: _categoryDbController
            .iconColorList[_categoryDbController.iconColorIndex]);
    await addCategory(category);
    await getAllCategorys();
    _categoryDbController.resetIcon();
    Get.back();
  }
}



                // const Padding(
                //   padding: EdgeInsets.only(left: 8.0, top: 5),
                //   child: Text(
                //     'A brief description about your category',
                //     style: TextStyle(color: Color(0xffADADAD), fontSize: 11),
                //   ),
                // ),

                // const Padding(
                //   padding: EdgeInsets.only(left: 8.0, top: 5),
                //   child: Text(
                //     'This icon is used to get quick attention for your category',
                //     style: TextStyle(color: Color(0xffADADAD), fontSize: 11),
                //   ),
                // ),