import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectq/cache/cache_helper.dart';
import 'package:projectq/core/api/end_ponits.dart';

import 'package:projectq/cubit/user_cubit.dart';
import 'package:projectq/generated/l10n.dart' show S;
import 'package:projectq/screen/home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formlogin = GlobalKey();
  TextEditingController phoneControllerlogin = TextEditingController();
  TextEditingController passwordControllerlogin = TextEditingController();
  @override
  void dispose() {
    phoneControllerlogin.dispose();
    passwordControllerlogin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) =>
                  Home(role: CacheHelper().getData(key: ApiKey.role)),
            ),
            (Route<dynamic> route) => false,
          );
        } else if (state is SignInFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: formlogin,
              child: ListView(
                children: [
                  SizedBox(height: 40),
                  Text(
                    S
                        .of(context)
                        .titleLogin, //////////////////////////'تسجيل الدخول
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),

                  Text(
                    S
                        .of(context)
                        .title2login, /////////////////////////'قم بإدخال رقم الهاتف الخاص بحسابك
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),

                  SizedBox(height: 24),
                  TextFormField(
                    controller: phoneControllerlogin,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: S.of(context).PhoneNumber,
                      prefixIcon: Icon(Icons.phone_android),
                      prefixText: '+963 ',
                      border: OutlineInputBorder(),
                    ),
                    validator: (textValue) {
                      if (textValue == null || textValue.isEmpty) {
                        return S.of(context).validate1;
                      }
                      return null;
                    },
                    onChanged: (value) => context
                        .read<UserCubit>()
                        .setPhoneControllerlogin(value),
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        S.of(context).forgetPassword, //'نسيت كلمة المرور؟'
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: passwordControllerlogin,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: S.of(context).password,
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                    validator: (textValue) {
                      if (textValue == null || textValue.isEmpty) {
                        return S.of(context).validate2;
                      }
                      return null;
                    },
                    onChanged: (value) => context
                        .read<UserCubit>()
                        .setPasswordControllerlogin(value),
                  ),
                  SizedBox(height: 24),
                  state is SignInLoading
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            if (formlogin.currentState!.validate()) {
                              context.read<UserCubit>().signIn();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 50),
                            backgroundColor: Colors.green,
                          ),
                          child: Text(
                            S.of(context).titleLogin,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                  SizedBox(height: 16),
                  Center(
                    child: Text(S.of(context).newAccountget),
                  ), //'أو المتابعة عبر'
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Colors.white,
                    ),
                    child: Text(
                      S.of(context).newAccount,
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
