// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryData _$CountryDataFromJson(Map<String, dynamic> json) {
  return CountryData(
    json['Country'] as String,
    json['CountryCode'] as String,
    json['Slug'] as String,
    json['NewConfirmed'] as int,
    json['TotalConfirmed'] as int,
    json['NewDeaths'] as int,
    json['TotalDeaths'] as int,
    json['NewRecovered'] as int,
    json['TotalRecovered'] as int,
    json['Date'] == null ? null : DateTime.parse(json['Date'] as String),
  );
}

Map<String, dynamic> _$CountryDataToJson(CountryData instance) =>
    <String, dynamic>{
      'Country': instance.name,
      'CountryCode': instance.code,
      'Slug': instance.slug,
      'NewConfirmed': instance.newConfirmed,
      'TotalConfirmed': instance.totalConfirmed,
      'NewDeaths': instance.newDeaths,
      'TotalDeaths': instance.totalDeaths,
      'NewRecovered': instance.newRecovered,
      'TotalRecovered': instance.totalRecovered,
      'Date': instance.date?.toIso8601String(),
    };
