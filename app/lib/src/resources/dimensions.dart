
import 'package:flutter/material.dart';

enum DimensionSize {
  dimen_0(0),
  dimen_0_14(0.14),
  dimen_1(1),
  dimen_0_5(0.5),
  dimen_1_5(1.5),
  dimen_2(2),
  dimen_3(3),
  dimen_4(4),
  dimen_6(6),
  dimen_7(7),
  dimen_8(8),
  dimen_10(10),
  dimen_11(11),
  dimen_12(12),
  dimen_14(14),
  dimen_15(15),
  dimen_16(16),
  dimen_17(17),
  dimen_18(18),
  dimen_19(19),
  dimen_20(20),
  dimen_21(21),
  dimen_22(22),
  dimen_23(23),
  dimen_24(24),
  dimen_26(26),
  dimen_28(28),
  dimen_32(32),
  dimen_33(33),
  dimen_34(34),
  dimen_36(36),
  dimen_40(40),
  dimen_42(42),
  dimen_44(44),
  dimen_45(45),
  dimen_50(50),
  dimen_55(55),
  dimen_56(56),
  dimen_60(60),
  dimen_64(64),
  dimen_70(70),
  dimen_72(72),
  dimen_80(80),
  dimen_88(88),
  dimen_95(95),
  dimen_100(100),
  dimen_183(183),
  dimen_200(200),
  dimen_205(205),
  dimen_230(230),
  dimen_320(320);

  final double size;

  const DimensionSize(this.size);
}

class ImDimensionManager {
  static double getIMDimensionSize(DimensionSize dimen) {
    return dimen.size;
  }
}

extension DimensionExtensionOnState on State {
  double getImDimension(DimensionSize dimen) =>
      ImDimensionManager.getIMDimensionSize(dimen);
}

extension DimensionExtensionOnWidget on Widget {
  double getImDimension(DimensionSize dimen) =>
      ImDimensionManager.getIMDimensionSize(dimen);
}
