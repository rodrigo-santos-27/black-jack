import 'package:app/model/chip_data.dart';
import 'package:app/utils/app.dart';

class StaticChipData {
  static App app = App();

  static List<ChipData> chips = [
    ChipData(
        name: 'five',
        topFactor: 0.58,
        sideLeftFactor: 0.05,
        sideRightFactor: 0,
        offSetHeight: 0.075,
        offSetWidth: 0.075,
        offSetGlow: 0.01,
        glow: app.colors.chipFive,
        imagePath: app.assetsPath.homeScreenFive,
        chipPath: app.assetsPath.five,
        value: 5),
    ChipData(
        name: 'ten',
        topFactor: 0.64,
        sideLeftFactor: 0.15,
        sideRightFactor: 0,
        offSetHeight: 0.075,
        offSetWidth: 0.075,
        offSetGlow: 0.01,
        glow: app.colors.chipTen,
        imagePath: app.assetsPath.homeScreenTen,
        chipPath: app.assetsPath.ten,
        value: 10),
    ChipData(
        name: 'twentyFive',
        topFactor: 0.685,
        sideLeftFactor: 0.25,
        sideRightFactor: 0,
        offSetHeight: 0.075,
        offSetWidth: 0.075,
        offSetGlow: 0.01,
        glow: app.colors.chipTwentyFive,
        imagePath: app.assetsPath.homeScreenTwentyFive,
        chipPath: app.assetsPath.twentyFive,
        value: 25),
    ChipData(
        name: 'fifty',
        topFactor: 0.685,
        sideLeftFactor: 0,
        sideRightFactor: 0.25,
        offSetHeight: 0.075,
        offSetWidth: 0.075,
        offSetGlow: 0.01,
        glow: app.colors.chipFifty,
        imagePath: app.assetsPath.homeScreenFifty,
        chipPath: app.assetsPath.fifty,
        value: 50),
    ChipData(
        name: 'oneHundred',
        topFactor: 0.64,
        sideLeftFactor: 0,
        sideRightFactor: 0.15,
        offSetHeight: 0.075,
        offSetWidth: 0.075,
        offSetGlow: 0.01,
        glow: app.colors.chipOneHundred,
        imagePath: app.assetsPath.homeScreenOnehundred,
        chipPath: app.assetsPath.onehundred,
        value: 100),
    ChipData(
        name: 'twoHundred',
        topFactor: 0.58,
        sideLeftFactor: 0,
        sideRightFactor: 0.05,
        offSetHeight: 0.075,
        offSetWidth: 0.075,
        offSetGlow: 0.01,
        glow: app.colors.chipTwoHundred,
        imagePath: app.assetsPath.homeScreenTwoHundred,
        chipPath: app.assetsPath.twoHundred,
        value: 200)
  ];
}
