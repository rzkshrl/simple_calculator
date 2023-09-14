import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final c = Get.put(HistoryController());
    c.sortAscending();
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'History',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontSize: 16.sp),
              ),
              IconButton(
                onPressed: () {
                  c.deleteAllItems();
                },
                icon: Icon(IconlyLight.delete),
              ),
            ],
          ),
        ),
        body: Obx(
          () => c.isLoading.value
              ? Center(
                  child:
                      Lottie.asset('assets/lottie/loading.json', height: 135))
              : Padding(
                  padding: EdgeInsets.only(left: 3.w, right: 3.w),
                  child: ListView.builder(
                      itemCount: c.items.length,
                      padding: EdgeInsets.only(bottom: 0.1.h),
                      itemBuilder: (context, index) {
                        final items = c.items[index];
                        final currentDate =
                            c.extractDateFromTimestamp(items['createdAt']);
                        final dateFormatter =
                            DateFormat('d MMMM yyyy', 'id-ID');

                        bool showDate = true;
                        if (index > 0) {
                          final previousDate = c.extractDateFromTimestamp(c
                                  .items[index - 1][
                              'createdAt']); // Gantilah ini dengan field tanggal di dalam item
                          showDate = currentDate != previousDate;
                        }
                        if (c.items.length == 0) {
                          Center(
                              child: Text(
                            'History is Empty',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(fontSize: 16.sp),
                          ));
                        } else {
                          return Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (showDate)
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 6.w,
                                      bottom: 2.h,
                                    ),
                                    child: Text(
                                      dateFormatter.format(DateTime.parse(
                                          currentDate)), // Gantilah ini dengan cara yang sesuai untuk menampilkan tanggal
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!
                                          .copyWith(fontSize: 10.sp),
                                    ),
                                  ),
                                Container(
                                  padding: EdgeInsets.only(
                                    right: 6.w,
                                    left: 6.w,
                                  ),
                                  height: 8.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22),
                                    color: Theme.of(Get.context!).primaryColor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${items['hitung']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayLarge!
                                                .copyWith(fontSize: 12.sp),
                                          ),
                                          SizedBox(
                                            height: 0.5.h,
                                          ),
                                          Text(
                                            '=${items['hasil']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall!
                                                .copyWith(fontSize: 18.sp),
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          c.deleteItem(c.items[index]['id']);
                                        },
                                        icon: Icon(IconlyLight.delete),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      }),
                ),
        ));
  }
}
