import 'package:first_app/core/shared/request_status.dart';
import 'package:first_app/core/shared/service_locator.dart';
import 'package:first_app/core/widgets/shimmer_widget.dart';
import 'package:first_app/features/profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';

import 'edit_profile.dart';

// ignore: must_be_immutable
class ProfilePageView extends StatefulWidget {
  const ProfilePageView({super.key});

  @override
  State<ProfilePageView> createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView> {
  @override
  void initState() {
    serviceLocator<ProfileBloc>().add(GetProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(Icons.arrow_back_ios, size: 25, color: Colors.black),
            ),
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: SingleChildScrollView(
          child: BlocBuilder<ProfileBloc, ProfileState>(
            bloc: serviceLocator<ProfileBloc>(),
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: GFAvatar(
                      size: 150,
                      backgroundImage: AssetImage('assets/images/fa1.png'),
                    ),
                  ),
                  state.getProfileStatus == RequestStatus.loading
                      ? const ShimmerWidget.rectangular(
                          height: 20,
                          width: 100,
                        )
                      : state.getProfileStatus == RequestStatus.success
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                state.user!.name!,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                  color: Color.fromARGB(255, 59, 92, 30),
                                ),
                              ),
                            )
                          : SizedBox(
                              width: MediaQuery.sizeOf(context).width,
                              child: const Text(
                                'فشل الاتصال !',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 199, 197, 195)
                            .withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: state.getProfileStatus == RequestStatus.loading
                          ? ShimmerWidget.rectangular(
                              height: 200,
                              width: MediaQuery.sizeOf(context).width,
                            )
                          : state.getProfileStatus == RequestStatus.success
                              ? Column(children: [
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  con(Icons.email, state.user!.email!),
                                  con(Icons.person_3_outlined,
                                      state.user!.name!),
                                  con(Icons.location_pin, state.user!.address!),
                                  con(Icons.phone_outlined, state.user!.phone!),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                ])
                              : const SizedBox(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Material(
                    child: InkWell(
                      onTap: () {
                        if (state.getProfileStatus == RequestStatus.success) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditprofileViewPage(
                                  user: state.user!,
                                ),
                              ));
                        } else if (state.getProfileStatus ==
                            RequestStatus.failed) {
                          serviceLocator<ProfileBloc>().add(GetProfileEvent());
                        }
                      },
                      child: Text(
                        state.getProfileStatus == RequestStatus.success
                            ? "تعديل الملف الشخصي ؟"
                            : state.getProfileStatus == RequestStatus.failed
                                ? 'إعادة المحاولة'
                                : '',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 107, 165, 56),
                            decoration: TextDecoration.none),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  // Widget Password() {
  //   return Column(
  //     children: [
  //       const Center(
  //         child: Text(
  //           "ادخل كلمة المرور السابقة",
  //           style: TextStyle(
  //             fontSize: 18,
  //             fontWeight: FontWeight.bold,
  //             decoration: TextDecoration.none,
  //             color: Color.fromARGB(255, 59, 92, 30),
  //           ),
  //         ),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: SizedBox(
  //           width: 350,
  //           child: Material(
  //             child: TextFormField(
  //               controller: TextEditingController(),
  //               obscureText: true,
  //               decoration: InputDecoration(
  //                   prefixIcon: const Icon(
  //                     Icons.lock,
  //                     color: Color.fromARGB(255, 107, 165, 56),
  //                   ),
  //                   suffixIcon: InkWell(
  //                     onTap: () {},
  //                     child: const Icon(
  //                         true ? Icons.visibility : Icons.visibility_off),
  //                   ),
  //                   labelText: "ادخل كلمة السر",
  //                   enabledBorder: OutlineInputBorder(
  //                     borderSide: const BorderSide(
  //                         width: 1, color: Color.fromARGB(255, 59, 92, 30)),
  //                     borderRadius: BorderRadius.circular(15),
  //                   ),
  //                   focusedBorder: OutlineInputBorder(
  //                     borderSide: const BorderSide(
  //                         width: 1, color: Color.fromARGB(255, 59, 92, 30)),
  //                     borderRadius: BorderRadius.circular(15),
  //                   )),
  //               validator: (value) {
  //                 if (value!.isEmpty) {
  //                   return "ادخل كلمة السر";
  //                 }

  //                 return null;
  //               },
  //               onChanged: (value) {},
  //             ),
  //           ),
  //         ),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: ElevatedButton(
  //           onPressed: () {
  //             Get.to(EditprofileViewPage());
  //           },
  //           style: ElevatedButton.styleFrom(
  //               backgroundColor: const Color.fromARGB(255, 59, 92, 30),
  //               shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(30)),
  //               padding:
  //                   const EdgeInsets.symmetric(vertical: 20, horizontal: 50)),
  //           child: const Text(
  //             "تاكيد",
  //             style: TextStyle(fontSize: 18, color: Colors.white),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget con(IconData iconData, String name) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            iconData,
            color: const Color.fromARGB(255, 59, 92, 30),
            weight: 18,
          ),
          Text(name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                color: Colors.black87,
              )),
        ],
      ),
    );
  }
}
