import 'package:clothing_store_app/providers/auth_provider.dart';
import 'package:clothing_store_app/screens/customers/transactions_screen.dart';
import 'package:clothing_store_app/screens/sign_in_screen.dart';

import './screens/customers/cart_screen.dart';
import './screens/customers/catalogue_detail_screen.dart';
import '../providers/product_provider.dart';
import 'package:provider/provider.dart';
import '../screens/customers/catalogue_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ClothingStoreApp());
}

class ClothingStoreApp extends StatelessWidget {
  const ClothingStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: CatalogueScreen.routeName,
        routes: {
          CatalogueScreen.routeName: (context) => CatalogueScreen(),
          CatalogueDetailScreen.routeName: (context) => CatalogueDetailScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          TransactionScreen.routeName: (context) => TransactionScreen(),
          SignInScreen.routeName: (context) => SignInScreen(),
        },
      ),
    );
  }
}
