import 'package:flutter/material.dart';

class App {
  static final App _instance = App._internal();

  factory App() {
    return _instance;
  }

  App._internal();

  String initRoute = EndPoints.splashScreen;
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
  // String home = 'assets/home.png';
  // String face = 'assets/face.png';
  // String faceHover = 'assets/face_hover.png';
  // String insta = 'assets/insta.png';
  // String instaHover = 'assets/insta_hover.png';
  // String what = 'assets/what.png';
  // String whatHover = 'assets/what_hover.png';
  // String privacy = 'assets/privacy_policy.png';
  // String service = 'assets/service_policy.png';
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
