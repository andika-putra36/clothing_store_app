import 'package:clothing_store_app/providers/auth_provider.dart';
import 'package:clothing_store_app/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarUtil extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget> leftRowChildren;
  final List<Widget> rightRowChildren;
  final bool isSignedIn;
  final bool isCustomer;
  final bool? isAdmin;
  final double? balance;

  const AppBarUtil({
    super.key,
    this.title,
    required this.leftRowChildren,
    required this.rightRowChildren,
    required this.isSignedIn,
    required this.isCustomer,
    this.isAdmin,
    this.balance,
  });

  @override
  State<AppBarUtil> createState() => _AppBarUtilState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarUtilState extends State<AppBarUtil> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return AppBar(
      title: (widget.title == null || widget.title!.isEmpty)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: (widget.isSignedIn)
                      ? (widget.leftRowChildren == [] ||
                                widget.leftRowChildren.isEmpty)
                            ? (widget.isCustomer)
                                  ? [
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Balance: ',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            TextSpan(
                                              text: '${widget.balance ?? 0}',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]
                                  : (widget.leftRowChildren == [] ||
                                        widget.leftRowChildren.isEmpty)
                                  ? []
                                  : widget.leftRowChildren
                            : widget.leftRowChildren
                      : [],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: (widget.isSignedIn)
                      ? (widget.rightRowChildren == [] ||
                                widget.rightRowChildren.isEmpty)
                            ? [
                                TextButton(
                                  onPressed: () async {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        contentPadding: EdgeInsets.all(30),
                                        content: Text(
                                          'Are you sure you want to sign out?',
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('No'),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              Navigator.pop(context);

                                              try {
                                                await authProvider.signOut();
                                              } catch (e) {
                                                //
                                              } finally {
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Signed out successfully',
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                            child: Text('Yes'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: Text('Sign Out'),
                                ),
                              ]
                            : widget.rightRowChildren
                      : [
                          TextButton(
                            onPressed: () {
                              Navigator.of(
                                context,
                              ).pushNamed(SignInScreen.routeName);
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(color: Colors.indigoAccent),
                            ),
                          ),
                        ],
                ),
              ],
            )
          : Text(widget.title!, style: TextStyle(fontSize: 16)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        side: BorderSide(color: Colors.grey, width: 0.5),
      ),
      backgroundColor: Colors.white54,
    );
  }

  // @override
  // Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
