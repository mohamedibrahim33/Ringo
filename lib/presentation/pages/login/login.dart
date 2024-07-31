import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test/core/utils/app_assets.dart';
import 'package:flutter_dev_test/core/utils/colors.dart';
import 'package:flutter_dev_test/presentation/components/text_widget.dart';
import 'package:flutter_dev_test/presentation/pages/login/cubit/login_cubit.dart';
import 'package:flutter_dev_test/presentation/pages/login/widgets/build_form_inputs.dart';
import 'package:flutter_dev_test/presentation/pages/login/widgets/social_media_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 24.w, left: 24.w, right: 24.w),
        child: BlocProvider(
          create: (context) => LoginCubit(),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TextWidget(
                title: "login".tr(),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.h, bottom: 40.h),
                child: TextWidget(
                  title: "sign_in_to_your_account".tr(),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: secondaryColor,
                ),
              ),
              const BuildFormInputs(),
              SocialMediaButton(
                title: "Continue with Google".tr(),
                icon: IconsManager.google,
              ),
              SocialMediaButton(
                title: "Continue with Facebook".tr(),
                icon: IconsManager.facebook,
              ),
              SocialMediaButton(
                title: "Continue with Apple".tr(),
                icon: IconsManager.apple,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      title: "Donot have an account".tr(),
                      fontWeight: FontWeight.w500,
                      color: secondaryColor,
                    ),
                    SizedBox(width: 4.w),
                    TextWidget(
                      title: "Register Here".tr(),
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    ));
  }
}
