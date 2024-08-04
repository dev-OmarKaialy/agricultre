import 'dart:io';
import 'dart:typed_data';

import 'package:first_app/core/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class AddPlantPageView extends StatefulWidget {
  const AddPlantPageView({super.key});

  @override
  State<AddPlantPageView> createState() => _AddPlantPageViewState();
}

class _AddPlantPageViewState extends State<AddPlantPageView> {
  final ValueNotifier<File?> imageFile = ValueNotifier(null);
  final nameController = TextEditingController();
  final detailsController = TextEditingController();
  final nutritionController = TextEditingController();
  final timeController = TextEditingController();
  final waterController = TextEditingController();
  Uint8List? image;

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
                      "اضافة نبتة جديدة",
                      style: TextStyle(
                          color: Color.fromARGB(255, 59, 92, 30),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: "Pacifico"),
                    ),
                  ),
                  Center(
                      child: Column(
                    children: [
                      const SizedBox(width: 170),
                      Material(child: Imageprofile(context, imageFile)),
                    ],
                  )),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 450,
                        child: Material(
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: "اسم النبتة الجديدة",
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
                                labelText: "معلومات عن النبتة",
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
                                labelText: "القيمة الغذائية",
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
                                labelText: "فترة الحصاد",
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
                                labelText: " الري",
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
                  Material(
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 194, 192, 192)),
                            borderRadius: BorderRadius.circular(10)),
                        child: const GFAccordion(
                          title: "  الافات الزراعية",
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color.fromARGB(255, 59, 92, 30),
                              decoration: TextDecoration.none),
                          contentChild: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                      //  children: controller.AllCare.map,
                                      ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 194, 192, 192)),
                            borderRadius: BorderRadius.circular(10)),
                        child: const GFAccordion(
                          title: "نوع المحصول",
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color.fromARGB(255, 59, 92, 30),
                              decoration: TextDecoration.none),
                          contentChild: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                      //  children: controller.AllCare.map,
                                      ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 194, 192, 192)),
                            borderRadius: BorderRadius.circular(10)),
                        child: const GFAccordion(
                          title: "طرق التخزين",
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color.fromARGB(255, 59, 92, 30),
                              decoration: TextDecoration.none),
                          contentChild: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                      //  children: controller.AllCare.map,
                                      ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 194, 192, 192)),
                            borderRadius: BorderRadius.circular(10)),
                        child: const GFAccordion(
                          title: "طرق العناية",
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color.fromARGB(255, 59, 92, 30),
                              decoration: TextDecoration.none),
                          contentChild: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                      //  children: controller.AllCare.map,
                                      ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
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

  Widget Imageprofile(context, ValueNotifier<File?> image) {
    return ValueListenableBuilder(
        valueListenable: image,
        builder: (context, value, _) {
          return Center(
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 450,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            width: 1,
                            color: const Color.fromARGB(255, 59, 92, 30))),
                    child: value == null
                        ? Image.asset(
                            'assets/images/1a.png',
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
                  ),
                ),
                Positioned(
                    bottom: 20.0,
                    right: 20.0,
                    child: InkWell(
                      onTap: () async {
                        openBottomSheet(context, image);
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
        });
  }
}

void openBottomSheet(context, ValueNotifier<File?> image) {
  showModalBottomSheet(
    context: context,
    builder: (context) => Container(
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
                    onPressed: () {},
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
          ).onTap(() async {
            ImagePicker().pickImage(source: ImageSource.gallery).then((v) {
              if (v != null) {
                image.value = File(v.path);
                Navigator.pop(context);
              }
            });
          }),
          // OutlinedButton(
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   child: const Text('Close'),
          // ),
        ],
      ),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
