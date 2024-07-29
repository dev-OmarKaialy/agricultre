import 'package:first_app/core/extensions/context_extensions.dart';
import 'package:first_app/features/agriculture/bloc/agri_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/shared/request_status.dart';
import '../../../core/shared/service_locator.dart';
import '../../../core/widgets/main_error_widget.dart';

// ignore: must_be_immutable
class AgriculturePageView extends StatefulWidget {
  const AgriculturePageView({super.key});

  @override
  State<AgriculturePageView> createState() => _AgriculturePageViewState();
}

class _AgriculturePageViewState extends State<AgriculturePageView> {
  @override
  void initState() {
    super.initState();
    serviceLocator<AgriBloc>().add(IndexAgriEvent());
  }

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
                        onChanged: (v) {
                          serviceLocator<AgriBloc>()
                              .add(SearchAgriEvent(phrase: v));
                        },
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
                    height: context.height() * .8,
                    child: BlocBuilder<AgriBloc, AgriState>(
                        bloc: serviceLocator<AgriBloc>(),
                        builder: (context, state) {
                          return state.indexStatus == RequestStatus.loading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : state.indexStatus == RequestStatus.success
                                  ? state.agris.isEmpty
                                      ? const Center(
                                          child: Text('No Agris Yet'),
                                        )
                                      : ListView.builder(
                                          itemCount: state.agris.length,
                                          itemBuilder: (context, index) =>
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: ExpansionTile(
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
                                                      state.agris[index].name!),
                                                  children: [
                                                    Text(state.agris[index]
                                                        .discrption!)
                                                  ],
                                                ),
                                              ))
                                  : Center(
                                      child: MainErrorWidget(onPressed: () {
                                        serviceLocator<AgriBloc>()
                                            .add(IndexAgriEvent());
                                      }),
                                    );
                        }),
                  )
                ],
              ),
            )));
  }
}
