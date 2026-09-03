import '../utils/app_size_util.dart';
import 'package:flutter/material.dart';

class CleanDividerSmall extends StatelessWidget {
  const CleanDividerSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: AppSizeUtils.screenHeight(context) / 50);
  }
}

class CleanDividerMedium extends StatelessWidget {
  const CleanDividerMedium({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: AppSizeUtils.screenHeight(context) / 40);
  }
}

class CleanDividerBig extends StatelessWidget {
  const CleanDividerBig({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: AppSizeUtils.screenHeight(context) / 30);
  }
}
