import 'package:flutter_isell_new/core/constants/sellx_route_names.dart';
import 'package:flutter_isell_new/core/middleware/my_middleware.dart';
import 'package:flutter_isell_new/views/address/add_%20address.dart';
import 'package:flutter_isell_new/views/address/view_%20address.dart';
import 'package:flutter_isell_new/views/address/write_%20address.dart';
import 'package:flutter_isell_new/views/screens/add_items_details/choose_item_category.dart';
import 'package:flutter_isell_new/views/screens/add_items_details/edit_items_details.dart';
import 'package:flutter_isell_new/views/screens/add_items_details/item_category/bicycles.dart';
import 'package:flutter_isell_new/views/screens/add_items_details/item_category/boats.dart';
import 'package:flutter_isell_new/views/screens/add_items_details/item_category/books.dart';
import 'package:flutter_isell_new/views/screens/add_items_details/item_category/cars.dart';
import 'package:flutter_isell_new/views/screens/add_items_details/item_category/clothes.dart';
import 'package:flutter_isell_new/views/screens/add_items_details/item_category/electronics.dart';
import 'package:flutter_isell_new/views/screens/add_items_details/item_category/furniture.dart';
import 'package:flutter_isell_new/views/screens/add_items_details/item_category/jobs.dart';
import 'package:flutter_isell_new/views/screens/add_items_details/item_category/motorcycles.dart';
import 'package:flutter_isell_new/views/screens/add_items_details/item_category/property.dart';
import 'package:flutter_isell_new/views/screens/add_items_details/item_category/sellx.dart';
import 'package:flutter_isell_new/views/screens/category_pages/property/property.dart';
import 'package:flutter_isell_new/views/screens/category_pages/sellx/sellx.dart';
import 'package:flutter_isell_new/views/screens/drawer_pages/about_sellx.dart';
import 'package:flutter_isell_new/views/screens/drawer_pages/contact_us.dart';
import 'package:flutter_isell_new/views/screens/drawer_pages/favorites.dart';
import 'package:flutter_isell_new/views/screens/drawer_pages/log_out.dart';
import 'package:flutter_isell_new/views/screens/drawer_pages/notifications.dart';
import 'package:flutter_isell_new/views/screens/drawer_pages/payment.dart';
import 'package:flutter_isell_new/views/screens/drawer_pages/privacy_statement.dart';
import 'package:flutter_isell_new/views/screens/drawer_pages/ratings.dart';
import 'package:flutter_isell_new/views/screens/drawer_pages/settings.dart';
import 'package:flutter_isell_new/views/screens/drawer_pages/terms_and_conditions.dart';
import 'package:flutter_isell_new/views/screens/home/go_to_pay.dart';
import 'package:flutter_isell_new/views/screens/home/navbar.dart';
import 'package:flutter_isell_new/views/screens/items/bicycles_items/bicycle_details_page.dart';
import 'package:flutter_isell_new/views/screens/items/boat_items/boat_details_page.dart';
import 'package:flutter_isell_new/views/screens/items/books_items/books_details_page.dart';
import 'package:flutter_isell_new/views/screens/items/cars_items/cars_deatails_page.dart';
import 'package:flutter_isell_new/views/screens/items/clothes_items/clothes_details_page.dart';
import 'package:flutter_isell_new/views/screens/items/electronics_items/electronics_details_page.dart';
import 'package:flutter_isell_new/views/screens/items/item_details_from_story.dart';
import 'package:flutter_isell_new/views/screens/items/jobs_items/jobs_details_page.dart';
import 'package:flutter_isell_new/views/screens/items/motorcycles_items/motorcycle_details_page.dart';
import 'package:flutter_isell_new/views/screens/items/property_items/property_details_page.dart';
import 'package:flutter_isell_new/views/screens/items/sellx_items/sellx_details_page.dart';
import 'package:get/get.dart';

import 'views/screens/forget_password/confirm_code.dart';
import 'views/screens/forget_password/forgot_password.dart';
import 'views/screens/forget_password/reset_password.dart';
import 'views/screens/forget_password/reset_password_succeeded.dart';
import 'views/screens/homeScreen.dart';
import 'views/screens/items/furniture_items/furniture_details_page.dart';
import 'views/screens/items/item_pages.dart';
import 'views/screens/login/login_screen.dart';
import 'views/screens/onboarding/choose_country_screen.dart';
import 'views/screens/onboarding/login_or_reg_screen.dart';
import 'views/screens/onboarding/onbording_screen.dart';
import 'views/screens/registration/check_email_only.dart';
import 'views/screens/registration/registration_screen.dart';
import 'views/screens/registration/registration_succeeded.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/",
      page: () => const ChooseLand(),
      middlewares: [SellxMiddleware()]),
  //GetPage(name: "/", page: () => ItemDetails()),
  GetPage(name: AppRouter.loginellerreg, page: () => const Loggellerreg()),
  GetPage(name: AppRouter.loginnpage, page: () => const Logginn()),
  GetPage(name: AppRouter.onboardingpages, page: () => const OnBoarding()),
  GetPage(name: AppRouter.registrering, page: () => const Registrering()),
  GetPage(name: AppRouter.passordglemt, page: () => const ForgotPassword()),
  GetPage(name: AppRouter.bekreftKode, page: () => const ConfirmPassword()),
  GetPage(
      name: AppRouter.tilbakestillPassord, page: () => const ResetPassword()),
  GetPage(
      name: AppRouter.suksesstilbakestiltpassord,
      page: () => const ResetPasswordSucceeded()),
  GetPage(
      name: AppRouter.suksessregistrert, page: () => const SuksessRegistrert()),
  GetPage(name: AppRouter.sjekkemailbare, page: () => const SjekkEmailBare()),
  GetPage(name: AppRouter.homepage, page: () => const HomeScreen()),
  GetPage(name: AppRouter.items, page: () => const Items()),
  GetPage(name: AppRouter.sellxhoved, page: () => const SellxHoved()),
  GetPage(name: AppRouter.eiendom, page: () => const EiendomHoved()),
  GetPage(name: AppRouter.itemdetailscar, page: () => const ItemDetailsCar()),
  GetPage(
      name: AppRouter.itemdetailsfromstory,
      page: () => const ItemDetailsFromStory()),
  GetPage(
      name: AppRouter.itemdetailseiendom,
      page: () => const ItemDetailsEiendom()),
  GetPage(
      name: AppRouter.itemdetailssellx, page: () => const ItemDetailsSellx()),
  GetPage(name: AppRouter.itemdetailsboat, page: () => const ItemDetailsBoat()),
  GetPage(name: AppRouter.itemdetailsmc, page: () => const ItemDetailsMC()),
  GetPage(
      name: AppRouter.itemdetailssykkel, page: () => const ItemDetailsSykkel()),
  GetPage(name: AppRouter.itemdetailsjobb, page: () => const ItemDetailsJobb()),
  GetPage(name: AppRouter.itemdetailsboker, page: () => const ItemDetailsBok()),
  GetPage(
      name: AppRouter.itemdetailsmobler, page: () => const ItemDetailsMobler()),
  GetPage(
      name: AppRouter.itemdetailselektronikk,
      page: () => const ItemDetailsElektronikk()),
  GetPage(name: AppRouter.itemdetailsklar, page: () => const ItemDetailsKlar()),
  GetPage(name: AppRouter.nsvbar, page: () => const NavBar()),
  GetPage(name: AppRouter.favoritter, page: () => const Favoritter()),
  GetPage(name: AppRouter.vurderinger, page: () => const Vurdering()),
  GetPage(name: AppRouter.varsler, page: () => const Varsler()),
  GetPage(name: AppRouter.betalinger, page: () => const Betaling()),
  GetPage(name: AppRouter.kontaktoss, page: () => const KontaktOss()),
  GetPage(
      name: AppRouter.vilkarogbetingelser,
      page: () => const VikarOgBetingelser()),
  GetPage(
      name: AppRouter.personvernerklaring,
      page: () => const PersonVernErklaring()),
  GetPage(name: AppRouter.instillinger, page: () => const Innstillinger()),
  GetPage(name: AppRouter.omsellx, page: () => const OmSellx()),
  GetPage(name: AppRouter.loggut, page: () => const LoggUt()),
  GetPage(name: AppRouter.addressview, page: () => const AddressView()),
  GetPage(name: AppRouter.addressadd, page: () => const AddressAdd()),
  GetPage(name: AppRouter.writeaddress, page: () => const WriteAddress()),
  GetPage(name: AppRouter.gotopay, page: () => const GoToPay()),
  GetPage(name: AppRouter.velgkategori, page: () => const ChooseCategory()),
  GetPage(name: AppRouter.editAnnonse, page: () => const EditAnnonse()),
  GetPage(name: AppRouter.sellxannonse, page: () => const SellxAnnonse()),
  GetPage(name: AppRouter.eiendomannonse, page: () => const EiendomAnnonse()),
  GetPage(name: AppRouter.bilerannonse, page: () => const BilerAnnonse()),
  GetPage(name: AppRouter.baterannonse, page: () => const BaterAnnonse()),
  GetPage(name: AppRouter.mcannonse, page: () => const McAnnonse()),
  GetPage(name: AppRouter.syklerannonse, page: () => const SykkelAnnonse()),
  GetPage(name: AppRouter.jobberannonse, page: () => const JobbAnnonse()),
  GetPage(name: AppRouter.bokerannonse, page: () => const BokerAnnonse()),
  GetPage(name: AppRouter.moblerannonse, page: () => const MoblerAnnonse()),
  GetPage(
      name: AppRouter.elektronikkannonse,
      page: () => const ElektronikkAnnonse()),
  GetPage(name: AppRouter.klarannonse, page: () => const KlarAnnonse()),
];
