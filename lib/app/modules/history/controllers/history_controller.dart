// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:simple_calculator/app/utils/sql_helper.dart';
import 'package:sizer/sizer.dart';

import '../../home/controllers/home_controller.dart';

class HistoryController extends GetxController {
  final isLoading = true.obs;
  final items = <Map<String, dynamic>>[].obs;
  final homeC = Get.put(HomeController());

  @override
  void onInit() {
    super.onInit();
    refreshHistory();
  }

  void sortAscending() {
    items.sort((a, b) => b['id'].compareTo(a['id']));
  }

  String extractDateFromTimestamp(String timestamp) {
    final dateTime =
        DateTime.parse(timestamp); // Ubah timestamp menjadi objek DateTime
    final formattedDate =
        DateFormat('yyyy-MM-dd').format(dateTime); // Format tanggal
    return formattedDate;
  }

  void refreshHistory() async {
    final data = await SQLHelper.getItems();
    items.assignAll(data);
    isLoading.value = false;
    sortAscending();
  }

  Future<void> addItem() async {
    final existingItems = items.any((element) =>
        element['hitung'] == homeC.userInput.value &&
        element['hasil'] == homeC.answer.value);
    if (!existingItems) {
      await SQLHelper.createItem(homeC.userInput.value, homeC.answer.value);
    } else {}

    refreshHistory();
  }

  void deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    Get.snackbar("Success!", "Item deleted.",
        duration: const Duration(milliseconds: 1500),
        snackPosition: SnackPosition.BOTTOM);
    refreshHistory();
  }

  Future<void> deleteAllItems() async {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: Get.context!,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Theme.of(Get.context!).primaryColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Clear all records?',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 14.sp),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Cancel',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontSize: 14.sp),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        SQLHelper.deleteAllItem();
                        Navigator.of(context).pop();
                        refreshHistory();
                      },
                      child: Text(
                        'Clear',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                fontSize: 14.sp, color: HexColor('#b30000')),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
