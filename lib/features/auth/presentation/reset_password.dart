import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import 'package:getwidget/getwidget.dart';

class ResetPasswordViewPage extends StatefulWidget {
  const ResetPasswordViewPage({super.key});

  @override
  State<ResetPasswordViewPage> createState() => _ResetPasswordViewPageState();
}

class _ResetPasswordViewPageState extends State<ResetPasswordViewPage> {
  final _formfield = GlobalKey<FormState>();

  final passcontroller = TextEditingController();

  final confirmpasscontroller = TextEditingController();

  final emailcontroller = TextEditingController();

  final obscure = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formfield,
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back_ios,
                        size: 20, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Center(
                child: Text(
                  "تعيين كلمة السر",
                  style: TextStyle(
                      color: Color.fromARGB(255, 33, 110, 38),
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: "Pacifico"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: 350,
                    height: 200,
                    child: Image.asset('assets/images/22.png')),
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
                        labelText: "ادخل بريدك الالكتروني",
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: Color.fromARGB(255, 59, 92, 30)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: Color.fromARGB(255, 59, 92, 30)),
                          borderRadius: BorderRadius.circular(15),
                        )),
                    onChanged: (value) {},
                    validator: (value) {
                      bool emailvalue = RegExp(
                              r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!);
                      if (value.isEmpty) {
                        return "ادخل بريدك الالكتروني";
                      } else if (!emailvalue) {
                        return "ادخل بريدك الالكتروني الصحيح";
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
                              labelText: "ادخل كلمة السر الجديدة",
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
                              return "ادخل كلمة السر الجديدة";
                            } else if (passcontroller.text.length < 6) {
                              return "ادخل كلمة السر الجديدة الصحيحة";
                            }
                            return null;
                          },
                          onChanged: (value) {},
                        );
                      }),
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
                          controller: confirmpasscontroller,
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
                              labelText: "تاكيد كلمة السر",
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
                              return "تاكيد كلمة السر";
                            } else if (confirmpasscontroller.text.length < 6) {
                              return "تاكد من كلمة السر";
                            }
                            return null;
                          },
                          onChanged: (value) {},
                        );
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (confirmpasscontroller.text == passcontroller.text) {
                      if (_formfield.currentState!.validate()) {
                        Get.snackbar(
                          "جيد",
                          "كلمة صحيحة",
                          icon: const Icon(Icons.person, color: Colors.white),
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor:
                              const Color.fromARGB(255, 45, 172, 50),
                          borderRadius: 20,
                          margin: const EdgeInsets.all(15),
                          colorText: Colors.white,
                          duration: const Duration(seconds: 4),
                          isDismissible: true,
                          forwardAnimationCurve: Curves.easeOutBack,
                        );
                      }
                    } else {
                      Get.snackbar(
                        "خطا",
                        "تحقق من كلمة السر",
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
            ],
          ),
        ),
      ),
    );
  }

  Future diolg(String txt) {
    return Get.dialog(Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 240, 230, 230),
          border: Border.all(
              color: const Color.fromARGB(255, 33, 110, 38), width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        width: 200,
        height: 120,
        child: Row(
          children: [
            Center(
              child: Text(txt,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black54,
                      decoration: TextDecoration.none)),
            ),
          ],
        ),
      ),
    ));
  }
}
