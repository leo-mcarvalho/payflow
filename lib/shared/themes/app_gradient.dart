import 'dart:math';
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppGradients {
  static final linear = LinearGradient(colors: [
    Color.fromRGBO(255, 255, 255, 255),
    AppColors.primary,
  ], stops: [
    0.0,
    0.695
  ], transform: GradientRotation(2.13959913 * pi));
}
