import 'package:first_app/features/auth/data/usecases/login_usecase.dart';
import 'package:first_app/features/auth/presentation/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/shared/request_status.dart';
import '../../../core/shared/service_locator.dart';
import '../../../core/shared/toaster.dart';
import '../../showPlant/view/menu.dart';
import '../bloc/auth_bloc.dart';

//import 'package:getwidget/getwidget.dart';

// ignore: must_be_immutable
class SignInViewPage extends StatefulWidget {
  const SignInViewPage({super.key});

  @override
  State<SignInViewPage> createState() => _SignInViewPageState();
}

class _SignInViewPageState extends State<SignInViewPage> {
  final _formfield = GlobalKey<FormState>();

  final emailcontroller = TextEditingController();

  final passcontroller = TextEditingController();

  final obscure = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      bloc: serviceLocator<AuthBloc>(),
      listener: (context, state) {
        if (state.status == RequestStatus.loading) {
          Toaster.showLoading();
        } else {
          if (state.status == RequestStatus.success) {
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) => const MenuPageView()),
                (route) {
              return false;
            });
          }
          Toaster.closeLoading();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _formfield,
            child: Column(children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back_ios,
                        size: 20, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Center(
                child: Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color.fromARGB(255, 59, 92, 30),
                      fontFamily: "Pacifico"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: 400,
                    height: 260,
                    child: Image.asset('assets/images/32.png')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 450,
                  child: Material(
                    child: TextFormField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Color.fromARGB(255, 107, 165, 56),
                          ),
                          labelText: "ادخل بريدك الالكتروني",
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                //Color.fromARGB(255, 107, 165, 56)
                                color: Color.fromARGB(255, 59, 92, 30)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 59, 92, 30)),
                            borderRadius: BorderRadius.circular(15),
                          )),
                      validator: (value) {
                        bool emailvalue = RegExp(
                                r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!);
                        if (value.isEmpty) {
                          return "ادخل بريدك الالكتروني";
                        } else if (!emailvalue) {
                          return "  ادخل بريدك الالكتروني الصحيح";
                        }
                        return null;
                      },
                      onChanged: (Value) {},
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 450,
                  child: ValueListenableBuilder(
                      valueListenable: obscure,
                      builder: (context, value, _) {
                        return TextFormField(
                          controller: passcontroller,
                          obscureText: value,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Color.fromARGB(255, 107, 165, 56),
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  obscure.value = !value;
                                },
                                child: Icon(value
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                              labelText: "ادخل كلمة السر",
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3,
                                    color: Color.fromARGB(255, 59, 92, 30)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3,
                                    color: Color.fromARGB(255, 59, 92, 30)),
                                borderRadius: BorderRadius.circular(15),
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "ادخل كلمة السر";
                            }
                            // } else if (passcontroller.text.length < 6) {
                            //   return "PasswordLengthShouldBeMoreThan6Charachters".tr;
                            // }
                            return null;
                          },
                          onChanged: (value) {},
                        );
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ResetPasswordViewPage()));
                        },
                        child: Text(
                          "هل نسيت كلمة السر ؟",
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.bold),
                        ))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formfield.currentState!.validate()) {
                      serviceLocator<AuthBloc>().add(LoginEvent(
                          params: LoginParams(
                              email: emailcontroller.text,
                              password: passcontroller.text)));
                    } else {
                      Get.snackbar(
                        "خطا",
                        "تحقق من الحقول",
                        icon: const Icon(Icons.person, color: Colors.white),
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: const Color.fromARGB(255, 45, 172, 50),
                        borderRadius: 20,
                        margin: const EdgeInsets.all(15),
                        colorText: Colors.white,
                        duration: const Duration(seconds: 4),
                        isDismissible: true,
                        forwardAnimationCurve: Curves.easeOutBack,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 59, 92, 30),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 50)),
                  child: const Text(
                    "تاكيد",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
