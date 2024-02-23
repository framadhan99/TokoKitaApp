import 'package:flutter/material.dart';

import 'config/config.dart';

final theme = ThemeData(
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: AssetColors.orangePastel),
    backgroundColor: Colors.white,
    titleTextStyle: AssetStyles.mediumTitle,
    elevation: 0,
    centerTitle: true,
  ),
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    TargetPlatform.iOS: OpenUpwardsPageTransitionsBuilder(),
  }),
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    displaySmall: AssetStyles.smallDescription,
    displayMedium: AssetStyles.mediumTitle,
    displayLarge: AssetStyles.bigDescription,
    bodySmall: AssetStyles.smallDescription,
    bodyMedium: AssetStyles.mediumTitle,
    bodyLarge: AssetStyles.bigDescription,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    floatingLabelStyle: TextStyle(color: AssetColors.greenDark),
  ),
);
