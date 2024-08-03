import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AllAdvicePageView extends StatelessWidget {
  var isArculthire = false;

  AllAdvicePageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 59, 92, 30),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 59, 92, 30),
          foregroundColor: const Color.fromARGB(255, 59, 92, 30),
          onPressed: () {
            showAdaptiveDialog(
                context: context,
                builder: (context) => Align(
                      alignment: Alignment.center,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          width: 400,
                          height: 150,
                          child: AddAdviceAdmain()),
                    ));
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 20,
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => Get.back(),
                            child: const Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(Icons.arrow_back_ios,
                                    size: 20, color: Colors.grey),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 140,
                          ),
                          const Center(
                            child: Text(
                              "النصائح",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 59, 92, 30),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  fontFamily: "Pacifico"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    shap(context, "Aya Aya",
                        "اريد نصائح اضافية عن حياة النبتة والكثير منها", true),
                    shap(context, "Ahmad Aya",
                        "اتمنى اضافة معلومات اكثر عن الاليات الزراعية", false),
                  ]),
            ),
          ),
        ));
  }

  Widget shap(
      BuildContext context, String name, String advice, bool isArculture) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width / 1.8,
        height: MediaQuery.sizeOf(context).height / 4,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 59, 92, 30),
          ),
          color: const Color.fromARGB(255, 182, 233, 179),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              name,
              textAlign: TextAlign.right,
              style: const TextStyle(
                  color: Color.fromARGB(255, 59, 92, 30),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: "Pacifico"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    advice,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 6,
                    style: const TextStyle(
                        color: Colors.black87,
                        decoration: TextDecoration.none,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
                ],
              ),
            ),
            isArculture == false
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.check,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.close,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  Widget AddAdviceAdmain() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 450,
              child: Material(
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                      labelText: "اضف النصيحة",
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
          child: ElevatedButton(
            onPressed: () {},
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
    );
  }
}
