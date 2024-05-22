import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/address/add_address_contoller.dart';
import 'package:flutter_isell_new/core/classes/handling_data_view.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/views/screens/home/navbar.dart';
import 'package:flutter_isell_new/views/widget/sellx_%20buttons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressController addAddressController = Get.put(AddAddressController());
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
            "Legg til ny adresse",
            style: GoogleFonts.baloo2(fontSize: 20, color: Myisellcolors.hvit),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {},
      //   label: const Text('Legg til ny adresse'),
      //   icon: const Icon(Icons.add),
      //   backgroundColor: Myisellcolors.hoved,
      // ),
      endDrawer: const NavBar(),
      body: GetBuilder<AddAddressController>(
          builder: (addAddressController) => HandlingDataView(
                statusRequest: addAddressController.statusRequest,
                widget: Column(
                  children: [
                    if (addAddressController.kGooglePlex != null)
                      Expanded(
                        child: Stack(
                          children: [
                            GoogleMap(
                              myLocationButtonEnabled: true,
                              myLocationEnabled: true,
                              mapType: MapType.hybrid,
                              markers: addAddressController.markers.toSet(),
                              onTap: (latlong) {
                                addAddressController.addMarkers(latlong);
                              },
                              initialCameraPosition:
                                  addAddressController.kGooglePlex!,
                              onMapCreated: (GoogleMapController controller) {
                                addAddressController.controller
                                    .complete(controller);
                              },
                            ),
                            IsellButtons(
                                size: const Size(240, 60),
                                name: "Legg til ny adresse",
                                onPresset: () {
                                  addAddressController.goToAdressDetailsPage();
                                },
                                alignmen: const Alignment(0, 0.85),
                                borderradius: 100,
                                fontsize: 17,
                                icon: Icons.add,
                                widthbetweeniconandtext: 15.0,
                                bgcolor: Myisellcolors.hoved)
                          ],
                        ),
                      )
                  ],
                ),
              )),
    );
  }
}
