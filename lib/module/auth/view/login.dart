import 'package:epump/app/app_string.dart';
import 'package:epump/model/login_req.dart';
import 'package:epump/module/auth/viewModel/login_vm.dart';
import 'package:epump/util/keyboard.dart';
import 'package:epump/util/validator.dart';
import 'package:epump/widget/default_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../util/form_data.dart';
import '../../../widget/alternative_signed_up.dart';
import '../../../widget/header_tag.dart';
import '../../../widget/social_widegt.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = GlobalKey<FormState>();
    var size = MediaQuery.of(context).size;
    return Consumer<LoginViewModel>(builder: (context, loginViewModel, child) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 20),
            child: Column(
              children: [
                Expanded(
                  flex: 0,
                  child: HeaderTag(
                    onTap: () {},
                    title: 'Log in',
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(top: 50.0),
                      child: Form(
                        key: loginForm,
                        child: ListView(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          // // mainAxisAlignment: MainAxisAlignment.start,

                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                AppStrings.loginHeaderText,
                                textAlign: TextAlign.left,
                                style: GoogleFonts.nunito(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w300,
                                  //  color: Color(0xff888888)
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.04.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                OtherAuth(
                                  icon: PhosphorIcons.google_logo_bold,
                                ),
                                OtherAuth(icon: PhosphorIcons.apple_logo_fill),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.02.h,
                            ),
                            SPForm(
                              validateForm: EmailValidator.validateEmail,
                              controller: loginViewModel.emailController,
                              onChanged: (value) {
                                if (value.isEmpty) return;
                                bool isValid =
                                    loginForm.currentState.validate();
                                if (isValid) {
                                  loginViewModel.validateEmail(isValid);
                                }
                              },
                              hintText: 'Enter Your Email',
                              labelText: AppStrings.emailLabel,
                            ),
                            SPForm(
                              maxLin: 1,
                              controller: loginViewModel.passwordController,
                              passwordVisible: true,
                              validateForm: PasswordValidator.validatePassword,
                              hintText: 'Enter Your Password',
                              labelText: AppStrings.passwordLabel,
                            ),
                            SizedBox(
                              height: size.height * 0.08.h,
                            ),
                            DefaultButton(
                              btnLabel: 'Login',
                              isUSingIcon: loginViewModel.isLoading,
                              btnTap: () {
                                if (loginForm.currentState.validate()) {
                                  loginForm.currentState.save();
                                  KeyboardUtil.hideKeyboard(context);
                                  var loginData = UserLogin(
                                      email:
                                          loginViewModel.emailController.text,
                                      password: loginViewModel
                                          .passwordController.text);
                                  loginViewModel.loginUser(loginData, context);
                                }
                              },
                              // text: 'Login',
                            ),
                            SizedBox(
                              height: size.height * 0.05.h,
                            ),
                            SignedupAlternative(
                              altSignedUp: () {},
                            )
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      );
    });
  }
}
