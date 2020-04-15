// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GlobalData _$GlobalDataFromJson(Map<String, dynamic> json) {
  return GlobalData(
    json['NewConfirmed'] as int,
    json['TotalConfirmed'] as int,
    json['NewDeaths'] as int,
    json['TotalDeaths'] as int,
    json['NewRecovered'] as int,
    json['TotalRecovered'] as int,
  );
}

Map<String, dynamic> _$GlobalDataToJson(GlobalData instance) =>
    <String, dynamic>{
      'NewConfirmed': instance.newConfirmed,
      'TotalConfirmed': instance.totalConfirmed,
      'NewDeaths': instance.newDeaths,
      'TotalDeaths': instance.totalDeaths,
      'NewRecovered': instance.newRecovered,
      'TotalRecovered': instance.totalRecovered,
    };
