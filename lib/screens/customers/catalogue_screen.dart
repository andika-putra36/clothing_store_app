import '/utils/app_screen_util.dart';
import 'package:flutter/material.dart';

class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({super.key});

  static const routeName = '/customers/catalogues';

  @override
  Widget build(BuildContext context) {
    return AppScreenUtil(
      // appBarTitle: 'Test',
      isSignedIn: false,
      appBarLeftRowChildren: [Text('Test')],
      appBarRightRowChildren: [Text('Test')],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('Test ok')],
      ),
    );
  }
}
