import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class AppSpacer extends SizedBox {
//Vertical Space
  AppSpacer.vertical5({super.key}) : super(height: 5.h);
  AppSpacer.vertical10({super.key}) : super(height: 10.h);
  AppSpacer.vertical15({super.key}) : super(height: 15.h);
  AppSpacer.vertical20({super.key}) : super(height: 20.h);
  AppSpacer.vertical25({super.key}) : super(height: 25.h);
  AppSpacer.vertical30({super.key}) : super(height: 30.h);
  AppSpacer.vertical50({super.key}) : super(height: 50.h);

//Horizontal Space
  AppSpacer.horizontal5({super.key}) : super(width: 5.w);
  AppSpacer.horizontal10({super.key}) : super(width: 10.w);
  AppSpacer.horizontal15({super.key}) : super(width: 15.w);
  AppSpacer.horizontal20({super.key}) : super(width: 20.w);
  AppSpacer.horizontal25({super.key}) : super(width: 25.w);
  AppSpacer.horizontal30({super.key}) : super(width: 30.w);
}
