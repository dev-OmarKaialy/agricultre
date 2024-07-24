import 'package:first_app/core/shared/service_locator.dart';
import 'package:first_app/core/shared/toaster.dart';
import 'package:first_app/features/auth/data/models/auth_model.dart';
import 'package:first_app/features/profile/bloc/profile_bloc.dart';
import 'package:first_app/features/profile/data/usecases/update_password.dart';
import 'package:first_app/features/profile/data/usecases/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/shared/request_status.dart';

// ignore: must_be_immutable
class EditprofileViewPage extends StatefulWidget {
  const EditprofileViewPage({
    Key? key,
    required this.user,
  }) : super(key: key);
  final UserModel user;
  @override
  State<EditprofileViewPage> createState() => _EditprofileViewPageState();
}

class _EditprofileViewPageState extends State<EditprofileViewPage> {
  @override
  void initState() {
    emailController.text = widget.user.email ?? '';
    nameController.text = widget.user.name ?? '';
    addressController.text = widget.user.address ?? '';
    phoneController.text = widget.user.phone ?? '';

    super.initState();
  }

  final _formfield = GlobalKey<FormState>();

  final _passField = GlobalKey<FormState>();

  final currentPassController = TextEditingController();

  final newPassController = TextEditingController();

  final emailController = TextEditingController();

  final nameController = TextEditingController();

  final addressController = TextEditingController();

  final phoneController = TextEditingController();

  final obscure = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      bloc: serviceLocator<ProfileBloc>(),
      listener: (context, state) {
        if (state.profileStatus == RequestStatus.loading) {
          Toaster.showLoading();
        } else {
          if (state.profileStatus == RequestStatus.success) {
            currentPassController.clear();
            newPassController.clear();
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
                    Icon(Icons.arrow_back_ios, size: 25, color: Colors.black),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 9,
            ),
            const Center(
              child: Text(
                "تعديل الملف الشخصي",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Color.fromARGB(255, 59, 92, 30),
                    fontFamily: "Pacifico"),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Form(
              key: _formfield,
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 450,
                        child: Material(
                          child: TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.person_outline,
                                  color: Color.fromARGB(255, 107, 165, 56),
                                ),
                                labelText: "تعديل الاسم ",
                                labelStyle: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 194, 192, 192)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 194, 192, 192)),
                                  borderRadius: BorderRadius.circular(15),
                                )),
                            onChanged: (value) {},
                          ),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 450,
                        child: Material(
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.email,
                                  color: Color.fromARGB(255, 107, 165, 56),
                                ),
                                labelText: "تعديل البريد الالكتروني",
                                labelStyle: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 194, 192, 192)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 194, 192, 192)),
                                  borderRadius: BorderRadius.circular(15),
                                )),
                            onChanged: (value) {},
                          ),
                        ),
                      )),

                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 450,
                        child: Material(
                          child: TextFormField(
                            controller: phoneController,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.phone,
                                  color: Color.fromARGB(255, 107, 165, 56),
                                ),
                                labelText: "تعديل رقم الهاتف",
                                labelStyle: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 194, 192, 192)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 194, 192, 192)),
                                  borderRadius: BorderRadius.circular(15),
                                )),
                            onChanged: (value) {},
                          ),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 450,
                        child: Material(
                          child: TextFormField(
                            controller: addressController,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.location_pin,
                                  color: Color.fromARGB(255, 107, 165, 56),
                                ),
                                labelText: "تعديل العنوان",
                                labelStyle: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 194, 192, 192)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 194, 192, 192)),
                                  borderRadius: BorderRadius.circular(15),
                                )),
                            onChanged: (value) {},
                          ),
                        ),
                      )),
                  // SizedBox(
                  //   height: 50,
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formfield.currentState!.validate() &&
                            (addressController.text != widget.user.address ||
                                phoneController.text != widget.user.phone ||
                                nameController.text != widget.user.name ||
                                emailController.text != widget.user.email)) {
                          serviceLocator<ProfileBloc>().add(
                            UpdateProfileEvent(
                              params: UpdateProfileParams(
                                address: addressController.text ==
                                        widget.user.address
                                    ? null
                                    : addressController.text,
                                name: nameController.text == widget.user.name
                                    ? null
                                    : nameController.text,
                                email: emailController.text == widget.user.email
                                    ? null
                                    : emailController.text,
                                phone: phoneController.text == widget.user.phone
                                    ? null
                                    : phoneController.text,
                              ),
                            ),
                          );
                        } else {
                          if ((addressController.text == widget.user.address &&
                              phoneController.text == widget.user.phone &&
                              nameController.text == widget.user.name &&
                              emailController.text == widget.user.email)) {
                            Toaster.showNotification(
                                title: (context) =>
                                    const Text('لم يتم تعديل أي بيانات'));
                          } else {
                            Toaster.showNotification(
                                title: (context) => const Text(
                                    'الرجاء إدخال كافة الحقول المطلوبة'));
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 59, 92, 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30)),
                      child: const Text(
                        "تعديل ",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 10,
              color: Colors.grey,
              thickness: 1,
            ),
            const Center(
              child: Text(
                "تغيير كلمة المرور",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Color.fromARGB(255, 59, 92, 30),
                    fontFamily: "Pacifico"),
              ),
            ),
            Form(
              key: _passField,
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 450,
                        child: Material(
                          child: ValueListenableBuilder(
                              valueListenable: obscure,
                              builder: (context, value, _) {
                                return TextFormField(
                                  controller: currentPassController,
                                  obscureText: value,
                                  decoration: InputDecoration(
                                      suffixIcon: InkWell(
                                        onTap: () {
                                          obscure.value = !value;
                                        },
                                        child: Icon(value
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                      ),
                                      prefixIcon: const Icon(
                                        Icons.lock,
                                        color:
                                            Color.fromARGB(255, 107, 165, 56),
                                      ),
                                      labelText: "كلمة المرور الحالية",
                                      labelStyle: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 1,
                                            color: Color.fromARGB(
                                                255, 194, 192, 192)),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 1,
                                            color: Color.fromARGB(
                                                255, 194, 192, 192)),
                                        borderRadius: BorderRadius.circular(15),
                                      )),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "ادخل كلمة السر الحالية";
                                    } else if (currentPassController
                                            .text.length <
                                        6) {
                                      return "ادخل كلمة السر الحالية الصحيحة";
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {},
                                );
                              }),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 450,
                        child: Material(
                          child: ValueListenableBuilder(
                              valueListenable: obscure,
                              builder: (context, value, _) {
                                return TextFormField(
                                  controller: newPassController,
                                  obscureText: value,
                                  decoration: InputDecoration(
                                      suffixIcon: InkWell(
                                        onTap: () {
                                          obscure.value = !value;
                                        },
                                        child: Icon(value
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                      ),
                                      prefixIcon: const Icon(
                                        Icons.lock,
                                        color:
                                            Color.fromARGB(255, 107, 165, 56),
                                      ),
                                      labelText: "كلمة المرور الجديدة",
                                      labelStyle: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 1,
                                            color: Color.fromARGB(
                                                255, 194, 192, 192)),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 1,
                                            color: Color.fromARGB(
                                                255, 194, 192, 192)),
                                        borderRadius: BorderRadius.circular(15),
                                      )),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "ادخل كلمة السر الجديدة";
                                    } else if (newPassController.text.length <
                                        6) {
                                      return "ادخل كلمة السر الجديدة مقبولة";
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {},
                                );
                              }),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_passField.currentState!.validate()) {
                          serviceLocator<ProfileBloc>().add(UpdatePasswordEvent(
                              params: UpdatePasswordParams(
                                  currentPassword: currentPassController.text,
                                  newPassword: newPassController.text)));
                        } else {
                          Toaster.showNotification(
                              title: (context) => const Text(
                                  'الرجاء إدخال كافة الحقول المطلوبة'));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 59, 92, 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30)),
                      child: const Text(
                        "تاكيد",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
