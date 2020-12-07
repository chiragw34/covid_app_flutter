import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countryData;
  fetchCountryData() async {
    http.Response response =
        await http.get("https://corona.lmao.ninja/v2/countries");
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget loading = Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.black12,
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Country Stats"),
      ),
      body: countryData == null
          ? loading
          : ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  height: 130,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey[100],
                      blurRadius: 10,
                      offset: Offset(0, 10),
                    )
                  ]),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              countryData[index]['country'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Image.network(
                              countryData[index]['countryInfo']['flag'],
                              height: 50,
                              width: 60,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Confirmed:' +
                                    countryData[index]['cases'].toString(),
                                style: TextStyle(
                                  color: Colors.red[400],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Active:' +
                                    countryData[index]['active'].toString(),
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Recovered:' +
                                    countryData[index]['cases'].toString(),
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Deaths:' +
                                    countryData[index]['cases'].toString(),
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: countryData == null ? 0 : countryData.length,
            ),
    );
  }
}
