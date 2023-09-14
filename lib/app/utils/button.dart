import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Widget btnNum(Function()? onTap, String btnText) {
  return Padding(
    padding: EdgeInsets.only(
      left: 2.w,
      right: 2.w,
      top: 0.8.h,
      bottom: 0.8.h,
    ),
    child: InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Theme.of(Get.context!).primaryColor,
        ),
        child: Center(
          child: Text(
            btnText,
            style: Theme.of(Get.context!)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.bold, fontSize: 26.sp),
          ),
        ),
      ),
    ),
  );
}

Widget btnOperator(Function()? onTap, String btnText) {
  return Padding(
    padding: EdgeInsets.only(
      left: 2.w,
      right: 2.w,
      top: 0.8.h,
      bottom: 0.8.h,
    ),
    child: InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Theme.of(Get.context!).iconTheme.color!),
          color: Theme.of(Get.context!).primaryColor,
        ),
        child: Center(
          child: Text(
            btnText,
            style: Theme.of(Get.context!)
                .textTheme
                .headlineLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
  );
}
