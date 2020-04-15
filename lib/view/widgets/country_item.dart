import 'package:coronavirus/model/country_data.dart';
import 'package:coronavirus/shared/font_styles.dart';
import 'package:coronavirus/utils/format.dart';
import 'package:flutter/material.dart';

class CountryItem extends StatelessWidget {
  final CountryData _countryData;

  const CountryItem(this._countryData, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            _countryData.name,
            style: title,
          ),
          SizedBox(height: 5),
          Row(
            children: [
              _newDataBlock('Cases', _countryData.totalConfirmed,
                  _countryData.newConfirmed, Color(0xff51A5D3)),
              _newDataBlock('Recovered', _countryData.totalRecovered,
                  _countryData.newRecovered, Color(0xff68D682)),
              _newDataBlock('Death', _countryData.totalDeaths,
                  _countryData.newDeaths, Color(0xffEF5353)),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }

  _caseDataBlock(title, totalData, newData, color) {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: smallDarkTitle,
          ),
          RichText(
            text: new TextSpan(
              // Note: Styles for TextSpans must be explicitly defined.
              // Child text spans will inherit styles from parent
              style: smallTitle,
              children: <TextSpan>[
                new TextSpan(text: Format.intToString(totalData)),
                new TextSpan(
                    text: ' +${Format.intToString(newData)}',
                    style: new TextStyle(fontSize: 14, color: color)),
              ],
            ),
          )
        ],
      ),
    );
  }

  _dataBlock(title, totalData, newData, color) {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: smallDarkTitle,
          ),
          RichText(
            text: new TextSpan(
              // Note: Styles for TextSpans must be explicitly defined.
              // Child text spans will inherit styles from parent
              style: smallTitle,
              children: <TextSpan>[
                new TextSpan(
                    text: Format.intToString(totalData), style: smallTitle),
                new TextSpan(
                    text: ' +${Format.intToString(newData)}',
                    style: new TextStyle(fontSize: 14, color: color)),
              ],
            ),
          )
        ],
      ),
    );
  }

  _newDataBlock(title, totalData, newData, color) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: smallDarkTitle,
          ),
          SizedBox(height: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(Format.intToString(totalData), style: smallTitle),
              Text(
                ' +${Format.intToString(newData)}',
                style: new TextStyle(fontSize: 14, color: color),
              )
            ],
          ),
        ],
      ),
    );
  }
}
