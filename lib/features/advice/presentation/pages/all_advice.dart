import 'package:first_app/core/extensions/widget_extensions.dart';
import 'package:first_app/core/shared/service_locator.dart';
import 'package:first_app/core/shared/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/advice_bloc.dart';

// ignore: must_be_immutable
class AllAdvicePageView extends StatefulWidget {
  const AllAdvicePageView({super.key});

  @override
  State<AllAdvicePageView> createState() => _AllAdvicePageViewState();
}

class _AllAdvicePageViewState extends State<AllAdvicePageView> {
  var isArculthire = false;
  @override
  void initState() {
    super.initState();
    serviceLocator<AdviceBloc>().add(GetAdvices());
  }

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
                    BlocBuilder<AdviceBloc, AdviceState>(
                      bloc: serviceLocator<AdviceBloc>(),
                      builder: (context, state) {
                        return Column(
                          children: [
                            for (var i = 0; i < state.advices.length; i++)
                              shap(
                                  context,
                                  state.advices[i].user?.name ?? '',
                                  state.advices[i].description!,
                                  state.advices[i].active ?? false)
                          ],
                        );
                      },
                    )
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
            SharedPreferencesService.getType() == 'admin'
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
                      ).onTap(() {
                        serviceLocator<AdviceBloc>().add(
                            UpdateAdviceEvent(advice: advice, accept: true));
                      }),
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
                      ).onTap(() {
                        serviceLocator<AdviceBloc>().add(
                            UpdateAdviceEvent(advice: advice, accept: true));
                      }),
                    ],
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  Widget AddAdviceAdmain() {
    final controller = TextEditingController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 450,
              child: Material(
                child: TextFormField(
                  controller: controller,
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
            onPressed: () {
              serviceLocator<AdviceBloc>()
                  .add(AddAdviceEvent(advice: controller.text));
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
    );
  }
}
