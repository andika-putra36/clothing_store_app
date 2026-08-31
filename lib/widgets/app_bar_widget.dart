// import '../utils/app_bar_util.dart';
// import 'package:flutter/material.dart';

// class AppBarNotSignedIn extends StatelessWidget implements PreferredSizeWidget {
//   final bool? isLoggedIn;
//   final bool? isCustomer;
//   final bool? isAdmin;

//   const AppBarNotSignedIn({
//     super.key,
//     this.isLoggedIn,
//     this.isCustomer,
//     this.isAdmin,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AppBarUtil(
//       rightRowChildren: [TextButton(onPressed: () {}, child: Text('Sign In'))],
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }

// class AppBarSignedIn extends StatelessWidget implements PreferredSizeWidget {
//   const AppBarSignedIn({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AppBarUtil(
//       rightRowChildren: [TextButton(onPressed: () {}, child: Text('Sign Out'))],
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }
