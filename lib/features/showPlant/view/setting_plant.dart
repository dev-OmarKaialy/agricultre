import 'package:first_app/features/showPlant/view/add_plant.dart';
import 'package:first_app/features/showPlant/view/update_plant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/showplantcontroller.dart';

// ignore: must_be_immutable
class SettingPlantPageView extends GetResponsiveView<ShowPlantController> {
  @override
  ShowPlantController controller = Get.put(ShowPlantController());

  SettingPlantPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Get.to(AddPlantPageView());
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
                      "تعديل النباتات الزراعية ",
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
                  Wrap(
                    children: controller.FlowersList.map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              // controller.element = e;
                              // Get.to(ShowDetailIllussionPageView());
                            },
                            child: Container(
                              width: 230,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 250, 249, 249),
                                border: Border.all(
                                    width: 1.2,
                                    //  color: Color.fromARGB(255, 107, 165, 56),
                                    color: const Color.fromARGB(
                                        255, 213, 243, 215)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(children: [
                                Container(
                                  width: 200,
                                  height: 180,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          width: 2,
                                          color: const Color.fromARGB(
                                              255, 199, 198, 198)),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            e.url!,
                                          ),
                                          colorFilter: ColorFilter.mode(
                                              Colors.grey.withOpacity(0.8),
                                              BlendMode.modulate))),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 40, 8, 8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          e.name!,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              // Color.fromARGB(255, 59, 92, 30),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  controller.updatePlant = e;
                                                  print(e.agricultureTime);
                                                  Get.to(UpdatePlantPageView());
                                                },
                                                icon: const Icon(Icons.edit,
                                                    shadows: [
                                                      Shadow(
                                                          color: Colors.black87)
                                                    ],
                                                    size: 30,
                                                    color: Colors.green)),
                                            IconButton(
                                                onPressed: () {
                                                  Get.dialog(Align(
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        width: 400,
                                                        height: 150,
                                                        child: delete()),
                                                  ));
                                                },
                                                icon: const Icon(Icons.delete,
                                                    shadows: [
                                                      Shadow(
                                                          color: Colors.black)
                                                    ],
                                                    size: 30,
                                                    color: Colors.black)),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        )).toList(),
                  ),
                ],
              ),
            )));
  }

  Widget delete() {
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
                onPressed: () {},
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
                onPressed: () {},
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
