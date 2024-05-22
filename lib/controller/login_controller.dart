import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_isell_new/core/constants/sellx_route_names.dart';
import 'package:get/get.dart';

import '../core/classes/statusrequest.dart';
import '../core/functions/handling_data.dart';
import '../core/services/services.dart';
import '../data/static/remote/auth/email_verify_code.dart';
import '../data/static/remote/auth/login.dart';
import '../data/static/remote/auth/user_registration.dart';
import '../data/static/remote/forget_passord/check_email.dart';
import '../data/static/remote/forget_passord/forget_password_verify_code.dart';
import '../data/static/remote/forget_passord/reset_pasword.dart';

abstract class InnloggingController extends GetxController {
  gotologginn();
  gotoregistrer();
  gotoforgetpassord();
  gotobekreftkoden();
  gototilbakestillpassord(String verificationcodeforgetpassord);
  gotosuksesstilbakestiltpassord();
  gotosjekkemail();
  // gotooppfyllreg(String verificationCode);
  // gotosjekktelefon();
  gotosuksessregistrert(String verificationCode);
  logginn();
  reSend();
}

class InnloggingControllerImp extends InnloggingController {
  GlobalKey<FormState> gklogginn = GlobalKey<FormState>();
  GlobalKey<FormState> gksjekkemailforgetpassord = GlobalKey<FormState>();

  GlobalKey<FormState> gkverifycodeglemtpassord = GlobalKey<FormState>();
  GlobalKey<FormState> gkbekreftemailadresse = GlobalKey<FormState>();
  GlobalKey<FormState> gkbekreftregistrertemail = GlobalKey<FormState>();
  GlobalKey<FormState> gktilbakestillpass = GlobalKey<FormState>();
  GlobalKey<FormState> gksjekkemailbare = GlobalKey<FormState>();

  var erPassordgjemt = true.obs;
  var erPassordgjemt1 = true.obs;
  var erPassordgjemt2 = true.obs;
  var erPassordgjemt3 = true.obs;
  var erPassordgjemt4 = true.obs;

  late TextEditingController emailController;
  late TextEditingController passordController;
  late TextEditingController bekreftregistreringpassordController;

  late TextEditingController usernameController;
  late TextEditingController lastnameController;
  late TextEditingController numberController;

  late TextEditingController emaillogginnController;
  late TextEditingController passordlogginnController;

  late TextEditingController sjkkemailController;

  late TextEditingController tilbakestillpassordController;
  late TextEditingController bekrefttilbakestiltpasoordetController;

  late String bekreftelseskode;

  StatusRequest? statusRequest = StatusRequest.none;

  List data = [];

  var email = "".obs;
  var passord = "".obs;
  var bekreftregistrerpassord = "".obs;

  var username = "".obs;
  var lastname = "".obs;
  var number = "".obs;

  var emailloggin = "".obs;
  var passordlogginn = "".obs;

  var tilbakestillpassord = "".obs;
  var bekrefttilbakestiltpasoordet = "".obs;

  var sjkkemail = "".obs;

  RegistrerData registrerData = RegistrerData(Get.find());

  EmailVerifyCode emailVerifyCode = EmailVerifyCode(Get.find());

  LogginnData logginnData = LogginnData(Get.find());

  SjekkEmailForgetpassordData sjekkEmailForgetpassordData =
      SjekkEmailForgetpassordData(Get.find());

  VerifycodeForgetpassordData verifycodeForgetpassordData =
      VerifycodeForgetpassordData(Get.find());

  ResetpassordData resetpassordData = ResetpassordData(Get.find());

  MyServices myServices = Get.find();

  //HomeData homeData = HomeData(Get.find());
  RxString userimage = RxString("");

  @override
  logginn() async {
    var formdata = gklogginn.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await logginnData.postdata(
          emaillogginnController.text, passordlogginnController.text);
      statusRequest = handlingData(response);
      if (StatusRequest.suksess == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['user_approve'] == 1) {
            myServices.sharedPreferences
                .setInt("id", response['data']['user_id']);
            int userid = myServices.sharedPreferences.getInt("id")!;
            myServices.sharedPreferences
                .setString("userfname", response['data']['user_fname']);
            myServices.sharedPreferences
                .setInt("userphone", response['data']['user_phone']);
            myServices.sharedPreferences
                .setString("useremail", response['data']['user_email']);
            myServices.sharedPreferences
                .setString("userimage", response['data']['user_image']);
            myServices.sharedPreferences
                .setString("usercreate", response['data']['user_create']);
            userimage.value = response['data']['user_image'];
            myServices.sharedPreferences.setString("step", "2");
            FirebaseMessaging.instance.subscribeToTopic("users");
            // FirebaseMessaging.instance.subscribeToTopic("users $userid");
            Get.offNamed(AppRouter.homepage);
          } else {
            Get.toNamed(AppRouter.sjekkemailbare,
                arguments: {"useremail": emailController.text});
          }
        } else {
          Get.defaultDialog(
              titlePadding: const EdgeInsets.all(15),
              contentPadding: const EdgeInsets.all(25),
              backgroundColor: Colors.grey,
              title: "Opps!",
              middleText: "Epostadresse Eller Passord Er Ikke Riktig!");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      return;
    }
  }

  @override
  gotosuksessregistrert(String verificationCode) async {
    var formdata = gksjekkemailbare.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await emailVerifyCode.postdata(
          emailController.text, verificationCode);
      statusRequest = handlingData(response);
      if (StatusRequest.suksess == statusRequest) {
        if (response['status'] == "success") {
          Get.toNamed(AppRouter.suksessregistrert);
        } else {
          Get.defaultDialog(
              titlePadding: const EdgeInsets.all(15),
              contentPadding: const EdgeInsets.all(25),
              backgroundColor: Colors.grey,
              title: "Opps!",
              middleText: "Bekreftelseskoden Er Ikke Riktig!");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      return;
    }
  }

  // @override
  // gotosjekktelefon() async {
  //   var formdata = gksjekktelefonbare.currentState;
  //   if (formdata!.validate()) {
  //     statusRequest = StatusRequest.loading;
  //     update();
  //     var response = await registrerTelefon.posttelfondatadata(
  //         usernameController.text,
  //         lastnameController.text,
  //         numberController.text);
  //     statusRequest = handlingData(response);
  //     if (StatusRequest.suksess == statusRequest) {
  //       if (response['status'] == "success") {
  //         Get.toNamed(AppRouter.sjekktelefonbare);
  //       } else {
  //         Get.defaultDialog(
  //             title: "Opps!",
  //             middleText: "Dette Telefonnummeret Er Allerede Registrert!");
  //         statusRequest = StatusRequest.failure;
  //       }
  //     }
  //     update();
  //   } else {
  //     return;
  //   }
  // }

  // @override
  // gotooppfyllreg(String verificationCode) async {
  //   var formdata = gksjekkemailbare.currentState;
  //   if (formdata!.validate()) {
  //     statusRequest = StatusRequest.loading;
  //     update();
  //     var response = await emailVerifyCode.postdata(
  //         emailController.text, verificationCode);
  //     statusRequest = handlingData(response);
  //     if (StatusRequest.suksess == statusRequest) {
  //       if (response['status'] == "success") {
  //         Get.offAndToNamed(AppRouter.oppfyllregistrering);
  //       } else {
  //         Get.defaultDialog(
  //             title: "Opps!", middleText: "Bekreftelseskoden Er Ikke Riktig!");
  //         statusRequest = StatusRequest.failure;
  //       }
  //     }
  //     update();
  //   } else {
  //     return;
  //   }
  // }

  @override
  gotosjekkemail() async {
    var formdata = gkbekreftregistrertemail.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await registrerData.postdata(
          usernameController.text,
          numberController.text,
          emailController.text,
          passordController.text,
          bekreftregistreringpassordController.text);
      statusRequest = handlingData(response);
      if (StatusRequest.suksess == statusRequest) {
        if (response['status'] == "success") {
          Get.toNamed(AppRouter.sjekkemailbare,
              arguments: {"useremail": emailController.text});
        } else {
          Get.defaultDialog(
              titlePadding: const EdgeInsets.all(15),
              contentPadding: const EdgeInsets.all(25),
              backgroundColor: Colors.grey,
              title: "Opps!",
              middleText:
                  "Epostadressen eller telefonen er allrede registrert");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      return;
    }
  }

  @override
  gotosuksesstilbakestiltpassord() async {
    if (tilbakestillpassordController.text !=
        bekrefttilbakestiltpasoordetController.text) {
      return Get.defaultDialog(
          titlePadding: const EdgeInsets.all(15),
          contentPadding: const EdgeInsets.all(25),
          backgroundColor: Colors.grey,
          title: "Opps!",
          middleText: "Passordene må være like!");
    }
    var formdata = gktilbakestillpass.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetpassordData.postdata(
          tilbakestillpassordController.text,
          bekrefttilbakestiltpasoordetController.text,
          sjkkemailController.text);
      statusRequest = handlingData(response);
      if (StatusRequest.suksess == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRouter.suksesstilbakestiltpassord);
        } else {
          Get.defaultDialog(
              titlePadding: const EdgeInsets.all(15),
              contentPadding: const EdgeInsets.all(25),
              backgroundColor: Colors.grey,
              title: "Opps!",
              middleText:
                  "Du Må Velge Et Nytt Passord, Ikke Bruk Det Gamle Passordet");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      return;
    }
  }

  @override
  gototilbakestillpassord(String verificationcodeforgetpassord) async {
    var formdata = gkverifycodeglemtpassord.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await verifycodeForgetpassordData.postdata(
          verificationcodeforgetpassord, sjkkemailController.text);
      statusRequest = handlingData(response);
      if (StatusRequest.suksess == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRouter.tilbakestillPassord);
        } else {
          Get.defaultDialog(
              titlePadding: const EdgeInsets.all(15),
              contentPadding: const EdgeInsets.all(25),
              backgroundColor: Colors.grey,
              title: "Opps!",
              middleText: "Bekreftelseskoden Er Ikke Riktig!");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  gotobekreftkoden() async {
    var formdata = gksjekkemailforgetpassord.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await sjekkEmailForgetpassordData.postdata(sjkkemailController.text);
      statusRequest = handlingData(response);
      if (StatusRequest.suksess == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRouter.bekreftKode);
        } else {
          Get.defaultDialog(
              titlePadding: const EdgeInsets.all(15),
              contentPadding: const EdgeInsets.all(25),
              backgroundColor: Colors.grey,
              title: "Opps!",
              middleText: "Denne Epostadressen Eksistrer Ikke!");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      return;
    }
  }

  @override
  gotologginn() {
    Get.toNamed(AppRouter.loginnpage);
  }

  @override
  gotoregistrer() {
    Get.toNamed(AppRouter.registrering);
  }

  @override
  gotoforgetpassord() async {
    Get.offNamed(AppRouter.passordglemt);
  }

  @override
  void onInit() {
    tilbakestillpassordController = TextEditingController();
    bekrefttilbakestiltpasoordetController = TextEditingController();

    sjkkemailController = TextEditingController();

    emaillogginnController = TextEditingController();
    passordlogginnController = TextEditingController();

    usernameController = TextEditingController();
    lastnameController = TextEditingController();
    numberController = TextEditingController();

    emailController = TextEditingController();
    passordController = TextEditingController();
    bekreftregistreringpassordController = TextEditingController();
    // FirebaseMessaging.instance.getToken().then((value) {
    //   print("den er $value");
    //   // ignore: unused_local_variable
    //   String? token = value;
    // });
    super.onInit();
  }

  @override
  void dispose() {
    tilbakestillpassordController.dispose();
    bekrefttilbakestiltpasoordetController.dispose();

    sjkkemailController.dispose();

    emaillogginnController.dispose();
    passordlogginnController.dispose();

    emailController.dispose();
    passordController.dispose();
    bekreftregistreringpassordController.dispose();

    numberController.dispose();
    usernameController.dispose();
    lastnameController.dispose();
    super.dispose();
  }

  bool resendTapped = false;
  bool isSendAgainClicked = false;
  @override
  reSend() {
    emailVerifyCode.resendData(emaillogginnController.text.isNotEmpty
        ? emaillogginnController.text
        : emailController.text);
    resendTapped = true;

    update();
  }
}
