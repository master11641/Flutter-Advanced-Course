import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/features/advers/domain/entities/adver_entity.dart';
import 'package:flutter_advanced_course/features/feature_weather/domain/entities/current_city_entity.dart';

@immutable
abstract class AdverStatus {}

class AdverInit extends AdverStatus {}

class AdverCompleted extends AdverStatus {
  final AdverEntity adverEntity;
  AdverCompleted(this.adverEntity);
}
class AdverFilter extends AdverStatus {
  final AdverEntity adverEntity;
  AdverFilter(this.adverEntity);
}
class AdverError extends AdverStatus {
  final String message;
  AdverError(this.message);
}
