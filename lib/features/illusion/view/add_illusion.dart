import 'dart:io';

import 'package:first_app/core/extensions/string_extensions.dart';
import 'package:first_app/core/shared/service_locator.dart';
import 'package:first_app/core/shared/toaster.dart';
import 'package:first_app/features/settings/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class AddIllusionPageView extends StatefulWidget {
  const AddIllusionPageView({super.key});

  @override
  State<AddIllusionPageView> createState() => _AddIllusionPageViewState();
}

class _AddIllusionPageViewState extends State<AddIllusionPageView> {
  ValueNotifier<File?> image = ValueNotifier(null);
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
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
                    Center(
                        child: Column(
                      children: [
                        const SizedBox(width: 170),
                        Material(child: Imageprofile(image)),
                      ],
                    )),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 450,
                          child: Material(
                            child: TextFormField(
                              controller: nameController,
                              validator: (value) => value.isEmptyOrNull
                                  ? 'Enter Valid Name'
                                  : null,
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
                              validator: (value) => value.isEmptyOrNull
                                  ? 'Enter Valid Name'
                                  : null,
                              controller: descriptionController,
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
                          if (formKey.currentState!.validate() &&
                              image.value != null) {
                            serviceLocator<SettingsBloc>().add(
                                CreateIllusionEvent(
                                    name: nameController.text,
                                    descriptino: descriptionController.text,
                                    photo: image.value!.path));
                          } else {
                            if (image.value == null) {
                              Toaster.showToast('Please Select Image First');
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
                          "اضافة ",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }

  Widget Imageprofile(ValueNotifier<File?> image) {
    return Center(
      child: Stack(
        children: <Widget>[
          ValueListenableBuilder(
              valueListenable: image,
              builder: (context, value, _) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 450,
                    height: 450,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            width: 3,
                            color: const Color.fromARGB(255, 59, 92, 30))),
                    child: value == null
                        ? Image.asset('assets/images/3.png', fit: BoxFit.cover)
                        : Image.file(value, fit: BoxFit.cover),
                  ),
                );
              }),
          Positioned(
              bottom: 20.0,
              right: 20.0,
              child: InkWell(
                onTap: () async {
                  ImagePicker()
                      .pickImage(source: ImageSource.gallery)
                      .then((value) async {
                    if (value != null) {
                      image.value = File(value.path);
                    }
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
