import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tokokita/app/provider/auth_provider.dart';
import 'package:tokokita/app/provider/produk_provider.dart';
import 'package:tokokita/app_theme.dart';
import 'package:tokokita/config/navigation_service.dart';
import 'package:tokokita/ui_features/pages/login_page.dart';

void main() {
  runApp(const TokoKitaApp());
}

class TokoKitaApp extends StatelessWidget {
  const TokoKitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProdukProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        navigatorKey: navigatorKey,
        home: const LoginPage(),
      ),
    );
  }
}
