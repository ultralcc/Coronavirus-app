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
  ScrollController _scrollController = ScrollController();
  bool showFloatingButton = false;

  _addScrollListener() {
    _scrollController.addListener(() {
      if (_scrollController.offset < 200 && showFloatingButton) {
        setState(() {
          showFloatingButton = false;
        });
      } else if (_scrollController.offset >= 200 &&
          showFloatingButton == false) {
        setState(() {
          showFloatingButton = true;
        });
      }
    });
  }

  @override
  void initState() {
    //监听滚动事件，打印滚动位置
    _addScrollListener();
    super.initState();
  }

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

        return GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Scaffold(
            backgroundColor: Color(0xff383838),
            appBar: _appBar(),
            body: bodyWidget,
            floatingActionButton: showFloatingButton ? _floatingButton() : null,
          ),
        );
      },
    );
  }

  _appBar() => AppBar(
        elevation: 0,
        backgroundColor: Color(0xff383838),
        title: Text(
          'Covid-19',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );

  _body(HomeViewModel model) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: RefreshIndicator(
        backgroundColor: Color(0xff383838),
        onRefresh: () async => model.fetchSummeryData(),
        child: ListView(
          controller: _scrollController,
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
            SizedBox(height: 20),
            TextField(
              onChanged: (text) => model.searchFilter(text),
              style: TextStyle(color: Colors.white70, fontSize: 20),
              cursorColor: Colors.cyan,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white60,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.cyan,
                    width: 2,
                  ),
                ),
                hoverColor: Colors.cyan,
                focusColor: Colors.cyan,
                hintStyle: TextStyle(
                  color: Colors.white60,
                ),
                hintText: 'Search by country name',
                suffixIcon: Icon(Icons.search, color: Colors.white60),
              ),
            ),
            SizedBox(height: 10),
            ..._counrtiesList(model.filteredCountryDatas),
          ],
        ),
      ),
    );
  }

  _floatingButton() {
    return FloatingActionButton(
        child: new Icon(
          Icons.arrow_upward,
          color: Colors.white,
        ),
        onPressed: () {
          _scrollController.animateTo(
            0.0,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
          );
        });
  }

  _counrtiesList(List<CountryData> _counrtyData) {
    return _counrtyData.map((value) => CountryItem(value)).toList();
  }
}
