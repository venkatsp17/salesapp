//
// import 'package:flutter/material.dart';
//
//
//
//
// class Analytics extends StatelessWidget {
//   const Analytics({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<AppCubit>(create: (BuildContext context) => AppCubit()),
//       ],
//       child: MaterialApp.router(
//         title: AppTexts.appName,
//         theme: ThemeData(
//           brightness: Brightness.dark,
//           useMaterial3: true,
//           textTheme: GoogleFonts.assistantTextTheme(
//             Theme.of(context).textTheme.apply(
//               bodyColor: AppColors.mainTextColor3,
//             ),
//           ),
//           scaffoldBackgroundColor: AppColors.pageBackground,
//         ),
//         routerConfig: appRouterConfig,
//       ),
//     );
//   }
// }