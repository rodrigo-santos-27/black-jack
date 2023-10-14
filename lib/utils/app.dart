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

  Color chipFive = const Color.fromRGBO(33, 113, 235, 1);
  Color chipTen = const Color.fromRGBO(255, 96, 185, 1);
  Color chipTwentyFive = const Color.fromRGBO(13, 155, 194, 1);
  Color chipFifty = const Color.fromRGBO(255, 47, 82, 1);
  Color chipOneHundred = const Color.fromRGBO(155, 44, 237, 1);
  Color chipTwoHundred = const Color.fromRGBO(214, 24, 63, 1);
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
  String five = 'assets/five.png';
  String ten = 'assets/ten.png';
  String twentyFive = 'assets/twenty-five.png';
  String fifty = 'assets/fifty.png';
  String onehundred = 'assets/one-hundred.png';
  String twoHundred = 'assets/two-hundred.png';
  String clearUp = 'assets/clear-up.png';
  String clearDown = 'assets/clear-down.png';
  String dealUp = 'assets/deal-up.png';
  String dealDown = 'assets/deal-down.png';
  String homeScreen = 'assets/home-screen.png';
  String homeScreenWood = 'assets/home-screen-wood.png';
  String homeScreenBlack = 'assets/home-screen-black.png';
  String homeScreenFive = 'assets/home-five.png';
  String homeScreenTen = 'assets/home-ten.png';
  String homeScreenTwentyFive = 'assets/home-twenty-five.png';
  String homeScreenFifty = 'assets/home-fifty.png';
  String homeScreenOnehundred = 'assets/home-one-hundred.png';
  String homeScreenTwoHundred = 'assets/home-two-hundred.png';
  String homeScreenMoney = 'assets/home-money.png';
  String homeScreenSettings = 'assets/home-settings.png';
  String homeScreenInvite = 'assets/home-invite.png';
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
