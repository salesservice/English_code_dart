import 'package:flutter_isell_new/controller/home_page_controller.dart';

String? validInput(String val, int min, int max, String type) {
  final RegExp invalidChars = RegExp(r'[0-9!@#$%^&*(),.?":{}|<>]');
  final RegExp onlyFirstName = RegExp(r'^[a-zA-Z]+$');
  final RegExp startsWithCapital = RegExp(r'^[A-Z]');

  if (val.isEmpty) {
    return "Feltet Må Fylles!";
  }

  if (type == "username") {
    if (invalidChars.hasMatch(val)) {
      return "Navnet inneholder tall eller ugyldige tegn";
    } else if (onlyFirstName.hasMatch(val)) {
      return "Skriv hele navnet";
    } else if (!startsWithCapital.hasMatch(val.split(' ')[0]) ||
        !startsWithCapital.hasMatch(val.split(' ')[1])) {
      return "Både fornavn og etternavn må starte med store bokstaver";
    }
  }
  if (type == "email") {
    val = val.trim(); // Remove leading and trailing spaces
    if (!RegExp(
            r"^[ÆØÅæøåA-Za-z0-9._%+-]+@(?:[ÆØÅæøåA-Za-z0-9-]+\.)+[A-Za-z]{2,6}$")
        .hasMatch(val)) {
      return "Ugyldig epostadresse!";
    }
  }
  if (type == "phone") {
    if (!RegExp(r"[0-9]").hasMatch(val) || RegExp(r"[A-å]").hasMatch(val)) {
      return "Ugyldig telefon nummer!";
    }
  }
  if (type == "password") {
    if (val.length < 8) {
      return "Passordet må være minst 8 tegn langt";
    }
    if (!RegExp(r'[A-Z]').hasMatch(val)) {
      return "Passordet må inneholde minst én stor bokstav";
    }
    if (!RegExp(r'[0-9]').hasMatch(val)) {
      return "Passordet må inneholde minst én tall";
    }
  }

  if (val.length < min) {
    return "Minst $min tegn";
  }
  if (val.length > max) {
    return "Kan ikke være mer enn $max tegn";
  }

  return null;
}

String? validCoupon(String val) {
  if (val == HomePageControllerImp().couponModel!.couponName) {
    return "not valid";
  }
  return null;
}
