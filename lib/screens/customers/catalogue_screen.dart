import '/providers/product_provider.dart';
import 'package:provider/provider.dart';

import '/utils/app_screen_util.dart';
import 'package:flutter/material.dart';

class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({super.key});

  static const routeName = '/customers/catalogues';

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  bool isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (isInit) {
      Provider.of<ProductProvider>(context).getProducts();
      isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return AppScreenUtil(
      onRefresh: () async {
        productProvider.getProducts();
      },
      // appBarTitle: 'Test',
      isSignedIn: true,
      isCustomer: true,
      appBarLeftRowChildren: [],
      appBarRightRowChildren: [],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('Test ok')],
      ),
    );
  }
}
