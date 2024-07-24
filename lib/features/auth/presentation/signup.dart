import 'dart:io';

import 'package:first_app/core/shared/service_locator.dart';
import 'package:first_app/features/auth/bloc/auth_bloc.dart';
import 'package:first_app/features/auth/data/usecases/signup_usecase.dart';
import 'package:first_app/features/showPlant/view/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/shared/request_status.dart';
import '../../../core/shared/toaster.dart';

// ignore: must_be_immutable
class SignuPageView extends StatefulWidget {
  const SignuPageView({super.key});

  @override
  State<SignuPageView> createState() => _SignuPageViewState();
}

class _SignuPageViewState extends State<SignuPageView> {
  final _formfield = GlobalKey<FormState>();

  final emailcontroller = TextEditingController();

  final namecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final addresscontroller = TextEditingController();
  final passcontroller = TextEditingController();

  ValueNotifier<File?> image = ValueNotifier(null);
  final obscureText = ValueNotifier(true);
  final isEngineer = ValueNotifier(false);
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
          appBar: AppBar(
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child:
                      Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
                ),
              ),
            ),
          ),
          body: ValueListenableBuilder(
              valueListenable: isEngineer,
              builder: (context, value, _) {
                return SingleChildScrollView(
                  child: Form(
                    key: _formfield,
                    child: Column(children: [
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          " حساب جديد",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Color.fromARGB(255, 33, 110, 38),
                              fontFamily: "Pacifico"),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                        height: 30,
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                          child: Text(
                            "انشا حساب جديد",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.grey[600]),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 450,
                          child: TextFormField(
                            controller: namecontroller,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.person_outline,
                                  color: Color.fromARGB(255, 107, 165, 56),
                                ),
                                labelText: "الاسم الكامل",
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
                            onChanged: (value) {},
                            validator: (value) {
                              // for number
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                return "الاسم الاول";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 450,
                          child: TextFormField(
                            controller: emailcontroller,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.email,
                                  color: Color.fromARGB(255, 107, 165, 56),
                                ),
                                labelText: "البريد الالكتروني",
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
                            onChanged: (value) {},
                            validator: (value) {
                              bool emailvalue = RegExp(
                                      r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value!);
                              if (value.isEmpty) {
                                return "البريد الالكتروني";
                              } else if (!emailvalue) {
                                return "ادخل البريد الالكتروني الصحيح ";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 450,
                            child: ValueListenableBuilder(
                                valueListenable: obscureText,
                                builder: (context, value, _) {
                                  return TextFormField(
                                    controller: passcontroller,
                                    obscureText: value,
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.lock,
                                          color:
                                              Color.fromARGB(255, 107, 165, 56),
                                        ),
                                        suffixIcon: InkWell(
                                          onTap: () {
                                            obscureText.value = !value;
                                          },
                                          child: Icon(value
                                              ? Icons.visibility
                                              : Icons.visibility_off),
                                        ),
                                        labelText: "ادخل كلمة السر",
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 3,
                                              color: Color.fromARGB(
                                                  255, 59, 92, 30)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 3,
                                              color: Color.fromARGB(
                                                  255, 59, 92, 30)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "ادخل كلمة السر";
                                      } else if (passcontroller.text.length <
                                          6) {
                                        return "PasswordLengthShouldBeMoreThan6Charachters"
                                            .tr;
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {},
                                  );
                                }),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 450,
                          child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.cast_for_education,
                                  color: Color.fromARGB(255, 107, 165, 56),
                                ),
                                labelText: "التعليم/الشهادة العلمية",
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
                            onChanged: (value) {},
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                return "ادخل التعليم بطريقة صحيحة";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 450,
                          child: TextFormField(
                            controller: phonecontroller,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.location_city,
                                  color: Color.fromARGB(255, 107, 165, 56),
                                ),
                                labelText: "رقم الموبايل ",
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
                            onChanged: (value) {},
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              if (!RegExp(r'^(\+|00)?[0-9]+$')
                                  .hasMatch(value)) {
                                return 'Please enter a valid phone number';
                              }

                              return null; // Return null when the input is valid
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 450,
                          child: TextFormField(
                            controller: addresscontroller,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.location_city,
                                  color: Color.fromARGB(255, 107, 165, 56),
                                ),
                                labelText: "الموقع/العنوان",
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
                            onChanged: (value) {},
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                return "ادخل العنوان الصحيح";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            'هل أنت مهندس مختص؟',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Checkbox.adaptive(
                              value: value,
                              activeColor:
                                  const Color.fromARGB(255, 107, 165, 56),
                              onChanged: (value) {
                                isEngineer.value = value!;
                                if (!value) {
                                  image.value = null;
                                }
                              }),
                        ],
                      ),
                      AnimatedCrossFade(
                        duration: Durations.extralong1,
                        crossFadeState: value
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        firstChild: Center(
                            child: Column(
                          children: [
                            const SizedBox(width: 170),
                            Material(child: Imageprofile()),
                          ],
                        )),
                        secondChild: const SizedBox(),
                      ),
                      AnimatedCrossFade(
                        duration: Durations.extralong1,
                        crossFadeState: value
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        firstChild: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                  onPressed: () {
                                    Center(
                                        child: Column(
                                      children: [
                                        const SizedBox(width: 170),
                                        Material(child: Imageprofile()),
                                      ],
                                    ));
                                  },
                                  child: Text(
                                    "اضف صورة الشهادة الجامعية ان وجدت",
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.bold),
                                  ))),
                        ),
                        secondChild: const SizedBox(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formfield.currentState!.validate()) {
                              serviceLocator<AuthBloc>().add(SignUpEvent(
                                  params: SignUpParams(
                                email: emailcontroller.text,
                                name: namecontroller.text,
                                phone: phonecontroller.text,
                                password: passcontroller.text,
                                address: addresscontroller.text,
                                image: image.value,
                              )));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 59, 92, 30),
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
                );
              })),
    );
  }

  Widget Imageprofile() {
    return Center(
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 450,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                      width: 3, color: const Color.fromARGB(255, 59, 92, 30))),
              child: ValueListenableBuilder(
                  valueListenable: image,
                  builder: (context, value, _) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: value == null
                          ? Image.asset(
                              'assets/images/3.png',
                              width: 200,
                              height: 200,
                              fit: BoxFit.fill,
                            )
                          : Image.file(
                              value,
                              width: 200,
                              height: 200,
                              fit: BoxFit.fill,
                            ),
                    );
                  }),
            ),
          ),
          Positioned(
              bottom: 20.0,
              right: 20.0,
              child: InkWell(
                onTap: () async {
                  showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      builder: (context) {
                        return ImageButtomSheet(image: image);
                      });
                },
                child: const Icon(
                  Icons.camera_alt,
                  color: Color.fromARGB(255, 66, 66, 66),
                  size: 28.0,
                ),
              ))
        ],
      ),
    );
  }
}

class ImageButtomSheet extends StatelessWidget {
  const ImageButtomSheet({
    super.key,
    required this.image,
  });

  final ValueNotifier<File?> image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      width: 500,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Center(
            child: Text(
              " اختر الصورة",
              style: TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  FloatingActionButton(
                    backgroundColor: const Color.fromARGB(255, 59, 92, 30),
                    foregroundColor: Colors.white,
                    mini: true,
                    onPressed: () async {
                      Navigator.pop(context);
                      final result = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (result != null) {
                        image.value = File(result.path);
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.image),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(" المعرض"),
                  ),
                ],
              )
            ],
          ),
          // OutlinedButton(
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   child: const Text('Close'),
          // ),
        ],
      ),
    );
  }
}
