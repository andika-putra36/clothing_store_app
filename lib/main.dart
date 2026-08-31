import '../screens/customers/catalogue_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ClothingStoreApp());
}

class ClothingStoreApp extends StatelessWidget {
  const ClothingStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: CatalogueScreen.routeName,
      routes: {CatalogueScreen.routeName: (context) => CatalogueScreen()},
    );
  }
}
