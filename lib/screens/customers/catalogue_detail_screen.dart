import 'package:clothing_store_app/providers/product_provider.dart';
import 'package:clothing_store_app/utils/app_screen_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatalogueDetailScreen extends StatefulWidget {
  const CatalogueDetailScreen({super.key});

  static const routeName = '/customers/catalogues/detail';

  @override
  State<CatalogueDetailScreen> createState() => _CatalogueDetailScreenState();
}

class _CatalogueDetailScreenState extends State<CatalogueDetailScreen> {
  bool isInit = true;

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();

    final args =
        ModalRoute.of(context)!.settings.arguments! as Map<String, dynamic>;
    final id = args["id"] as int;

    if (isInit) {
      await Provider.of<ProductProvider>(context).getProduct(id);
      isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final args =
        ModalRoute.of(context)!.settings.arguments! as Map<String, dynamic>;
    final id = args["id"] as int;

    return AppScreenUtil(
      appBarTitle: 'Product Detail',
      enableDrawer: false,
      isSignedIn: true,
      isCustomer: true,
      isAdmin: false,
      isManager: false,
      appBarLeftRowChildren: [],
      appBarRightRowChildren: [],
      child: Column(children: []),
    );
  }
}
