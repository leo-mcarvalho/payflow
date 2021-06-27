import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_images.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/widgets/social_login/social_login_button.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.36,
              color: AppColors.primary,
            ),
            Positioned(
              left: 0,
              right: 0,
              top: size.height * 0.0455,
              child: Image.asset(
                AppImages.person,
                width: size.width * 0.554,
                height: size.height * 0.459,
              ),
            ),
            Positioned(
                left: 80,
                top: 280,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.secondary.withOpacity(0.9),
                            spreadRadius: 10,
                            blurRadius: 0,
                            offset: Offset(0, 0)),
                      ]),
                  child: Center(
                    child: Icon(
                      Icons.add_box_outlined,
                      color: AppColors.stroke,
                    ),
                  ),
                )),
            Positioned(
                right: 80,
                top: 185,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.secondary.withOpacity(0.9),
                            spreadRadius: 10,
                            blurRadius: 0,
                            offset: Offset(0, 0)),
                      ]),
                  child: Center(
                    child: Icon(
                      Icons.description_outlined,
                      color: AppColors.stroke,
                    ),
                  ),
                )),
            Positioned(
              bottom: size.height * 0.07,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logomini),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 70, right: 70, top: 30),
                    child: Text(
                      "Organize seus boletos em um só lugar",
                      style: TextStyles.titleHome,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 40.0, left: 40, right: 40),
                    child: SocialLoginButton(
                      onTap: () {
                        controller.googleSignIn(context);
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
