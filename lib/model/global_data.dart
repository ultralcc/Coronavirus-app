import 'package:json_annotation/json_annotation.dart';

part 'global_data.g.dart';

@JsonSerializable(nullable: true)
class GlobalData {
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

  GlobalData(this.newConfirmed, this.totalConfirmed, this.newDeaths,
      this.totalDeaths, this.newRecovered, this.totalRecovered);

  factory GlobalData.fromJson(Map<String, dynamic> json) =>
      _$GlobalDataFromJson(json);
  Map<String, dynamic> toJson() => _$GlobalDataToJson(this);
}
