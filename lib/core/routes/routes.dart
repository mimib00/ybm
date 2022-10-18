import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:ybm/core/controllers/bindings.dart';
import 'package:ybm/views/auth/company_profile.dart';
import 'package:ybm/views/auth/faq.dart';
import 'package:ybm/views/auth/login.dart';
import 'package:ybm/views/auth/phone_auth.dart';
import 'package:ybm/views/auth/plans.dart';
import 'package:ybm/views/auth/register.dart';
import 'package:ybm/views/auth/terms.dart';
import 'package:ybm/views/auth/thanks_screen.dart';
import 'package:ybm/views/events/event_tickets.dart';
import 'package:ybm/views/offers/create_offer.dart';
import 'package:ybm/views/root/root.dart';
import 'package:ybm/views/setup/filters.dart';
import 'package:ybm/views/setup/topics.dart';
import 'package:ybm/views/splash/splash.dart';

class Routes {
  static const root = "/";
  static const splash = "/splash";
  static const login = "/login";
  static const otp = "/login/otp";
  static const plans = "/login/plans";
  static const faq = "/login/faq";
  static const terms = "/terms";
  static const thanks = "/thanks";
  static const register = "/register";
  static const company = "/register/company";
  static const forgetPassword = "/forget_password";
  static const topics = "/topics";
  static const filters = "/filters";
  static const offersAdd = "/offers_add";
  static const eventTicket = "/eventTicket";

  static List<GetPage> allRoutes = [
    GetPage(name: root, page: () => const RootScreen(), binding: NavigationBinding()),
    GetPage(name: splash, page: () => const SplashScreen(), binding: SplashBinding()),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: otp, page: () => const PhoneAuth()),
    GetPage(name: plans, page: () => const PlansScreen()),
    GetPage(name: faq, page: () => const FAQScren()),
    GetPage(name: terms, page: () => const TermsScreen()),
    GetPage(name: thanks, page: () => const ThanksScreen()),
    GetPage(name: register, page: () => const RegisterScreen()),
    GetPage(name: company, page: () => const CompanyProfile()),
    GetPage(name: forgetPassword, page: () => const Scaffold()),
    GetPage(name: topics, page: () => const TopicsScreen(), binding: SetupBinding()),
    GetPage(name: filters, page: () => const FiltersScreen()),
    GetPage(name: offersAdd, page: () => const CreateOfferScreen()),
    GetPage(name: eventTicket, page: () => const EventTickets()),
  ];
}
