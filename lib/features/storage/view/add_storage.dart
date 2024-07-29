import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';

import '../../../core/shared/service_locator.dart';
import '../../settings/bloc/settings_bloc.dart';

// ignore: must_be_immutable
class SettingStorage extends StatefulWidget {
  const SettingStorage({super.key});

  @override
  State<SettingStorage> createState() => _SettingStorageState();
}

class _SettingStorageState extends State<SettingStorage> {
  @override
  void initState() {
    serviceLocator<SettingsBloc>().add(IndexStorageEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showAdaptiveDialog(
                context: context,
                builder: (c) {
                  return (Align(
                    alignment: Alignment.center,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        width: 400,
                        height: 300,
                        child: AddAgriculure()),
                  ));
                });
          },
        ),
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
                      "تعديل طرق التخزين ",
                      style: TextStyle(
                          color: Color.fromARGB(255, 59, 92, 30),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: "Pacifico"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 400,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'بحث',
                            labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 59, 92, 30),
                                fontWeight: FontWeight.bold),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromARGB(255, 189, 188, 188)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromARGB(255, 59, 92, 30),
                                ),
                                borderRadius: BorderRadius.circular(13)),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 107, 165, 56),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 59, 92, 30),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<SettingsBloc, SettingsState>(
                    bloc: serviceLocator<SettingsBloc>(),
                    builder: (context, state) {
                      return Wrap(
                        children: state.storages
                            .map((e) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 230,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 250, 249, 249),
                                      border: Border.all(
                                          width: 1.2,
                                          //  color: Color.fromARGB(255, 107, 165, 56),
                                          color: const Color.fromARGB(
                                              255, 213, 243, 215)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(children: [
                                      Container(
                                        // width: 180,
                                        // height: 200,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 40, 8, 8),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Material(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(6),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                            context)
                                                        .width,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color
                                                                .fromARGB(255,
                                                                194, 192, 192)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: GFAccordion(
                                                      title: e.name!,
                                                      textStyle:
                                                          const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 18,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      59,
                                                                      92,
                                                                      30),
                                                              decoration:
                                                                  TextDecoration
                                                                      .none),
                                                      contentChild: const Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8.0),
                                                              child: Row(
                                                                children: [
                                                                  Expanded(
                                                                      child:
                                                                          Text(
                                                                    "",
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    maxLines: 6,
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black87,
                                                                        decoration:
                                                                            TextDecoration
                                                                                .none,
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  )),
                                                                ],
                                                                //  children: controller.AllCare.map,
                                                              ),
                                                            ),
                                                          ]),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              // Text(
                                              //   e.name!,
                                              //   textAlign: TextAlign.center,
                                              //   style: TextStyle(
                                              //       color: Colors.white,
                                              //       // Color.fromARGB(255, 59, 92, 30),
                                              //       fontWeight: FontWeight.bold,
                                              //       fontSize: 20),
                                              // ),
                                              IconButton(
                                                  onPressed: () {
                                                    showAdaptiveDialog(
                                                        context: context,
                                                        builder: (c) {
                                                          return (Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Container(
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20)),
                                                                // width: 400,
                                                                child: delete(
                                                                    e.id!)),
                                                          ));
                                                        });
                                                  },
                                                  icon: const Icon(
                                                    Icons.delete,
                                                    shadows: [
                                                      Shadow(
                                                          color: Colors.black)
                                                    ],
                                                    size: 40,
                                                    color: Color.fromARGB(
                                                        255, 117, 134, 19),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ))
                            .toList(),
                      );
                    },
                  ),
                ],
              ),
            )));
  }

  Widget AddAgriculure() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "اضافة طريقة جديدة",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Color.fromARGB(255, 59, 92, 30),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: "Pacifico"),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 450,
                child: Material(
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "اسم الطريقة الجديدة",
                        labelStyle: const TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 194, 192, 192)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 194, 192, 192)),
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
                        labelText: "معلومات عن طريقة التخزين",
                        labelStyle: const TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 194, 192, 192)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 194, 192, 192)),
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
                    "تمت اضافة طريقة  ",
                    icon: const Icon(Icons.person, color: Colors.white),
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: const Color.fromARGB(255, 59, 92, 30),
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
                    "هذه الطريقة موجودة مسبقا",
                    icon: const Icon(Icons.person, color: Colors.white),
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: const Color.fromARGB(255, 59, 92, 30),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30)),
              child: const Text(
                "اضافة ",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget delete(String id) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "هل انت متاكد من الحذف ؟",
          textAlign: TextAlign.center,
          style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              // Color.fromARGB(255, 59, 92, 30),
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        const SizedBox(
          height: 0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  serviceLocator<SettingsBloc>()
                      .add(DeleteStorageEvent(id: id));
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 59, 92, 30),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30)),
                child: const Text(
                  "نعم ",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 59, 92, 30),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30)),
                child: const Text(
                  "لا  ",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class kindIllussion {
  String? url;
  String? name;
  String? descrption;
  kindIllussion(String u, String n, String d) {
    url = u;
    name = n;
    descrption = d;
  }
}
