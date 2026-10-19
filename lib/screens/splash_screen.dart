import 'package:clothing_store_app/providers/auth_provider.dart';
import 'package:clothing_store_app/screens/customers/catalogue_screen.dart';
import 'package:clothing_store_app/widgets/clean_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateToCatalogue();
  }

  Future<void> _navigateToCatalogue() async {
    // await Provider.of<AuthProvider>(context).loadFromSecureStorage();
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, CatalogueScreen.routeName);
  }

  bool isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (isInit) {
      Provider.of<AuthProvider>(context).loadFromSecureStorage();
      isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Clothing Store',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            CleanDividerSmall(),
            Text('By Andika Putra'),
          ],
        ),
      ),
    );
  }
}
