import 'package:flutter/material.dart';

import '../data/models/illusion_model.dart';

// ignore: must_be_immutable
class ShowDetailIllussionPageView extends StatefulWidget {
  const ShowDetailIllussionPageView({super.key, required this.illusion});
  final IllusionModel illusion;

  @override
  State<ShowDetailIllussionPageView> createState() =>
      _ShowDetailIllussionPageViewState();
}

class _ShowDetailIllussionPageViewState
    extends State<ShowDetailIllussionPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child:
                      Icon(Icons.arrow_back_ios, size: 20, color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.illusion.name!,
                      style: const TextStyle(
                          decoration: TextDecoration.none,
                          color: Color.fromARGB(255, 59, 92, 30),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: FadeInImage.assetNetwork(
                        image: widget.illusion.photo!,
                        placeholder: 'assets/images/1a.png',
                        fit: BoxFit.cover,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          widget.illusion.symptomsOfInjury!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 6,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                              color: Colors.black87,
                              decoration: TextDecoration.none,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
