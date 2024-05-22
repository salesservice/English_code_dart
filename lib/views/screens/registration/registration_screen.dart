import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/login_controller.dart';
import '../../../core/classes/handling_data_view.dart';
import '../../../core/constants/sellx_colors.dart';
import '../../../core/functions/validate_input.dart';
import '../../../data/static/login_static.dart';
import '../../widget/sellx_ buttons.dart';
import '../../widget/sellx_text_filed.dart';

class Registrering extends GetView<InnloggingControllerImp> {
  const Registrering({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.lazyReplace(() => InnloggingControllerImp(), fenix: true);
    Get.put(InnloggingControllerImp());

    return Form(
      key: controller.gkbekreftregistrertemail,
      child: GetBuilder<InnloggingControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest!,
          widget: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Myisellcolors.appbar,
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Myisellcolors.hvit),
              backgroundColor: Myisellcolors.appbar,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "Registrer",
                style:
                    GoogleFonts.baloo2(fontSize: 19, color: Myisellcolors.hvit),
              ),
            ),
            body: ListView(
              children: [
                SizedBox(
                  height: Get.height,
                  child: Column(
                    children: [
                      const Expanded(flex: 1, child: SizedBox()),
                      Text(
                        innloggingList[1].title!,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.merriweather(
                            fontWeight: FontWeight.w500,
                            color: Myisellcolors.hoved,
                            fontSize: 19),
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.only(left: 25, right: 25),
                        child: Text(
                          innloggingList[1].body!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.baloo2(
                              fontSize: 15, color: Myisellcolors.hvit70),
                        ),
                      ),
                      const Spacer(),
                      IsellTextField(
                        maxlines: 1,
                        validater: (val) {
                          return validInput(val!, 1, 100, "username");
                        },
                        fontsizehinttext: 14.5,
                        hinttxt: "Skriv inn ditt fult navn",
                        hinttxtcolor: Myisellcolors.hvit70,
                        contentpadding:
                            const EdgeInsets.fromLTRB(25, 23, 25, 23),
                        txtcolor: Myisellcolors.hvit,
                        txttype: TextInputType.name,
                        paddingcontainer:
                            const EdgeInsets.only(left: 20, right: 20),
                        cursorColor: Colors.grey,
                        height: 20,
                        width: 1,
                        con: controller.usernameController,
                        borderR: 15,
                        onSav: (value) {
                          controller.username = value!;
                        },
                        borderwidth: 1,
                        bordersidecolor: Myisellcolors.hoved,
                        obs: false,
                        alignment: const Alignment(0, -0.2),
                        label: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                            'Fult navn',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.mandali(
                                color: Myisellcolors.hoved, fontSize: 19),
                          ),
                        ),
                        float: FloatingLabelBehavior.always,
                        icon: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: const Icon(
                            Icons.person_outline,
                            color: Myisellcolors.hoved,
                          ),
                        ),
                      ),
                      const Spacer(),
                      IsellTextField(
                        maxlines: 1,
                        cursorColor: Colors.grey,
                        height: 20,
                        width: 1,
                        paddingcontainer:
                            const EdgeInsets.only(left: 20, right: 20),
                        fontsizehinttext: 14.5,
                        validater: (val) {
                          return validInput(val!, 5, 100, "email");
                        },
                        hinttxt: "Skriv inn din e-postadresse",
                        hinttxtcolor: Myisellcolors.hvit70,
                        contentpadding:
                            const EdgeInsets.fromLTRB(25, 23, 25, 23),
                        txtcolor: Myisellcolors.hvit,
                        txttype: TextInputType.emailAddress,
                        con: controller.emailController,
                        onSav: (value) {
                          controller.email = value!;
                        },
                        borderR: 15,
                        borderwidth: 1,
                        bordersidecolor: Myisellcolors.hoved,
                        obs: false,
                        alignment: const Alignment(0, -0.2),
                        label: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                            'E-post',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.mandali(
                                color: Myisellcolors.hoved, fontSize: 19),
                          ),
                        ),
                        float: FloatingLabelBehavior.always,
                        icon: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: const Icon(
                            Icons.email_outlined,
                            color: Myisellcolors.hoved,
                          ),
                        ),
                      ),
                      const Spacer(),
                      IsellTextField(
                        maxlines: 1,
                        fontsizehinttext: 14.5,
                        validater: (val) {
                          return validInput(val!, 1, 12, "phone");
                        },
                        hinttxt: "Skriv inn ditt telefon nummer",
                        hinttxtcolor: Myisellcolors.hvit70,
                        contentpadding:
                            const EdgeInsets.fromLTRB(25, 23, 25, 23),
                        txtcolor: Myisellcolors.hvit,
                        txttype: TextInputType.phone,
                        onSav: (value) {
                          controller.number = value!;
                        },
                        paddingcontainer:
                            const EdgeInsets.only(left: 20, right: 20),
                        cursorColor: Colors.grey,
                        height: 20,
                        width: 1,
                        con: controller.numberController,
                        borderR: 15,
                        borderwidth: 1,
                        bordersidecolor: Myisellcolors.hoved,
                        obs: false,
                        alignment: const Alignment(0, -0.2),
                        label: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                            'Telefon',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.mandali(
                                color: Myisellcolors.hoved, fontSize: 19),
                          ),
                        ),
                        float: FloatingLabelBehavior.always,
                        icon: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: const Icon(
                            Icons.phone_android_outlined,
                            color: Myisellcolors.hoved,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Obx(
                        () => IsellTextField(
                          maxlines: 1,
                          fontsizehinttext: 14.5,
                          validater: (vale) {
                            return validInput(vale!, 8, 50, "password");
                          },
                          hinttxt: "Skriv inn ditt passord",
                          hinttxtcolor: Myisellcolors.hvit70,
                          contentpadding:
                              const EdgeInsets.fromLTRB(25, 23, 25, 23),
                          txtcolor: Myisellcolors.hvit,
                          txttype: TextInputType.visiblePassword,
                          con: controller.passordController,
                          onSav: (value) {
                            controller.passord = value!;
                          },
                          paddingcontainer:
                              const EdgeInsets.only(left: 20, right: 20),
                          cursorColor: Colors.grey,
                          height: 20,
                          width: 1,
                          borderR: 15,
                          borderwidth: 1,
                          bordersidecolor: Myisellcolors.hoved,
                          obs: controller.erPassordgjemt2.value,
                          alignment: const Alignment(0, -0.2),
                          label: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 7),
                            child: Text(
                              'Passord',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.mandali(
                                  color: Myisellcolors.hoved, fontSize: 19),
                            ),
                          ),
                          float: FloatingLabelBehavior.always,
                          icon: Container(
                            padding: const EdgeInsets.only(right: 7),
                            child: InkWell(
                              child: Icon(
                                controller.erPassordgjemt2.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Myisellcolors.hoved,
                              ),
                              onTap: () {
                                controller.erPassordgjemt2.value =
                                    !controller.erPassordgjemt2.value;
                              },
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Obx(
                        () => IsellTextField(
                          maxlines: 1,
                          cursorColor: Colors.grey,
                          height: 20,
                          width: 1,
                          validater: (val) {
                            if (controller.passordController.value !=
                                controller.bekreftregistreringpassordController
                                    .value) {
                              return "Passordene må være like";
                            } else {
                              return validInput(val!, 8, 50, "password");
                            }
                          },
                          paddingcontainer:
                              const EdgeInsets.only(left: 20, right: 20),
                          fontsizehinttext: 14.5,
                          hinttxt: "Gjenta passordet",
                          hinttxtcolor: Myisellcolors.hvit70,
                          contentpadding:
                              const EdgeInsets.fromLTRB(25, 23, 25, 23),
                          txtcolor: Myisellcolors.hvit,
                          txttype: TextInputType.visiblePassword,
                          onSav: (value) {
                            controller.bekreftregistrerpassord = value!;
                          },
                          con: controller.bekreftregistreringpassordController,
                          borderR: 15,
                          borderwidth: 1,
                          bordersidecolor: Myisellcolors.hoved,
                          obs: controller.erPassordgjemt1.value,
                          alignment: const Alignment(0, -0.2),
                          label: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 7),
                            child: Text(
                              'Bekreft passord',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.mandali(
                                  color: Myisellcolors.hoved, fontSize: 19),
                            ),
                          ),
                          float: FloatingLabelBehavior.always,
                          icon: Container(
                            padding: const EdgeInsets.only(right: 7),
                            child: InkWell(
                              child: Icon(
                                controller.erPassordgjemt1.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Myisellcolors.hoved,
                              ),
                              onTap: () {
                                controller.erPassordgjemt1.value =
                                    !controller.erPassordgjemt1.value;
                              },
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      IsellButtons(
                          size: Size(Get.width / 1.1, 65),
                          name: "Fortsett",
                          onPresset: () {
                            controller.gotosjekkemail();
                          },
                          alignmen: Alignment.center,
                          borderradius: 15,
                          fontsize: 18,
                          bgcolor: Myisellcolors.hoved),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Er du allerede registrert? ',
                            style: GoogleFonts.poppins(
                                fontSize: 13, color: Myisellcolors.hvit70),
                          ),
                          InkWell(
                            onTap: () {
                              controller.gotologginn();
                            },
                            child: Text(
                              'Logg Inn',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Myisellcolors.hoved),
                            ),
                          ),
                        ],
                      ),
                      const Expanded(flex: 6, child: SizedBox()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
