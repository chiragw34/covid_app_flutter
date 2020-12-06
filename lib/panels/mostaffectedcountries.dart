import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {
  final List countryData;

  const MostAffectedPanel({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.network(
                  countryData[index]['countryInfo']['flag'],
                  height: 30,
                  width: 60,
                  
                ),
                SizedBox(width: 10,),
                Text(
                  countryData[index]['country'],
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 10,),
                Text(
                  "Deaths:" + countryData[index]['deaths'].toString(),
                  style: TextStyle(
                    color: Colors.red[400],
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
