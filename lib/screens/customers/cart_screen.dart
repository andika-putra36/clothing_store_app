import 'package:clothing_store_app/utils/app_screen_util.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return AppScreenUtil(
      isSignedIn: true,
      isCustomer: true,
      isAdmin: false,
      isManager: false,
      appBarLeftRowChildren: [],
      appBarRightRowChildren: [],
      enableDrawer: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text('Test')],
      ),
    );
  }
}
