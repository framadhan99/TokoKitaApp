import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tokokita/app/provider/auth_provider.dart';
import 'package:tokokita/ui_features/pages/login_page.dart';

import '../../config/config.dart';
import '../../config/ui_helper.dart';
import '../widgets/button/button_primary.dart';
import '../widgets/textfield_general.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController nameController = TextEditingController();
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
                    'Sign up',
                    style: AssetStyles.mediumTitle.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      color: AssetColors.greenDark,
                    ),
                  ),
                  verticalSpace(30),
                  Text(
                    'Name',
                    style: AssetStyles.smallTitle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AssetColors.greenDark,
                    ),
                  ),
                  verticalSpace(6),
                  TextFieldGeneral(
                    controller: nameController,
                  ),
                  verticalSpace(9),
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
                  verticalSpace(50),
                  Align(
                    alignment: Alignment.center,
                    child: ButtonPrimary(
                      label: 'Create account',
                      width: 162,
                      onTap: () {
                        prov.registrasiProvider(nameController.text,
                            emailController.text, passwordController.text);
                      },
                    ),
                  ),
                  verticalSpace(36),
                  SizedBox(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const Divider(),
                        Container(
                          width: 17,
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: Text(
                            'or',
                            style: AssetStyles.smallDescription.copyWith(
                              color: const Color(0xffE0E0E0),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  verticalSpace(12),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Continue with',
                      style: AssetStyles.mediumTitle.copyWith(
                        fontSize: 14,
                        color: AssetColors.orangePastel,
                      ),
                    ),
                  ),
                  verticalSpace(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      logos.length,
                      (index) => Image.asset(logos[index]),
                    ),
                  ),
                  verticalSpace(100),
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
                        onTap: () => nextScreen(const LoginPage()),
                        child: Text(
                          'Log in',
                          style: AssetStyles.smallTitle.copyWith(
                            color: AssetColors.orangePastel,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // verticalSpace(50)
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
