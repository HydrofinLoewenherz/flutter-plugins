/*
 * Copyright 2019 Copenhagen Center for Health Technology (CACHET) at the
 * Technical University of Denmark (DTU).
 * Use of this source code is governed by a MIT-style license that can be
 * found in the LICENSE file.
 */

part of esense;

enum AccLowPass {
  BW_460,
  BW_184,
  BW_92,
  BW_41,
  BW_20,
  BW_10,
  BW_5,
  DISABLED,
}

enum GyroLowPass {
  BW_250,
  BW_184,
  BW_92,
  BW_41,
  BW_20,
  BW_10,
  BW_5,
  BW_3600,
  DISABLED
}

enum AccRange { G_2, G_4, G_8, G_16 }

extension AccSensitivityFactorExtension on AccRange {
  double get sensitivityFactor {
    switch (this) {
      case AccRange.G_2:
        return 16384;
      case AccRange.G_4:
        return 8192;
      case AccRange.G_8:
        return 4096;
      case AccRange.G_16:
        return 2048;
    }
  }
}

enum GyroRange { DEG_250, DEG_500, DEG_1000, DEG_2000 }

extension GyroSensitivityFactorExtension on GyroRange {
  double get sensitivityFactor {
    switch (this) {
      case GyroRange.DEG_250:
        return 131;
      case GyroRange.DEG_500:
        return 65.5;
      case GyroRange.DEG_1000:
        return 32.8;
      case GyroRange.DEG_2000:
        return 16.4;
    }
  }
}

class ESenseConfig {
  AccLowPass? accLowPass;
  GyroLowPass? gyroLowPass;
  AccRange? accRange;
  GyroRange? gyroRange;

  Map<String, dynamic> toMap() {
    // still not implemented
    return {};
  }

  ESenseConfig();
  factory ESenseConfig.fromMap(Map<dynamic, dynamic> map) {
    return ESenseConfig()
      ..accLowPass =
          AccLowPass.values.firstWhere((e) => e.name == map['accLowPass'])
      ..gyroLowPass =
          GyroLowPass.values.firstWhere((e) => e.name == map['gyroLowPass'])
      ..accRange = AccRange.values.firstWhere((e) => e.name == map['accRange'])
      ..gyroRange =
          GyroRange.values.firstWhere((e) => e.name == map['gyroRange']);
  }

  @override
  String toString() =>
      'accLowPass: $accLowPass, gyroLowPass: $gyroLowPass, accRange: $accRange, gyroRange: $gyroRange';
}
