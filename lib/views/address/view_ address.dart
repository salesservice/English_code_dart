import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/address/view_address_controller.dart';
import 'package:flutter_isell_new/core/classes/handling_data_view.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/core/constants/sellx_route_names.dart';
import 'package:flutter_isell_new/data/model/address_model.dart';
import 'package:flutter_isell_new/views/screens/home/navbar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewAddressController());
    return Scaffold(
      backgroundColor: Myisellcolors.home,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Myisellcolors.hvit),
        elevation: 1,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                Icons.menu_rounded,
                size: 30,
                color: Myisellcolors.hvit,
              ),
              padding: const EdgeInsets.only(right: 20, top: 5),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
        toolbarHeight: 65,
        backgroundColor: Myisellcolors.home,
        title: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "Dine adresser",
            style: GoogleFonts.baloo2(fontSize: 20, color: Myisellcolors.hvit),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed(AppRouter.addressadd);
        },
        label: const Text('Legg til ny adresse'),
        icon: const Icon(Icons.add),
        backgroundColor: Myisellcolors.hoved,
      ),
      endDrawer: const NavBar(),
      body: GetBuilder<ViewAddressController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return CardAddress(
                  addressModel: controller.data[index],
                  onpressed: () {
                    controller.deleteAddress(controller.data[index].addressId!);
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CardAddress extends StatelessWidget {
  final void Function() onpressed;
  final AddressModel addressModel;
  const CardAddress(
      {super.key, required this.addressModel, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewAddressController());
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Myisellcolors.hoved),
          color: Myisellcolors.appbar,
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        title: Stack(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                        barrierColor: const Color.fromARGB(210, 3, 9, 19),
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            backgroundColor: Myisellcolors.appbar,
                            title: Text("Bekreft sletting",
                                style: GoogleFonts.baloo2(
                                    color: Myisellcolors.hvit)),
                            content: Text(
                                "Er du sikker på at du vil fjerne denne favoritten?",
                                style: GoogleFonts.baloo2(
                                    color: Myisellcolors.hvit)),
                            actions: [
                              TextButton(
                                child: Text("Nei",
                                    style: GoogleFonts.baloo2(
                                        color: Colors.blue, fontSize: 20)),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                  onPressed: () {
                                    onpressed();
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Ja",
                                      style: GoogleFonts.baloo2(
                                          color: Colors.red, fontSize: 20))),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Myisellcolors.hoved,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit_location_alt,
                      color: Myisellcolors.hoved,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  addressModel.addressName!,
                  style: GoogleFonts.roboto(
                      color: Myisellcolors.hvit, fontSize: 20),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "${addressModel.addressGate!} ",
                      style: GoogleFonts.roboto(
                          color: Myisellcolors.hvit70, fontSize: 15),
                    ),
                    Text(
                      "${addressModel.addressNr!},",
                      style: GoogleFonts.roboto(
                          color: Myisellcolors.hvit70, fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "${addressModel.addressPostcode!} ",
                      style: GoogleFonts.roboto(
                          color: Myisellcolors.hvit70, fontSize: 15),
                    ),
                    Text(
                      addressModel.addressBy!,
                      style: GoogleFonts.roboto(
                          color: Myisellcolors.hvit70, fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
