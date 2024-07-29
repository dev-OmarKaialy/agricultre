import 'package:first_app/core/extensions/widget_extensions.dart';
import 'package:first_app/core/shared/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/shared/request_status.dart';
import '../../../core/widgets/main_error_widget.dart';
import '../../settings/bloc/settings_bloc.dart';

// ignore: must_be_immutable
class SettingCare extends StatefulWidget {
  const SettingCare({super.key});

  @override
  State<SettingCare> createState() => _SettingCareState();
}

class _SettingCareState extends State<SettingCare> {
  @override
  void initState() {
    super.initState();
    serviceLocator<SettingsBloc>().add(IndexCaresEvent());
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
                        child: addAgriculure()),
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
                      "تعديل طرق العناية ",
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
                  SizedBox(
                    height: context.height * .8,
                    child: BlocBuilder<SettingsBloc, SettingsState>(
                        bloc: serviceLocator<SettingsBloc>(),
                        builder: (context, state) {
                          return state.caresStatus == RequestStatus.loading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : state.caresStatus == RequestStatus.success
                                  ? state.cares.isEmpty
                                      ? const Center(
                                          child: Text('No Agris Yet'),
                                        )
                                      : ListView.builder(
                                          itemCount: state.cares.length,
                                          itemBuilder: (context, index) =>
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: ExpansionTile(
                                                  trailing: const Icon(
                                                          Icons.remove,
                                                          color: Colors.red)
                                                      .onTap(() {
                                                    showAdaptiveDialog(
                                                        context: context,
                                                        builder: (c) {
                                                          return Dialog(
                                                            child: delete(state
                                                                .cares[index]
                                                                .id!),
                                                          );
                                                        });
                                                  }),
                                                  childrenPadding:
                                                      const EdgeInsets.all(10),
                                                  collapsedShape:
                                                      RoundedRectangleBorder(
                                                          side:
                                                              const BorderSide(),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                  shape: RoundedRectangleBorder(
                                                      side: const BorderSide(),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  title: Text(
                                                      state.cares[index].name!),
                                                  children: [
                                                    Text(state.cares[index]
                                                        .discrption!)
                                                  ],
                                                ),
                                              ))
                                  : Center(
                                      child: MainErrorWidget(onPressed: () {
                                        serviceLocator<SettingsBloc>()
                                            .add(IndexCaresEvent());
                                      }),
                                    );
                        }),
                  )
                ],
              ),
            )));
  }

  Widget addAgriculure() {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();
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
                    controller: nameController,
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
                    controller: descriptionController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        labelText: "معلومات عن طريقة العناية",
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
                serviceLocator<SettingsBloc>().add(CreateCareEvent(
                    name: nameController.text,
                    descriptino: descriptionController.text));
                Navigator.pop(context);
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
                  serviceLocator<SettingsBloc>().add(DeleteCaresEvent(id: id));
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
