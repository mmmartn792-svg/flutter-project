import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projectq/auth/login_screen.dart';
import 'package:projectq/cubit/user_cubit.dart';
import 'package:projectq/generated/l10n.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState> formsignup = GlobalKey();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController firstName = TextEditingController();
  TextEditingController secondName = TextEditingController();

  TextEditingController dateController = TextEditingController();

  DateTime? _selectedDate;

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstName.dispose();
    secondName.dispose();
    dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        dateController.text =
            "${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}";
        context.read<UserCubit>().setDateController(dateController.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is signupSucces) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => LoginScreen()));
        } else if (state is signupFailuer) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(S.of(context).createAccount)),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: formsignup,
              child: ListView(
                children: [
                  TextFormField(
                    controller: firstName,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: S.of(context).name1,
                      prefixIcon: Icon(Icons.person),

                      border: OutlineInputBorder(),
                    ),
                    validator: (textValue) {
                      if (textValue == null || textValue.isEmpty) {
                        return S.of(context).validateFirstName;
                      }
                      return null;
                    },
                    onChanged: (value) =>
                        context.read<UserCubit>().setFirstName(value),
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    controller: secondName,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: S.of(context).name2,
                      prefixIcon: Icon(Icons.person),

                      border: OutlineInputBorder(),
                    ),
                    validator: (textValue) {
                      if (textValue == null || textValue.isEmpty) {
                        return S.of(context).validateSecondName;
                      }
                      return null;
                    },
                    onChanged: (value) =>
                        context.read<UserCubit>().setSecondName(value),
                  ),

                  SizedBox(height: 12),
                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: S.of(context).PhoneNumber,
                      prefixIcon: Icon(Icons.phone_android),
                      prefixText: "+963 ",
                      border: OutlineInputBorder(),
                    ),
                    validator: (textValue) {
                      if (textValue == null || textValue.isEmpty) {
                        return S.of(context).validatephone;
                      }
                      return null;
                    },
                    onChanged: (value) =>
                        context.read<UserCubit>().setPhoneController(value),
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    controller: passwordController,
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
                    onChanged: (value) =>
                        context.read<UserCubit>().setPasswordController(value),
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: S.of(context).confirmpassword,
                      prefixIcon: Icon(Icons.lock_outline),
                      border: OutlineInputBorder(),
                    ),
                    validator: (textValue) {
                      if (textValue == null || textValue.isEmpty) {
                        return S.of(context).Validateconfirmpass;
                      }
                      return null;
                    },
                    onChanged: (value) => context
                        .read<UserCubit>()
                        .setConfirmPasswordController(value),
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    controller: dateController,
                    decoration: InputDecoration(
                      labelText: S.of(context).date,
                      prefixIcon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(),
                    ),
                    readOnly: true,

                    onTap: () {
                      _selectDate(context);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).validateDAte;
                      }
                      return null;
                    },
                    onChanged: (value) =>
                        context.read<UserCubit>().setDateController(value),
                  ),
                  SizedBox(height: 15),
                  DropdownButtonFormField<String>(
                    hint: Text(S.of(context).renterOrOwner),

                    items: [
                      DropdownMenuItem<String>(
                        value: 'renter', // القيمة الفعلية التي سيتم حفظها
                        child: Text(
                          S.of(context).renter,
                        ), // النص الذي سيظهر للمستخدم
                      ),
                      DropdownMenuItem<String>(
                        value: 'owner',
                        child: Text(S.of(context).owner),
                      ),
                    ],
                    onChanged: (String? value) {
                      if (value != null) {
                        context.read<UserCubit>().setRole(value);
                      }
                    },
                    validator: (val) {
                      if (val == null) {
                        return S.of(context).validateRole;
                      }
                    },
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () async {
                      ImagePicker()
                          .pickImage(source: ImageSource.camera)
                          .then(
                            (onValue) => context
                                .read<UserCubit>()
                                .uplodpersonalfile(onValue!),
                          );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Colors.green,
                    ),
                    child: Text(
                      S.of(context).enterYourImage,

                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () async {
                      ImagePicker()
                          .pickImage(source: ImageSource.camera)
                          .then(
                            (onValue) =>
                                context.read<UserCubit>().uplodIdfile(onValue!),
                          );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Colors.green,
                    ),
                    child: Text(
                      S.of(context).imagId,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: 15),
                  state is signupLoading
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            if (context.read<UserCubit>().fileP == null ||
                                context.read<UserCubit>().fileId == null) {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.info,
                                animType: AnimType.rightSlide,
                                title: S.of(context).error,
                                desc: S.of(context).dec,

                                btnOkOnPress: () {},
                              ).show();
                            }
                            if (context.read<UserCubit>().fileP != null &&
                                context.read<UserCubit>().fileId != null) {
                              if (formsignup.currentState!.validate()) {
                                context.read<UserCubit>().signUp();
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 50),
                            backgroundColor: Colors.green,
                          ),
                          child: Text(
                            S.of(context).createAccount,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                  SizedBox(height: 12),

                  // 4. أداة القائمة المنسدلة لاختيار الدور
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
