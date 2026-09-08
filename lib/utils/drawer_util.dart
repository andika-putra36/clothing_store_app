import '../screens/customers/catalogue_screen.dart';
import 'package:flutter/material.dart';

class DrawerUtil extends StatelessWidget {
  const DrawerUtil({
    super.key,
    required this.isSignedIn,
    required this.isCustomer,
    required this.isAdmin,
    required this.isManager,
  });

  final bool isSignedIn;
  final bool isCustomer;
  final bool isAdmin;
  final bool isManager;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: isSignedIn
            ? isCustomer
                  ? [
                      CustomDrawerHeader(),
                      ListTile(
                        leading: Icon(Icons.shopping_bag),
                        title: Text('Catalogue'),
                        onTap: () {
                          // Navigator.pop(context);
                          Navigator.pushReplacementNamed(
                            context,
                            CatalogueScreen.routeName,
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.shopping_cart),
                        title: Text('Cart'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.note),
                        title: Text('Transactions'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ]
                  : isAdmin
                  ? [
                      CustomDrawerHeader(),
                      ListTile(
                        leading: Icon(Icons.shopping_bag),
                        title: Text('Manage Products'),
                        onTap: () {
                          // Navigator.pop(context);
                          Navigator.pushReplacementNamed(
                            context,
                            CatalogueScreen.routeName,
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.note),
                        title: Text('Transactions'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ]
                  : isManager
                  ? [
                      CustomDrawerHeader(),
                      ListTile(
                        leading: Icon(Icons.analytics),
                        title: Text('Analytics'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ]
                  : []
            : [
                CustomDrawerHeader(),
                ListTile(
                  leading: Icon(Icons.shopping_bag),
                  title: Text('Catalogue'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
      ),
    );
  }
}

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Text(
        'Clothing Store Menu',
        style: TextStyle(color: Colors.black87, fontSize: 24),
      ),
    );
  }
}
