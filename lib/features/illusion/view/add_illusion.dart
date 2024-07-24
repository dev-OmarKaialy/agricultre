import 'dart:typed_data';

import 'package:first_app/core/shared/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AddIllusionPageView extends StatelessWidget {
  Uint8List? image;

  AddIllusionPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(Icons.arrow_back_ios,
                                  size: 20, color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Center(
                    child: Text(
                      "اضافة افة جديدة",
                      style: TextStyle(
                          color: Color.fromARGB(255, 59, 92, 30),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: "Pacifico"),
                    ),
                  ),
                  const Center(
                      child: Column(
                    children: [
                      SizedBox(width: 170),
                      // Material(child: Imageprofile(controller)),
                    ],
                  )),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 450,
                        child: Material(
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: "اسم الافة الجديدة",
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
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                                labelText: "معلومات عن الافة",
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
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (2 != 1) {
                          //تحقق اسم الافة غير موجود مسبقا
                          Get.snackbar(
                            "جيد",
                            "تمت اضافة الافة الجديدة بنجاح",
                            icon: const Icon(Icons.person, color: Colors.white),
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor:
                                const Color.fromARGB(255, 59, 92, 30),
                            borderRadius: 20,
                            margin: const EdgeInsets.all(15),
                            colorText: Colors.white,
                            duration: const Duration(seconds: 4),
                            isDismissible: true,
                            forwardAnimationCurve: Curves.easeOutBack,
                          );
                        } else {
                          Get.snackbar(
                            "خطا",
                            "هذه الافة موجودة مسبقا",
                            icon: const Icon(Icons.person, color: Colors.white),
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor:
                                const Color.fromARGB(255, 59, 92, 30),
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
                          backgroundColor:
                              const Color.fromARGB(255, 59, 92, 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30)),
                      child: const Text(
                        "اضافة ",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }

  Widget Imageprofile() {
    return Center(
      child: Stack(
        children: <Widget>[
          Obx(() => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 450,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          width: 3,
                          color: const Color.fromARGB(255, 59, 92, 30))),
                  child: false
                      ? Utility.imageFromBase64String('', 200, 200)
                      : image == null
                          ? Image.asset(
                              'assets/images/3.png',
                              width: 200,
                              height: 200,
                              fit: BoxFit.fill,
                            )
                          : Utility.imageFromBase64String(
                              Utility.base64String(image!), 200, 200),
                ),
              )),
          Positioned(
              bottom: 20.0,
              right: 20.0,
              child: InkWell(
                onTap: () async {},
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
