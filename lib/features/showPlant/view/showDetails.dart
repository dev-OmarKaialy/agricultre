import 'package:first_app/features/illusion/view/illusion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../controller/showplantcontroller.dart';

// ignore: must_be_immutable
class DetailsPageView extends GetResponsiveView<ShowPlantController> {
  @override
  ShowPlantController controller = Get.put(ShowPlantController());

  DetailsPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.topLeft,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios, size: 14, color: Colors.grey),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                child: Image.asset(
              controller.TheKind.url.toString(),
              fit: BoxFit.cover,
              height: MediaQuery.sizeOf(context).height / 1.6,
              // height: 300,
            )),
            Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 226, 225, 225),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        topLeft: Radius.circular(12))),
                height: MediaQuery.sizeOf(context).height / 1.2,
                width: MediaQuery.sizeOf(context).width,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            cardDescript(controller.TheKind.name.toString(),
                                controller.TheKind.description.toString()),
                            cardDescript("موعد الزراعة ",
                                controller.TheKind.agricultureTime.toString()),
                            cardDescript("القيمة الغذائية ",
                                controller.TheKind.valueplant.toString()),
                            cardDescript("فترة الحصاد",
                                controller.TheKind.getkinds.toString()),
                            InkWell(
                              onTap: () {
                                Get.to(IllsionPageView());
                              },
                              child: Material(
                                child: Padding(
                                  padding: const EdgeInsets.all(6),
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 194, 192, 192)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: GFAccordion(
                                      title: "الافات",
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color:
                                              Color.fromARGB(255, 59, 92, 30),
                                          decoration: TextDecoration.none),
                                      contentChild: TextButton(
                                        onPressed: () {
                                          Get.to(IllsionPageView());
                                        },
                                        child: const Center(
                                          child: Text(
                                            "الانتقال لصفحة الافات ",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
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
                                          color: const Color.fromARGB(
                                              255, 194, 192, 192)),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: GFAccordion(
                                    title: "طرق العناية",
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 59, 92, 30),
                                        decoration: TextDecoration.none),
                                    contentChild: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                    child: Text(
                                                  controller.des.toString(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 6,
                                                  style: const TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                              ],
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
                                          color: const Color.fromARGB(
                                              255, 194, 192, 192)),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: GFAccordion(
                                      title: "طرق التخزين",
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color:
                                              Color.fromARGB(255, 59, 92, 30),
                                          decoration: TextDecoration.none),
                                      contentChild: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                      child: Text(
                                                    controller.des.toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 6,
                                                    style: const TextStyle(
                                                        color: Colors.black87,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                ],
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ))
          ]),
        ),
      ),
    );
  }

  Widget con(IconData iconData, String name, Color color) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 243, 241, 241),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(120)),
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
          onPressed: () {},
          child: Row(
            children: [
              Icon(
                iconData,
                color: color,
                size: 30,
              ),
              Text(
                name,
                style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ],
          )),
    );
  }

  Widget roo(IconData iconData, String name) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.blueGrey,
            size: 30,
          ),
          Text(
            name,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 16),
          )
        ],
      ),
    );
  }

  Widget cardDescript(String n, String d) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Align(
            alignment: Alignment.topRight,
            child: Text(
              // controller.TheKind.name.toString(),,
              n,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 59, 92, 30)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                d,
                textAlign: TextAlign.right,
                // controller.des.toString(,),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )),
            ],
          ),
        ),
      ],
    );
  }
}
