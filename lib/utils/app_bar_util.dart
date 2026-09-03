import 'package:flutter/material.dart';

class AppBarUtil extends StatelessWidget implements PreferredSizeWidget {
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
  Widget build(BuildContext context) {
    return AppBar(
      title: (title == null || title!.isEmpty)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: (isSignedIn)
                      ? (leftRowChildren == [] || leftRowChildren.isEmpty)
                            ? (isCustomer)
                                  ? [
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Balance: ',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            TextSpan(
                                              text: '${balance ?? 0}',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]
                                  : (leftRowChildren == [] ||
                                        leftRowChildren.isEmpty)
                                  ? []
                                  : leftRowChildren
                            : leftRowChildren
                      : [],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: (isSignedIn)
                      ? (rightRowChildren == [] || rightRowChildren.isEmpty)
                            ? [
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Sign Out'),
                                ),
                              ]
                            : rightRowChildren
                      : [TextButton(onPressed: () {}, child: Text('Sign In'))],
                ),
              ],
            )
          : Text(title!),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        side: BorderSide(color: Colors.grey, width: 0.5),
      ),
      // backgroundColor: Colors.amber,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
