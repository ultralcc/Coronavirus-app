import 'package:coronavirus/utils/format.dart';
import 'package:flutter/material.dart';

class TotalCard extends StatelessWidget {
  final String title;
  final int cases;
  final int recovered;
  final int death;
  final Color color;

  const TotalCard(
      this.title, this.cases, this.recovered, this.death, this.color,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            ' $title',
            style: TextStyle(
              fontSize: 16,
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  _littleCard('Cases', cases),
                  _littleCard('Recovered', recovered),
                  _littleCard('Death', death),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _littleCard(String title, int value) {
    return Expanded(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 8),
          Text(
            Format.intToString(value),
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
