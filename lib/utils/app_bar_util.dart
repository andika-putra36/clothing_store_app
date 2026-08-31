import 'package:flutter/material.dart';

class AppBarUtil extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? leftRowChildren;
  final List<Widget>? rightRowChildren;
  final bool isSignedIn;
  final bool? isCustomer;
  final bool? isAdmin;
  // final Widget? child;

  const AppBarUtil({
    super.key,
    this.title,
    this.leftRowChildren,
    this.rightRowChildren,
    required this.isSignedIn,
    this.isCustomer,
    this.isAdmin,
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
                  children: leftRowChildren ?? [],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: (isSignedIn)
                      ? rightRowChildren ??
                            [
                              TextButton(
                                onPressed: () {},
                                child: Text('Sign Out'),
                              ),
                            ]
                      : [TextButton(onPressed: () {}, child: Text('Sign In'))],
                ),
              ],
            )
          : Text(title!),
      // centerTitle: true,
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
