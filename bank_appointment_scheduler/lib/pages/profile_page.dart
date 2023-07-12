// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'package:bank_appointment_scheduler/Product/navigator/navigator_manager.dart';
import 'package:bank_appointment_scheduler/Product/navigator/navigator_route.dart';
import 'package:bank_appointment_scheduler/constants/image_icon_path.dart';
import 'package:bank_appointment_scheduler/generated/locale_keys.g.dart';
import 'package:bank_appointment_scheduler/pages/login/index.dart';
import 'package:bank_appointment_scheduler/provider/category_provider.dart';
import 'package:bank_appointment_scheduler/provider/profile_edit_provider.dart';
import 'package:bank_appointment_scheduler/service/api_service.dart';
import 'package:bank_appointment_scheduler/theme/style/paddigs_and_decaration.dart';

import '../constants/color_constants.dart';
import '../model/profile_model.dart';

class Profile extends StatefulWidget {
  const Profile({
    Key? key,
    required this.token,
  }) : super(key: key);
  final String token;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with BackgroundDecoration {
  late Future<List<ProfileModel>> _user;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchUserDetails();
  }

  Future<void> _fetchUserDetails() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final user = ApiService().fetchUserDetails(widget.token);
      setState(() {
        _user = user;
        _isLoading = false;
      });
    } catch (error) {
      print(error);
      setState(() {
        _isLoading = false;
      });
      // Hata durumunu yönetmek isterseniz burada bir hata mesajı gösterebilirsiniz
    }
  }

  @override
  Widget build(BuildContext context) {
    ProfileEditProvider profileProvider = context.read<ProfileEditProvider>();
    return Consumer<CategoryProvider>(
        builder: (context, provider, child) => Container(
            decoration: decoration,
            child: Scaffold(
              appBar: AppBar(),
              body: _isLoading
                  ? Center(
                      child: SpinKitFadingCircle(
                      color: ColorConstants.white,
                    ))
                  : FutureBuilder<List<ProfileModel>>(
                      future: _user,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: SpinKitFadingCircle(
                            color: ColorConstants.white,
                          ));
                        } else if (snapshot.hasData) {
                          final List<ProfileModel>? userList = snapshot.data;

                          return SingleChildScrollView(
                            child: Padding(
                              padding: horizontalPaddingMedium,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Image.asset(
                                      ImageEnum.logo2.imagePath,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .15,
                                    ),
                                  ),
                                  const CustomSizedBox(),
                                  const CustomSizedBox(),
                                  LabelTextCustom(
                                    title: LocaleKeys.profile.tr(),
                                  ),
                                  const CustomSizedBox(),
                                  //ImageProfile and Name
                                  SizedBox(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CircleAvatar(
                                          radius: 45,
                                          backgroundImage: AssetImage(
                                              ImageEnum.profile.imagePath),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            '${userList![0].name} ${userList[0].lastName}',
                                            style: TextStyle(
                                                color: ColorConstants.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ),
                                        Material(
                                          color: Colors.transparent,
                                          child: EditNameTitle(
                                            hintText: LocaleKeys.new_name.tr(),
                                            textColor: ColorConstants.white,
                                            iconColor: ColorConstants.white,
                                            alertTitle:
                                                LocaleKeys.edit_name.tr(),
                                            titleController:
                                                profileProvider.nameController,
                                            onPressed: () {
                                              profileProvider.nameController
                                                      .text.isNotEmpty
                                                  ? context
                                                      .read<
                                                          ProfileEditProvider>()
                                                      .updateName(
                                                          profileProvider
                                                              .nameController
                                                              .text)
                                                  : context
                                                      .read<
                                                          ProfileEditProvider>()
                                                      .fullName;
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 21),
                                      ],
                                    ),
                                  ),
                                  const CustomSizedBox(),

                                  //INN number and phone number

                                  ProfileNumberListtile(
                                    number: '${userList[0].pin}',
                                    editButton: EditNameTitle(
                                        hintText: LocaleKeys.new_inn.tr(),
                                        textColor: ColorConstants.white,
                                        iconColor: ColorConstants
                                            .appBarBackgroundColor,
                                        onPressed: () {
                                          profileProvider
                                                  .innController.text.isNotEmpty
                                              ? context
                                                  .read<ProfileEditProvider>()
                                                  .updateInn(profileProvider
                                                      .innController.text)
                                              : context
                                                  .read<ProfileEditProvider>()
                                                  .innNumber;
                                          Navigator.pop(context);
                                        },
                                        titleController:
                                            profileProvider.innController,
                                        alertTitle: LocaleKeys.edit_inn.tr()),
                                  ),
                                  const CustomSizedBox(),

                                  ProfileNumberListtile(
                                    number: '${userList[0].phoneNumber}',
                                    editButton: EditNameTitle(
                                        hintText: LocaleKeys.new_phone.tr(),
                                        iconColor: ColorConstants
                                            .appBarBackgroundColor,
                                        textColor: ColorConstants.white,
                                        onPressed: () {
                                          profileProvider.phoneController.text
                                                  .isNotEmpty
                                              ? context
                                                  .read<ProfileEditProvider>()
                                                  .updatePhoneNumber(
                                                      profileProvider
                                                          .phoneController.text)
                                              : context
                                                  .read<ProfileEditProvider>()
                                                  .phoneNumber;
                                          Navigator.pop(context);
                                        },
                                        titleController:
                                            profileProvider.phoneController,
                                        alertTitle:
                                            LocaleKeys.edit_phone_num.tr()),
                                  ),

                                  const CustomSizedBox(),
                                  ProfileNumberListtile(
                                    number: '${userList[0].email}',
                                    editButton: EditNameTitle(
                                        hintText: LocaleKeys.new_phone.tr(),
                                        iconColor: ColorConstants
                                            .appBarBackgroundColor,
                                        textColor: ColorConstants.white,
                                        onPressed: () {
                                          profileProvider.phoneController.text
                                                  .isNotEmpty
                                              ? context
                                                  .read<ProfileEditProvider>()
                                                  .updatePhoneNumber(
                                                      profileProvider
                                                          .phoneController.text)
                                              : context
                                                  .read<ProfileEditProvider>()
                                                  .phoneNumber;
                                          Navigator.pop(context);
                                        },
                                        titleController:
                                            profileProvider.phoneController,
                                        alertTitle:
                                            LocaleKeys.edit_phone_num.tr()),
                                  ),

                                  const CustomSizedBox(),
                                  LabelTextCustom(
                                      title: LocaleKeys.ticket.tr()),
                                  //Tickets
                                  Material(
                                    color: Colors.transparent,
                                    child: SizedBox(
                                      height: provider.ticket.isNotEmpty
                                          ? (provider.ticket.length == 1
                                              ? 90
                                              : 180)
                                          : 0,
                                      child: ListView.builder(
                                          itemCount: provider.ticket.length,
                                          itemBuilder: (context, index) {
                                            final ticket =
                                                provider.ticket[index];

                                            return Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 5),
                                              child: ListTile(
                                                onTap: () {
                                                  NavigatorManager.instance
                                                      .pushTopageReplacementNamed(
                                                          NavigateRoutes
                                                              .ticketDetail,
                                                          arguments: provider
                                                              .getTicketDetailsRouteArguments(
                                                                  index,
                                                                  ticket));
                                                },
                                                // contentPadding: EdgeInsets.zero,
                                                trailing: const Icon(Icons
                                                    .navigate_next_outlined),
                                                leading: const Icon(
                                                    Icons.location_on_outlined),
                                                tileColor: ColorConstants
                                                    .backgroundButtonColor,
                                                title: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                        flex: 3,
                                                        child: Text(
                                                          ticket
                                                              .selectedAddress,
                                                        )),
                                                    Expanded(
                                                        child: Column(
                                                      children: [
                                                        Text(ticket
                                                            .selectedDate),
                                                        Text(ticket
                                                            .selectedTime),
                                                      ],
                                                    )),
                                                  ],
                                                ),
                                                subtitle: Text(
                                                    provider
                                                        .selectedAddressFilial,
                                                    style: const TextStyle(
                                                        fontSize: 10,
                                                        color: ColorConstants
                                                            .appBarBackgroundColor)),
                                              ),
                                            );
                                          }),
                                    ),
                                  ),

                                  TextButton.icon(
                                    style: const ButtonStyle(),
                                    onPressed: () {},
                                    icon: Text(LocaleKeys.history.tr(),
                                        style: TextStyle(
                                            color: ColorConstants.white)),
                                    label: Icon(
                                      Icons.navigate_next_outlined,
                                      color: ColorConstants.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                        return const Center(
                            child: Text('Kullanıcı bilgileri yüklenemedi'));
                      },
                    ),
            )));
  }
}

class EditNameTitle extends StatelessWidget {
  const EditNameTitle({
    Key? key,
    required this.titleController,
    required this.alertTitle,
    required this.hintText,
    required this.textColor,
    required this.iconColor,
    required this.onPressed,
  }) : super(key: key);
  final TextEditingController titleController;
  final String alertTitle;
  final String hintText;
  final Color textColor;
  final Color iconColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                alertTitle,
                style: TextStyle(color: textColor, fontSize: 16),
              ),
              backgroundColor: ColorConstants.appBarBackgroundColor,
              content: TextField(
                style: TextStyle(color: ColorConstants.white),
                cursorColor: ColorConstants.white,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: ColorConstants.grey),
                    hintText: hintText,
                    fillColor: ColorConstants.appBarBackgroundColor),
                controller: titleController,
              ),
              actions: [
                TextButton(
                    onPressed: onPressed,
                    child: Text(
                      LocaleKeys.save.tr(),
                      style: TextStyle(color: ColorConstants.white),
                    ))
              ],
            );
          },
        );
      },
      child: Image.asset(
        IconEnum.pencil.iconPath,
        height: 20,
        color: iconColor,
      ),
    );
  }
}

class ProfileNumberListtile extends StatelessWidget {
  const ProfileNumberListtile({
    Key? key,
    required this.editButton,
    required this.number,
  }) : super(key: key);
  final Widget editButton;
  final String number;
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: ListTile(
            textColor: ColorConstants.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            title: Text(
              number,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2,
                  fontSize: 16,
                  color: ColorConstants.appBarBackgroundColor),
            ),
            trailing: editButton));
  }
}

class LabelTextCustom extends StatelessWidget {
  const LabelTextCustom({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: ColorConstants.white,
          fontSize: 18,
          fontWeight: FontWeight.w500),
    );
  }
}
