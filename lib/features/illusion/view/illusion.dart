import 'package:first_app/core/extensions/context_extensions.dart';
import 'package:first_app/core/widgets/main_error_widget.dart';
import 'package:first_app/features/illusion/bloc/illusion_bloc.dart';
import 'package:first_app/features/illusion/view/showdetils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/shared/request_status.dart';
import '../../../core/shared/service_locator.dart';
import '../data/models/illusion_model.dart';

// ignore: must_be_immutable
class IllsionPageView extends StatefulWidget {
  const IllsionPageView({super.key});

  @override
  State<IllsionPageView> createState() => _IllsionPageViewState();
}

class _IllsionPageViewState extends State<IllsionPageView> {
  @override
  void initState() {
    serviceLocator<IllusionBloc>().add(IndexIllusionEvent());
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
                            "الافات الزراعية",
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
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: context.height() * .8,
                    child: BlocBuilder<IllusionBloc, IllusionState>(
                        bloc: serviceLocator<IllusionBloc>(),
                        builder: (context, state) {
                          return state.indexStatus == RequestStatus.loading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : state.indexStatus == RequestStatus.success
                                  ? ListView.builder(
                                      itemCount: state.illusions.length,
                                      itemBuilder: (context, index) =>
                                          typePlant(
                                              state.illusions[index], context),
                                    )
                                  : Center(
                                      child: MainErrorWidget(onPressed: () {
                                        serviceLocator<IllusionBloc>()
                                            .add(IndexIllusionEvent());
                                      }),
                                    );
                        }),
                  )
                ],
              ),
            )));
  }
}

Widget typePlant(
  IllusionModel illusion,
  BuildContext context,
) {
  return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Tooltip(
        message: illusion.name,
        textStyle: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ShowDetailIllussionPageView(
                          illusion: illusion,
                        )));
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    width: 2, color: const Color.fromARGB(255, 199, 198, 198)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      illusion.photo!.replaceAll('localhost', '10.0.2.2'),
                    ),
                    colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.9), BlendMode.modulate))),
          ),
        ),
      ));
}
