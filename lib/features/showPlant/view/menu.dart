import 'package:first_app/core/cubit/advertisment_cubit.dart';
import 'package:first_app/core/shared/request_status.dart';
import 'package:first_app/core/shared/service_locator.dart';
import 'package:first_app/core/widgets/yes_no_dialog.dart';
import 'package:first_app/features/advice/presentation/pages/all_advice.dart';
import 'package:first_app/features/agriculture/view/agriculture.dart';
import 'package:first_app/features/care/view/care.dart';
import 'package:first_app/features/illusion/view/illusion.dart';
import 'package:first_app/features/intro/view/intro.dart';
import 'package:first_app/features/profile/bloc/profile_bloc.dart';
import 'package:first_app/features/storage/view/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../chat/presentation/converstion_Header.dart';
import '../../profile/presentation/profile.dart';
import '../../settings/view/setting.dart';
import 'showplant.dart';

// ignore: must_be_immutable
class MenuPageView extends StatefulWidget {
  const MenuPageView({super.key});

  @override
  State<MenuPageView> createState() => _MenuPageViewState();
}

class _MenuPageViewState extends State<MenuPageView> {
  @override
  void initState() {
    super.initState();
    serviceLocator<AdvertismentCubit>().getAdverts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      color: const Color.fromARGB(255, 59, 92, 30),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "انواع المحاصيل والنباتات",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Tooltip(
                    message: "الاعدادات",
                    child: IconButton(
                        onPressed: () {
                          showAdaptiveDialog(
                            context: context,
                            builder: (context) => Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                color: Colors.white,
                                width: MediaQuery.of(context).size.width * .7,
                                height: MediaQuery.of(context).size.height,
                                child: const Getwid(),
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.settings,
                          size: 28,
                          color: Colors.white,
                        )),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(60))),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: Column(
                          children: [
                            typePlant('assets/images/15.jpg', "نباتات زينة", 1,
                                context),
                            typePlant('assets/images/16.jpg', "محاصيل زيتية", 2,
                                context),
                            typePlant('assets/images/13.jpg', "محاصيل خضار", 3,
                                context),
                            typePlant('assets/images/14.jpg', "محاصيل فاكهة", 4,
                                context),
                            typePlant('assets/images/11.jpg', "محاصيل حبوب", 5,
                                context),
                            typePlant('assets/images/12.jpg', "محاصيل بقوليات",
                                6, context),
                          ],
                        ),
                      )
                    ]),
              ),
            ))
          ]),
    ));
  }

  Widget typePlant(String url, String name, int n, context) {
    return Padding(
        padding: const EdgeInsets.all(6.0),
        child: Tooltip(
          message: name,
          textStyle: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ShowPlantPageView()));
            },
            child: Container(
              width: 200,
              height: 180,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      width: 2,
                      color: const Color.fromARGB(255, 199, 198, 198)),
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
}

Widget icontext(String text) {
  return Align(
    alignment: Alignment.topRight,
    child: Container(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black87,
            decoration: TextDecoration.none),
      ),
    )),
  );
}

Widget icontextt(
  String text,
  IconData iconData,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
          child: Text(
        text,
        style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            decoration: TextDecoration.none),
      )),
      const SizedBox(
        width: 5,
      ),
      Icon(
        iconData,
        color: const Color.fromARGB(255, 59, 92, 30),
        size: 23,
      )
    ],
  );
}

class Getwid extends StatelessWidget {
  const Getwid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 236, 234, 234),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/images/1a.png",
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      )),
                  BlocBuilder<ProfileBloc, ProfileState>(
                    bloc: serviceLocator<ProfileBloc>(),
                    builder: (context, state) {
                      return state.getProfileStatus == RequestStatus.success
                          ? Center(
                              child: Text(state.user!.name!,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none,
                                    color: Colors.black,
                                  )))
                          : const Text('');
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Material(
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePageView(),
                        ));
                  },
                  child: icontextt("الملف الشخصي", Icons.person)),
            ),
            const Text(
              "_________________________",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Material(
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CarePageView(),
                          ));
                    },
                    child: icontext("طرق العناية "))),
            Material(
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllAdvicePageView(),
                          ));
                    },
                    child: icontext("النصائح"))),
            Material(
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const IllsionPageView(),
                        ));
                  },
                  child: icontext("الافات الزراعية")),
            ),
            Material(
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StoragePageView(),
                          ));
                    },
                    child: icontext("طرق التخزين"))),
            // Material(
            //     child: InkWell(
            //         onTap: () {
            //           Navigator.push(context,IrrigationPageView());
            //         },
            //         child: icontext("طرق الري"))),
            Material(
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AgriculturePageView(),
                          ));
                    },
                    child: icontext("الية الزراعة"))),
            // Material(
            //     child: InkWell(
            //         onTap: () {
            //           Navigator.push(context,SeasonsPageView());
            //         },
            //         child: icontext("المواسم"))),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "_________________________",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Material(
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ConversationPageView(),
                        ));
                  },
                  child: icontextt("المحادثات", Icons.call)),
            ),
            const SizedBox(
              height: 10,
            ),
            Material(
              child: GestureDetector(
                onTap: () {
                  showAboutDialog(
                    context: context,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 82),
                  child: icontextt("حول", Icons.help_outline_outlined),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Material(
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingPageView(),
                        ));
                  },
                  child: icontextt("الاعدادات", Icons.settings)),
            ),
            const SizedBox(
              height: 10,
            ),
            Material(
              child: GestureDetector(
                onTap: () {
                  showAdaptiveDialog(
                    context: context,
                    builder: (context) => YesNoDialog(
                        title:
                            'هل أنت متأكد من تسجيل الخروج\n سيتم مسح جميع البيانات المحلية للتطبيق؟',
                        onTapYes: () async {
                          serviceLocator<ProfileBloc>().add(LogoutEvent());
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(
                            builder: (context) {
                              return const IntroPageView();
                            },
                          ), (route) => false);
                        }),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: icontextt("تسجيل الخروج", Icons.exit_to_app_rounded),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
