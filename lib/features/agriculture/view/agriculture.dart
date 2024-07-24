import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AgriculturePageView extends StatelessWidget {
  const AgriculturePageView({super.key});
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
                        const SizedBox(
                          width: 140,
                        ),
                        const Center(
                          child: Text(
                            "الية زراعة المحاصيل",
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
                  const Column(
                    children: [],
                  )
                ],
              ),
            )));
  }
}
