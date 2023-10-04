import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  Map<String, dynamic> stocksData = {};
  bool showFavorites = false;

  Future<void> fetchStocksData() async {
    final response = await http.get(
      Uri.parse(
          "https://api.hgbrasil.com/finance?format=json-cors&key=f4bc9ecc"),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final stocks = data["results"]["stocks"];
      setState(() {
        stocksData = Map<String, dynamic>.from(stocks);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchStocksData();
  }

  void toggleFavoritesView() {
    setState(() {
      showFavorites = !showFavorites;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> stocksToDisplay =
        showFavorites ? [] : stocksData.keys.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Página de Finanças"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: stocksToDisplay.length,
              itemBuilder: (context, index) {
                final stockName = stocksToDisplay[index];
                final stock = stocksData[stockName];
                final stockPoints = stock["points"];
                final stockVariation = stock["variation"];

                return ListTile(
                  title: Text(stockName),
                  subtitle:
                      Text("Pontos: $stockPoints\nVariação: $stockVariation%"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}