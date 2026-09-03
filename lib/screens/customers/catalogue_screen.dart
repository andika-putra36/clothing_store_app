import 'package:clothing_store_app/models/product.dart';
import 'package:clothing_store_app/utils/app_size_util.dart';
import 'package:clothing_store_app/widgets/clean_divider_widget.dart';

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
      isSignedIn: false,
      isCustomer: false,
      appBarLeftRowChildren: [],
      appBarRightRowChildren: [],
      child: ProductsView(products: productProvider.products),
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [Text('Test ok')],
      // ),
    );
  }
}

class ProductsView extends StatelessWidget {
  final List<Product> products;
  const ProductsView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return (products.isNotEmpty)
        ?
          // Column(
          //     children: [for (int i = 0; i < products.length; i++) Text('data')],
          //   )
          Column(
            children: [
              GridView.builder(
                itemCount: products.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              ),
            ],
          )
        // ProductCard(product: products[0])
        : Text('there is no data');
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        width: AppSizeUtils.screenWidth(context) / 2.5,
        // height: 10,
        // color: Colors.red,
        // margin: EdgeInsets.all(),
        padding: EdgeInsets.only(
          left: AppSizeUtils.screenWidth(context) / 50,
          right: AppSizeUtils.screenWidth(context) / 50,
          top: AppSizeUtils.screenWidth(context) / 50,
          bottom: AppSizeUtils.screenWidth(context) / 50,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey, width: 1.5),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(AppSizeUtils.screenWidth(context) / 60),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: switch (product.productCategoryId) {
                  1 => Image.asset('assets/images/basic_shirt.png'),
                  2 => Image.asset('assets/images/basic_pants.png'),
                  3 => Image.asset('assets/images/basic_hat.png'),
                  4 => Image.asset('assets/images/basic_shoes.png'),
                  _ => Text('failed to load photo'),
                },
              ),
            ),
            CleanDividerSmall(),
            SizedBox(
              width: AppSizeUtils.screenWidth(context) / 3,
              // color: Colors.red,
              child: Text(product.name!, textDirection: TextDirection.ltr),
            ),
            Divider(color: Colors.black45, thickness: 1),
            SizedBox(
              width: AppSizeUtils.screenWidth(context) / 3,
              child: Text(
                'Rp${product.price!.toString()}',
                textDirection: TextDirection.rtl,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
