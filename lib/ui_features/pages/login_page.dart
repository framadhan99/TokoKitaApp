import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tokokita/app/provider/auth_provider.dart';
import 'package:tokokita/ui_features/pages/signup_page.dart';

import '../../config/config.dart';
import '../../config/ui_helper.dart';
import '../widgets/button/button_primary.dart';
import '../widgets/textfield_general.dart';
import 'home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> logos = [
      AssetPaths.logoApple,
      AssetPaths.logoFacebook,
      AssetPaths.logoGoogle,
      AssetPaths.logoTwitter,
    ];
    return Consumer<AuthProvider>(builder: (context, prov, _) {
      return Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.1),
          child: Center(
            child: SizedBox(
              height: screenHeight(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  verticalSpace(100),
                  Text(
                    'Log in',
                    style: AssetStyles.mediumTitle.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      color: AssetColors.greenDark,
                    ),
                  ),
                  verticalSpace(30),
                  Text(
                    'Email',
                    style: AssetStyles.smallTitle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AssetColors.greenDark,
                    ),
                  ),
                  verticalSpace(6),
                  TextFieldGeneral(
                    controller: emailController,
                  ),
                  verticalSpace(9),
                  Text(
                    'Password',
                    style: AssetStyles.smallTitle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AssetColors.greenDark,
                    ),
                  ),
                  verticalSpace(6),
                  TextFieldGeneral(
                    obscureText: true,
                    controller: passwordController,
                  ),
                  verticalSpace(5),

                  verticalSpace(50),
                  Align(
                    alignment: Alignment.center,
                    child: ButtonPrimary(
                      label: 'Log in',
                      width: 114,
                      onTap: () {
                        prov.loginProvider(
                            emailController.text, passwordController.text);
                      },
                    ),
                  ),
                  verticalSpace(63),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      logos.length,
                      (index) => Image.asset(logos[index]),
                    ),
                  ),
                  verticalSpace(125),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Have an account ?',
                        style: AssetStyles.smallTitle.copyWith(
                          color: AssetColors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      horizontalSpace(10),
                      GestureDetector(
                        onTap: () => nextScreen(const SignupPage()),
                        child: Text(
                          'Sign up',
                          style: AssetStyles.smallTitle.copyWith(
                            color: AssetColors.orangePastel,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // verticalSpace(50),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
