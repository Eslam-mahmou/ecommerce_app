import 'dart:io';

import 'package:ecommerce_app/core/Services/servier_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/Services/shared_preference_services.dart';
import '../../../../../../core/Utils/colors_manager.dart';
import '../../../../../../core/Utils/font_manager.dart';
import '../../../../../../core/Utils/style_manager.dart';
import '../../../manager/profile_tab_cubit/profile_tab_cubit.dart';
import '../../../manager/profile_tab_cubit/profile_tab_state.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = getIt<ProfileTabCubit>();
    return BlocBuilder<ProfileTabCubit, ProfileTabState>(
        bloc: viewModel..loadImagePath(),
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomRight,
                children: [
                  IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              actionsAlignment: MainAxisAlignment.center,
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      viewModel.pickImageFromCamera().then(
                                        (value) {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                    child: Text(
                                      "Camera",
                                      style: getTextStyle(
                                          FontSize.s16,
                                          FontWeightManager.medium,
                                          ColorsManager.blackColor),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      viewModel.pickImageFromGallery().then(
                                        (value) {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                    child: Text(
                                      "Gallery",
                                      style: getTextStyle(
                                          FontSize.s16,
                                          FontWeightManager.medium,
                                          ColorsManager.blackColor),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Cancel",
                                      style: getTextStyle(
                                          FontSize.s16,
                                          FontWeightManager.medium,
                                          ColorsManager.blackColor),
                                    ))
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.camera_alt_rounded)),
                  state is SuccessProfileTabState
                      ? CircleAvatar(
                          radius: 120,
                          backgroundImage: FileImage(File(viewModel.image ??
                              "${SharedPreferenceServices.getToken("image")}")),
                        )
                      : const CircleAvatar(
                          radius: 120,
                        )
                ],
              ),
            ],
          );
        });
  }
}
