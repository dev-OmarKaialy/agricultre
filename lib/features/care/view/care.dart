import 'package:first_app/core/extensions/context_extensions.dart';
import 'package:first_app/core/shared/request_status.dart';
import 'package:first_app/core/shared/service_locator.dart';
import 'package:first_app/core/widgets/main_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/care_bloc.dart';

// ignore: must_be_immutable
class CarePageView extends StatefulWidget {
  const CarePageView({super.key});

  @override
  State<CarePageView> createState() => _CarePageViewState();
}

class _CarePageViewState extends State<CarePageView> {
  @override
  void initState() {
    serviceLocator<CareBloc>().add(IndexCaresEvent());
    super.initState();
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
                            "طرق العناية",
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
                        onChanged: (c) {
                          serviceLocator<CareBloc>()
                              .add(SearchCares(phrase: c));
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
                  BlocConsumer<CareBloc, CareState>(
                    bloc: serviceLocator<CareBloc>(),
                    listener: (context, state) {},
                    builder: (context, state) {
                      return state.indexCareStatus == RequestStatus.loading
                          ? const Center(child: CircularProgressIndicator())
                          : state.indexCareStatus == RequestStatus.failed
                              ? Center(child: MainErrorWidget(onPressed: () {
                                  serviceLocator<CareBloc>()
                                      .add(IndexCaresEvent());
                                }))
                              : SizedBox(
                                  height: context.height() * .8,
                                  child: state.cares.isEmpty
                                      ? const Center(
                                          child: Text('There Is No Data Yet'),
                                        )
                                      : ListView.builder(
                                          itemCount: state.cares.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
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
                                                                .circular(15)),
                                                shape: RoundedRectangleBorder(
                                                    side: const BorderSide(),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                title: Text(
                                                    state.cares[index].name!),
                                                children: [
                                                  Text(state
                                                      .cares[index].discrption!)
                                                ],
                                              ),
                                            );
                                          }),
                                );
                    },
                  )
                ],
              ),
            )));
  }
}

Widget typePlant(String url, String name, int n, BuildContext context) {
  return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Tooltip(
        message: name,
        textStyle: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        child: InkWell(
          onTap: () {},
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    width: 2, color: const Color.fromARGB(255, 199, 198, 198)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      url,
                    ),
                    colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.9), BlendMode.modulate))),
          ),
        ),
      ));
}
