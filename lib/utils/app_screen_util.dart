import '/utils/app_bar_util.dart';

import 'app_size_util.dart';
import 'package:flutter/material.dart';

class AppScreenUtil extends StatelessWidget {
  final bool isSignedIn;
  final bool isCustomer;
  final bool? isAdmin;
  final String? appBarTitle;
  final double? appBarBalance;
  final List<Widget> appBarLeftRowChildren;
  final List<Widget> appBarRightRowChildren;
  final Future<void> Function()? onRefresh;
  final Widget child;
  final void Function()? floatingActionButton;
  final Widget? floatingActionButtonChild;

  const AppScreenUtil({
    super.key,
    required this.isSignedIn,
    required this.isCustomer,
    this.isAdmin,
    this.appBarTitle,
    this.appBarBalance,
    required this.appBarLeftRowChildren,
    required this.appBarRightRowChildren,
    this.onRefresh,
    required this.child,
    this.floatingActionButton,
    this.floatingActionButtonChild,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUtil(
        isSignedIn: isSignedIn,
        isCustomer: isCustomer,
        isAdmin: isAdmin,
        title: appBarTitle,
        balance: appBarBalance,
        leftRowChildren: appBarLeftRowChildren,
        rightRowChildren: appBarRightRowChildren,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          onRefresh?.call();
        },
        child: SizedBox(
          height: AppSizeUtils.bodyHeight(context),
          width: AppSizeUtils.screenWidth(context),
          // color: Colors.amber,
          // padding: EdgeInsets.all(20),
          child: Scrollbar(
            thumbVisibility: true,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Container(
                padding: EdgeInsets.only(
                  left: AppSizeUtils.screenWidth(context) / 10,
                  right: AppSizeUtils.screenWidth(context) / 10,
                  top: AppSizeUtils.screenWidth(context) / 15,
                  bottom: AppSizeUtils.screenWidth(context) / 15,
                ),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
