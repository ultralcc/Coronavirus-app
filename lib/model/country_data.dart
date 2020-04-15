import 'package:json_annotation/json_annotation.dart';

part 'country_data.g.dart';

@JsonSerializable(nullable: true)
class CountryData {
  @JsonKey(name: 'Country')
  String name;
  @JsonKey(name: 'CountryCode')
  String code;
  @JsonKey(name: 'Slug')
  String slug;
  @JsonKey(name: 'NewConfirmed')
  int newConfirmed;
  @JsonKey(name: 'TotalConfirmed')
  int totalConfirmed;
  @JsonKey(name: 'NewDeaths')
  int newDeaths;
  @JsonKey(name: 'TotalDeaths')
  int totalDeaths;
  @JsonKey(name: 'NewRecovered')
  int newRecovered;
  @JsonKey(name: 'TotalRecovered')
  int totalRecovered;
  @JsonKey(name: 'Date')
  DateTime date;

  CountryData(
      this.name,
      this.code,
      this.slug,
      this.newConfirmed,
      this.totalConfirmed,
      this.newDeaths,
      this.totalDeaths,
      this.newRecovered,
      this.totalRecovered,
      this.date);

  factory CountryData.fromJson(Map<String, dynamic> json) =>
      _$CountryDataFromJson(json);
  Map<String, dynamic> toJson() => _$CountryDataToJson(this);
}
