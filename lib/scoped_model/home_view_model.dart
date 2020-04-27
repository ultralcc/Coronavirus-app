import 'package:coronavirus/model/country_data.dart';
import 'package:coronavirus/model/global_data.dart';
import 'package:coronavirus/scoped_model/base_model.dart';
import 'package:coronavirus/service/api_service.dart';
import 'package:coronavirus/service_locator.dart';
import 'package:coronavirus/utils/http_helper.dart';

class HomeViewModel extends BaseModel {
  APIService _apiService = locator<APIService>();

  GlobalData globalData;
  List<CountryData> countryDatas;
  List<CountryData> filteredCountryDatas;

  initModel() async {
    await fetchSummeryData();
  }

  fetchSummeryData() async {
    setState(ViewState.Busy);
    ResponseResultData response = await _apiService.getSummery();
    if (response.result) {
      var data = response.data;
      globalData = GlobalData.fromJson(data['Global']);
      List countries = data['Countries'];
      countryDatas =
          countries.map((data) => CountryData.fromJson(data)).toList();
      countryDatas.sort((value1, value2) =>
          value2.totalConfirmed.compareTo(value1.totalConfirmed));
      filteredCountryDatas = countryDatas;
      setState(ViewState.Success);
    } else {
      setState(ViewState.Error);
    }
  }

  searchFilter(String searchInput) {
    filteredCountryDatas = countryDatas;
    filteredCountryDatas = filteredCountryDatas
        .where((CountryData countryData) =>
            countryData.name.toUpperCase().contains(searchInput.toUpperCase()))
        .toList();
    setState(ViewState.Success);
  }
}
