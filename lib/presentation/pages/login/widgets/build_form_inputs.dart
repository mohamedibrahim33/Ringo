import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test/core/utils/colors.dart';
import 'package:flutter_dev_test/core/utils/utils.dart';
import 'package:flutter_dev_test/presentation/components/button_widget.dart';
import 'package:flutter_dev_test/presentation/components/edit_text_widget.dart';
import 'package:flutter_dev_test/presentation/components/text_widget.dart';
import 'package:flutter_dev_test/presentation/pages/home/home.dart';
import 'package:flutter_dev_test/presentation/pages/login/cubit/login_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildFormInputs extends StatefulWidget {
  const BuildFormInputs({
    super.key,
  });

  @override
  State<BuildFormInputs> createState() => _BuildFormInputsState();
}

class _BuildFormInputsState extends State<BuildFormInputs> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passworController = TextEditingController();
  bool get isValid =>
      emailController.text.isNotEmpty && passworController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        LoginCubit cubit = context.read<LoginCubit>();
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                title: "username_email".tr(),
                fontWeight: FontWeight.w600,
              ),
              CustomTextFormField(
                controller: emailController,
                hintText: "enter_username_email".tr(),
                // validator: (p0) => Validation().defaultValidation(p0),
                onChanged: (p0) => setState(() {}),
              ),
              SizedBox(
                height: 24.h,
              ),
              TextWidget(
                title: "password".tr(),
                fontWeight: FontWeight.w600,
              ),
              CustomTextFormField(
                controller: passworController,
                hintText: "enter_password_here".tr(),
                password: cubit.isPasswordVisible ? true : false,
                // validator: (p0) => Validation().defaultValidation(p0),
                suffixIcon: GestureDetector(
                    onTap: () => cubit.changePasswordVisibility(),
                    child: Icon(cubit.isPasswordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined)),
                onChanged: (p0) => setState(() {}),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: TextWidget(
                    title: "forgot_password".tr(),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ButtonWidget(
                title: "login".tr(),
                onTap: isValid
                    ? () {
                        if (formKey.currentState!.validate()) {
                          Utils.openScreen(context, HomePage(), remove: true);
                        }
                      }
                    : null,
                backgroundButtonColor:
                    isValid ? primaryColor : buttonBackgroundColor,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: Align(
                    alignment: Alignment.center,
                    child: TextWidget(
                      title: "login_with_account".tr(),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: secondaryColor,
                    )),
              ),
            ],
          ),
        );
      },
    );
  }
}
