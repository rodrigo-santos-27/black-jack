import 'package:flutter/material.dart';

class App {
  static final App _instance = App._internal();

  factory App() {
    return _instance;
  }

  App._internal();

  String initRoute = EndPoints.home;
  AppColors colors = AppColors();
  AssetsPath assetsPath = AssetsPath();
  Urls urls = Urls();
  Labels labels = Labels();
}

class AppColors {
  static final AppColors _instance = AppColors._internal();

  factory AppColors() {
    return _instance;
  }
  AppColors._internal();

  Color primaryColorApp = const Color.fromRGBO(1, 2, 3, 1);
  Color secondaryColorApp = const Color.fromRGBO(230, 230, 230, 1);
  Color loadingBarColorApp = const Color.fromRGBO(82, 255, 0, 1);
}

class Labels {
  static final Labels _instance = Labels._internal();

  factory Labels() {
    return _instance;
  }

  Labels._internal();

  String loading = 'Carregando...';
  String appName = "Black Jack";
}

class AssetsPath {
  static final AssetsPath _instance = AssetsPath._internal();

  factory AssetsPath() {
    return _instance;
  }

  AssetsPath._internal();

  String logo = 'assets/logo.png';
  String splashScreen = 'assets/splash-screen.png';
  String lineHeader = 'assets/line-header.png';
  String homeScreen = 'assets/home-screen.png';
  String homeScreenWood = 'assets/home-screen-wood.png';
  String homeScreenBlack = 'assets/home-screen-black.png';
  String homeScreenFive = 'assets/home-five.png';
  String homeScreenTen = 'assets/home-ten.png';
  String homeScreenTwoFive = 'assets/home-two-five.png';
  String homeScreenFiveZero = 'assets/home-five-zero.png';
  String homeScreenOneZeroZero = 'assets/home-one-zero-zero.png';
  String homeScreenTwoZeroZero = 'assets/home-two-zero-zero.png';
  String homeScreenMoney = 'assets/home-money.png';
  String homeScreenSettings = 'assets/home-settings.png';
  String homeScreenConvite = 'assets/home-convite.png';
  String homeScreenDeck = 'assets/home-deck.png';
  String homeScreenDeckAux = 'assets/home-deck-aux.png';
}

class Urls {
  static final Urls _instance = Urls._internal();

  factory Urls() {
    return _instance;
  }

  Urls._internal();

  // static String phoneNumber = "+5535997087641";
  // static String message =
  //     'João 14:6: "Jesus disse-lhe: Eu sou o caminho, e a verdade, e a vida; ninguém vem ao Pai, senão por mim."';

  // Uri facebook =
  //     Uri.parse('https://www.facebook.com/ADJesusdeNazare?mibextid=ZbWKwL');

  // Uri instagram = Uri.parse(
  //     'https://instagram.com/ad.jesusdenazare?utm_source=qr&igshid=MzNlNGNkZWQ4Mg==');

  // Uri whatapp = Uri.parse(
  //     'https://web.whatsapp.com/send?phone=$phoneNumber&text=$message');
}

class EndPoints {
  static final EndPoints _instance = EndPoints._internal();

  factory EndPoints() {
    return _instance;
  }

  EndPoints._internal();

  static const splashScreen = '/';
  static const home = '/home';
}
