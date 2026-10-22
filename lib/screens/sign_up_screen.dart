import 'package:clothing_store_app/providers/auth_provider.dart';
import 'package:clothing_store_app/screens/sign_in_screen.dart';
import 'package:clothing_store_app/utils/app_screen_util.dart';
import 'package:clothing_store_app/utils/app_size_util.dart';
import 'package:clothing_store_app/widgets/clean_divider_widget.dart';
import 'package:clothing_store_app/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const routeName = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return AppScreenUtil(
      appBarTitle: 'Sign Up',
      isSignedIn: false,
      isCustomer: false,
      isAdmin: false,
      isManager: false,
      appBarLeftRowChildren: [],
      appBarRightRowChildren: [],
      enableDrawer: false,
      child: Container(
        padding: EdgeInsets.only(
          left: AppSizeUtils.screenWidth(context) / 15,
          right: AppSizeUtils.screenWidth(context) / 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Welcome to', style: TextStyle(fontSize: 24)),
                  Text(
                    'Clothing Store',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            CleanDividerBig(),
            Text(
              "Let's get started!",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('use your email to create an account'),
            CleanDividerSmall(),
            Row(
              children: [
                Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      SignInScreen.routeName,
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text('Sign In'),
                ),
              ],
            ),
            CleanDividerBig(),
            TextFormString(textController: _nameController, labelText: 'Name'),
            CleanDividerSmall(),
            TextFormString(
              textController: _emailController,
              labelText: 'E-mail',
            ),
            CleanDividerSmall(),
            TextFormString(
              textController: _passwordController,
              labelText: 'Password',
              obscureText: true,
            ),
            CleanDividerBig(),
            CleanDividerBig(),
            SizedBox(
              width: double.infinity,
              child: _isLoading
                  ? Center(child: CircularProgressIndicator(strokeWidth: 3))
                  : ElevatedButton(
                      onPressed: () async {
                        setState(() => _isLoading = true);
                        try {
                          // await authProvider.signIn(
                          //   SignInRequest(
                          //     email: _emailController.text,
                          //     password: _passwordController.text,
                          //   ),
                          // );
                        } catch (e) {
                          //
                        } finally {
                          setState(() => _isLoading = false);

                          if (authProvider.errorMessage!.isEmpty) {
                            Navigator.pop(context);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(authProvider.errorMessage!),
                              ),
                            );
                          }
                        }
                      },
                      child: Text('Sign Up'),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
