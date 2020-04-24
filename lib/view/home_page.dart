import 'package:coronavirus/enum/view_state.dart';
import 'package:coronavirus/model/country_data.dart';
import 'package:coronavirus/scoped_model/home_view_model.dart';
import 'package:coronavirus/view/base_view.dart';
import 'package:coronavirus/view/widgets/country_item.dart';
import 'package:flutter/material.dart';
import 'widgets/total_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (model) => model.initModel(),
      builder: (context, child, model) {
        var bodyWidget;
        if (model.state == ViewState.Busy)
          bodyWidget = Center(
              child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
          ));
        else if (model.state == ViewState.Success)
          bodyWidget = _body(model);
        else
          bodyWidget = Center(
              child: Text('Oops...', style: TextStyle(color: Colors.white)));

        return Scaffold(
          backgroundColor: Color(0xff383838),
          appBar: _appBar(),
          body: bodyWidget,
        );
      },
    );
  }

  _appBar() => AppBar(
        elevation: 0,
        backgroundColor: Color(0xff383838),
        title: Text('Covid-19'),
      );
  _body(HomeViewModel model) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: RefreshIndicator(
        backgroundColor: Color(0xff383838),
        onRefresh: () async => model.fetchSummeryData(),
        child: ListView(
          physics: AlwaysScrollableScrollPhysics(),
          children: [
            TotalCard(
                'New',
                model.globalData.newConfirmed,
                model.globalData.newRecovered,
                model.globalData.newDeaths,
                Color(0xffCE5E51)),
            SizedBox(height: 15),
            TotalCard(
                'Total',
                model.globalData.totalConfirmed,
                model.globalData.totalRecovered,
                model.globalData.totalDeaths,
                Color(0xff45B4B4)),
            SizedBox(
              height: 30,
            ),
            ..._counrtiesList(model.countryDatas),
          ],
        ),
      ),
    );
  }

  _counrtiesList(List<CountryData> _counrtyData) {
    return _counrtyData.map((value) => CountryItem(value)).toList();
  }
}
