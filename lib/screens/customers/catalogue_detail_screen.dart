import 'package:clothing_store_app/providers/product_provider.dart';
import 'package:clothing_store_app/utils/app_screen_util.dart';
import 'package:clothing_store_app/utils/app_size_util.dart';
import 'package:clothing_store_app/widgets/clean_divider_widget.dart';
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
      onRefresh: () async {
        productProvider.getProduct(id);
      },
      isSignedIn: true,
      isCustomer: true,
      isAdmin: false,
      isManager: false,
      appBarLeftRowChildren: [],
      appBarRightRowChildren: [],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: AppSizeUtils.screenWidth(context) / 1.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: switch (productProvider.product!.productCategoryId!) {
                  1 => Image.asset('assets/images/basic_shirt.png'),
                  2 => Image.asset('assets/images/basic_pants.png'),
                  3 => Image.asset('assets/images/basic_hat.png'),
                  4 => Image.asset('assets/images/basic_shoes.png'),
                  _ => Text('failed to load photo'),
                },
              ),
            ),
          ),
          CleanDividerBig(),
          Container(
            // color: Colors.red,
            margin: EdgeInsets.only(
              left: AppSizeUtils.screenWidth(context) / 15,
              right: AppSizeUtils.screenWidth(context) / 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productProvider.product!.name!,
                  style: TextStyle(color: Colors.black87),
                  textAlign: TextAlign.left,
                ),
                Text(
                  'Rp${productProvider.product!.price!.toString()}',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                CleanDividerMedium(),
                Text(
                  productProvider.product!.description!,
                  style: TextStyle(color: Colors.black87),
                  textAlign: TextAlign.left,
                ),
                CleanDividerBig(),
                CleanDividerBig(),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
