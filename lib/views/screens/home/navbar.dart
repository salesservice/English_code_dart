import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/favorite/favorite_controller.dart';
import 'package:flutter_isell_new/controller/home_page_controller.dart';
import 'package:flutter_isell_new/controller/settings_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/core/constants/sellx_route_names.dart';
import 'package:flutter_isell_new/views/widget/my_divador.dart';
import 'package:flutter_isell_new/views/widget/user_image.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends GetView<HomePageControllerImp> {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(FavoritController());
    String userimage = "${controller.userimage}";
    Get.put(HomePageControllerImp());
    //SettingsController settingsController = Get.put(SettingsController());
    // Get.put(FavoritController());
    // Get.put(MyFavoritController());

    return Drawer(
      child: Material(
        color: Myisellcolors.home,
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: Get.height / 50),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: const UserImage(
                        iconsize: 25,
                        radius: 25,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${controller.useremail}",
                          style: GoogleFonts.roboto(color: Myisellcolors.hvit),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${controller.userfname}",
                              style:
                                  GoogleFonts.roboto(color: Myisellcolors.hvit),
                            ),
                            const SizedBox(width: 3),
                            const Icon(
                              Icons.verified,
                              size: 17,
                              color: Myisellcolors.hoved,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const MyDivador(),
                buildMenuItem(
                  text: 'Favoritter',
                  icon: Icons.favorite,
                  onClicked: () => selectedItem(context, 0),
                ),
                buildMenuItem(
                    text: 'Vurderinger',
                    icon: Icons.star,
                    onClicked: () => selectedItem(context, 1)),
                buildMenuItem(
                    text: 'Varslinger',
                    icon: Icons.notifications_sharp,
                    onClicked: () => selectedItem(context, 2)),
                buildMenuItem(
                    text: 'Betalinger',
                    icon: Icons.payment,
                    onClicked: () => selectedItem(context, 3)),
                buildMenuItem(
                    text: 'Kontakt oss',
                    icon: Icons.contact_support,
                    onClicked: () => selectedItem(context, 4)),
                const MyDivador(),
                buildMenutext(
                    text: "Vilkår og betingelser",
                    onClicked: () => selectedItem(context, 6)),
                buildMenutext(
                    text: "Personvernerklæring",
                    onClicked: () => selectedItem(context, 7)),
                buildMenutext(
                    text: "Innstillinger",
                    onClicked: () => selectedItem(context, 8)),
                buildMenutext(
                    text: "Om Sellx",
                    onClicked: () => selectedItem(context, 9)),
                buildMenutext(
                  text: "Mørk/Lys",
                ),
                const MyDivador(),
                buildMenuItem(
                  text: 'Logg ut',
                  icon: Icons.logout,
                  onClicked: () => selectedItem(context, 5),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(
      {required String text, required IconData icon, VoidCallback? onClicked}) {
    const color = Myisellcolors.hvit;
    const iconncolor = Myisellcolors.hoved;
    const hovercolor = Myisellcolors.hvit70;

    return ListTile(
      title: Text(
        text,
        style: GoogleFonts.roboto(color: color),
      ),
      hoverColor: hovercolor,
      onTap: onClicked,
      minLeadingWidth: 30,
      leading: Icon(
        icon,
        color: color,
      ),
    );
  }

  Widget buildMenutext({required String text, VoidCallback? onClicked}) {
    const color = Myisellcolors.hvit;

    const hovercolor = Myisellcolors.hvit70;
    return ListTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: GoogleFonts.roboto(color: color, fontSize: 16),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(top: 6),
            child: const Icon(
              Icons.navigate_next,
              color: Myisellcolors.hvit,
            ),
          )
        ],
      ),
      hoverColor: hovercolor,
      onTap: onClicked,
      minLeadingWidth: 30,
    );
  }

  void selectedItem(BuildContext context, int index) {
    SettingsController settingsController = Get.put(SettingsController());
    Navigator.pop(context);
    switch (index) {
      case 0:
        Get.toNamed(AppRouter.favoritter);
        break;
      case 1:
        Get.toNamed(AppRouter.vurderinger);
        break;
      case 2:
        Get.toNamed(AppRouter.varsler);
        break;
      case 3:
        Get.toNamed(AppRouter.betalinger);
        break;
      case 4:
        showContactOptions(context);
        break;
      case 5:
        showDialog(
          barrierColor: const Color.fromARGB(210, 3, 9, 19),
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              title: Text("Logg ut",
                  style: GoogleFonts.baloo2(color: Myisellcolors.hvit)),
              content: Text("Er du sikker på at du vil logge ut?",
                  style: GoogleFonts.baloo2(color: Myisellcolors.hvit)),
              actions: [
                TextButton(
                  child: Text(
                    "Nei",
                    style: GoogleFonts.baloo2(color: Colors.blue, fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                    child: Text(
                      "Ja",
                      style:
                          GoogleFonts.baloo2(color: Colors.red, fontSize: 20),
                    ),
                    onPressed: () {
                      settingsController.loggut();
                    }),
              ],
              actionsAlignment: MainAxisAlignment.center,
              icon: const Icon(
                Icons.logout,
                color: Myisellcolors.hvit,
              ),
              backgroundColor: Myisellcolors.appbar,
            );
          },
        );

        break;
      case 6:
        Get.toNamed(AppRouter.vilkarogbetingelser);
        break;
      case 7:
        Get.toNamed(AppRouter.personvernerklaring);
        break;
      case 8:
        Get.toNamed(AppRouter.instillinger);
        break;
      case 9:
        Get.toNamed(AppRouter.omsellx);
        break;
    }
  }
}

void showContactOptions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            iconColor: Myisellcolors.hvit,
            tileColor: Myisellcolors.appbar,
            leading: const Icon(Icons.phone),
            title: Text('Ring oss',
                style: GoogleFonts.baloo2(color: Myisellcolors.hvit)),
            onTap: () {
              //Navigator.of(context).pop();
            },
          ),
          ListTile(
            iconColor: Myisellcolors.hvit,
            tileColor: Myisellcolors.appbar,
            leading: const Icon(Icons.chat),
            title: Text('Chat med oss',
                style: GoogleFonts.baloo2(color: Myisellcolors.hvit)),
            onTap: () {
              // Navigator.of(context).pop();
            },
          ),
          ListTile(
            iconColor: Myisellcolors.hvit,
            tileColor: Myisellcolors.appbar,
            leading: const Icon(Icons.cancel),
            title: Text('Avbryt',
                style: GoogleFonts.baloo2(color: Myisellcolors.hvit)),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
