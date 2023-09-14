import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:simple_calculator/app/modules/history/controllers/history_controller.dart';
import 'package:simple_calculator/app/routes/app_pages.dart';
import 'package:simple_calculator/app/utils/button.dart';
import 'package:sizer/sizer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final c = Get.put(HomeController());
    final historyC = Get.put(HistoryController());

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          // title: const Text('Simple Calculator'),
          // centerTitle: true,
          // titleTextStyle: Theme.of(context)
          //     .textTheme
          //     .headlineLarge!
          //     .copyWith(fontSize: 16.sp),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 2.w, right: 2.w),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2.5.h, right: 2.5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FocusedMenuHolder(
                      onPressed: () {},
                      menuBoxDecoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15.0)),
                        color: Theme.of(context).primaryColor,
                      ),
                      menuItems: [
                        FocusedMenuItem(
                            title: Text("History",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontSize: 10.sp)),
                            onPressed: () {
                              Get.toNamed(Routes.HISTORY);
                            },
                            backgroundColor: Colors.transparent),
                      ],
                      duration: const Duration(milliseconds: 100),
                      // blurBackgroundColor: light.withOpacity(0.001),
                      blurSize: 0,
                      openWithTap: true,
                      bottomOffsetHeight:
                          MediaQuery.of(context).size.height * -1,
                      menuOffset: MediaQuery.of(context).size.height * 0.02,
                      menuWidth: 30.w,
                      animateMenuItems: false,
                      child: const ClipOval(
                        child: Material(
                          color: Colors.transparent,
                          child: Icon(
                            IconlyLight.filter,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 6.w),
                      alignment: Alignment.centerRight,
                      child: Text(
                        c.userInput.value,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(fontSize: 38.sp),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 6.w),
                      alignment: Alignment.centerRight,
                      child: Text(
                        c.answer.value,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 20.sp),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Expanded(
                  flex: 3,
                  child: GridView.builder(
                    itemCount: c.buttons.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      switch (index) {
                        case 0:
                          return btnOperator(
                            () {
                              c.userInput.value = '';
                              c.answer.value = '';
                            },
                            c.buttons[index],
                          );

                        case 1:
                          return btnOperator(
                            () {
                              c.userInput.value += c.buttons[index];
                            },
                            '÷',
                          );
                        case 2:
                          return btnOperator(
                            () {
                              c.userInput.value += c.buttons[index];
                            },
                            c.buttons[index],
                          );
                        case 3:
                          return btnOperator(
                            () {
                              c.userInput.value = c.userInput
                                  .substring(0, c.userInput.value.length - 1);
                            },
                            c.buttons[index],
                          );

                        case 4:
                          return btnNum(
                            () {
                              c.userInput.value += c.buttons[index];
                            },
                            c.buttons[index],
                          );
                        case 5:
                          return btnNum(
                            () {
                              c.userInput.value += c.buttons[index];
                            },
                            c.buttons[index],
                          );
                        case 6:
                          return btnNum(
                            () {
                              c.userInput.value += c.buttons[index];
                            },
                            c.buttons[index],
                          );
                        case 7:
                          return btnOperator(
                            () {
                              c.userInput.value += c.buttons[index];
                            },
                            c.buttons[index],
                          );
                        case 8:
                          return btnNum(
                            () {
                              c.userInput.value += c.buttons[index];
                            },
                            c.buttons[index],
                          );
                        case 9:
                          return btnNum(
                            () {
                              c.userInput.value += c.buttons[index];
                            },
                            c.buttons[index],
                          );
                        case 10:
                          return btnNum(
                            () {
                              c.userInput.value += c.buttons[index];
                            },
                            c.buttons[index],
                          );
                        case 11:
                          return btnOperator(
                            () {
                              c.userInput.value += c.buttons[index];
                            },
                            c.buttons[index],
                          );
                        case 12:
                          return btnNum(
                            () {
                              c.userInput.value += c.buttons[index];
                            },
                            c.buttons[index],
                          );
                        case 13:
                          return btnNum(
                            () {
                              c.userInput.value += c.buttons[index];
                            },
                            c.buttons[index],
                          );
                        case 14:
                          return btnNum(
                            () {
                              c.userInput.value += c.buttons[index];
                            },
                            c.buttons[index],
                          );
                        case 15:
                          return btnOperator(
                            () {
                              c.equalPressed();
                              historyC.addItem();
                            },
                            c.buttons[index],
                          );
                        case 16:
                          return btnNum(
                            () {
                              c.userInput.value += c.buttons[index];
                            },
                            c.buttons[index],
                          );
                        case 17:
                          return btnNum(
                            () {
                              c.userInput.value += c.buttons[index];
                            },
                            c.buttons[index],
                          );
                        case 18:
                          return btnNum(
                            () {
                              c.userInput.value += c.buttons[index];
                            },
                            c.buttons[index],
                          );
                        default:
                      }
                      return null;
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
