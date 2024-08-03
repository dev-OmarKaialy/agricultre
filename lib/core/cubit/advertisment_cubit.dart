import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:first_app/core/data/advertis_datasource.dart';
import 'package:first_app/core/data/advertis_model.dart';
import 'package:first_app/core/extensions/context_extensions.dart';
import 'package:first_app/core/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

part 'advertisment_state.dart';

class AdvertismentCubit extends Cubit<AdvertismentState> {
  AdvertismentCubit() : super(AdvertismentState());

  getAdverts() async {
    final result = await AdvertisREpo().getAdverts();
    result.fold((left) {}, (right) {
      emit(state.copyWith(adverts: right));
      if (state.adverts != null) {
        Future.delayed(Durations.extralong4 * 10, () {
          showGeneralDialog(
              context: rootKey.currentContext!,
              pageBuilder: (c, s, aa) {
                return NewWidget(
                  ad: state.adverts!
                      .doc![Random().nextInt(state.adverts!.doc!.length)],
                );
              });
        });
        Timer.periodic(const Duration(minutes: 5), (s) {
          showGeneralDialog(
              context: rootKey.currentContext!,
              pageBuilder: (c, s, aa) {
                return NewWidget(
                    ad: state.adverts!
                        .doc![Random().nextInt(state.adverts!.doc!.length)]);
              });
        });
      }
    });
  }
}

class NewWidget extends StatefulWidget {
  const NewWidget({
    Key? key,
    required this.ad,
  }) : super(key: key);
  final AdModel ad;
  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..forward();
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(
          height: 10,
          width: 10,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (c, s) => _animation.isCompleted
                  ? const Icon(Icons.close).onTap(() {
                      Navigator.pop(context);
                    })
                  : CircularProgressIndicator.adaptive(
                      value: _animation.value,
                    ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Image.network(widget.ad.photo!.replaceAll('localhost', '10.0.2.2')),
          const SizedBox(
            height: 50,
          ),
          Text(
            widget.ad.name!,
            style: context.textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(1000, 80),
                  shape: const BeveledRectangleBorder(),
                  backgroundColor: const Color.fromARGB(255, 39, 84, 41),
                  textStyle: context.textTheme.bodyLarge),
              onPressed: () {},
              child: Text(
                'Learn More',
                style:
                    context.textTheme.bodyLarge?.copyWith(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
