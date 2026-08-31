import '../utils/app_bar_util.dart';
import 'package:flutter/material.dart';

class AppScreenUtil extends StatelessWidget {
  final String? appBarTitle;
  final Future<void> Function()? onRefresh;
  final Widget child;

  const AppScreenUtil({
    super.key,
    this.appBarTitle,
    this.onRefresh,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBarUtil(title: appBarTitle ?? ''));
  }
}
