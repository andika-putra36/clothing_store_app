import 'package:clothing_store_app/models/auth.dart';
import 'package:clothing_store_app/providers/auth_provider.dart';
import 'package:clothing_store_app/screens/customers/catalogue_screen.dart';
import 'package:clothing_store_app/utils/app_screen_util.dart';
import 'package:clothing_store_app/utils/app_size_util.dart';
import 'package:clothing_store_app/widgets/clean_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const routeName = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return AppScreenUtil(
      appBarTitle: 'Sign In',
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
          // top: AppSizeUtils.screenWidth(context) / 15,
          // bottom: AppSizeUtils.screenWidth(context) / 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Welcome back to', style: TextStyle(fontSize: 24)),
                  Text(
                    'Clothing Store',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            CleanDividerBig(),
            Text('Please sign in to continue'),
            Row(
              children: [
                Text("Don't have an account yet?"),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text('Sign Up'),
                ),
              ],
            ),
            CleanDividerBig(),
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
                          await authProvider.signIn(
                            SignInRequest(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
                          );
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
                      child: Text('Sign In'),
                    ),
            ),
            // Text(data),
          ],
        ),
      ),
    );
  }
}

class TextFormString extends StatelessWidget {
  final TextEditingController textController;
  final String? labelText;
  final bool? obscureText;

  const TextFormString({
    super.key,
    required this.textController,
    this.labelText,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        labelText: labelText ?? '',
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          // borderSide: BorderSide(color: AppColor.border),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          // borderSide: BorderSide(color: AppColor.border, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        floatingLabelStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
