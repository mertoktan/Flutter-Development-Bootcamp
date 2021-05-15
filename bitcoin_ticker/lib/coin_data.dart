import 'dart:convert';
import 'dart:html';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'TRY',
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
  'DOGE'
];

const apiKey='950AA01C-F9E8-4CB0-AF59-3427C862E3D5';
const CoinDataUrl='https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future getCoinData() async {
    String requestURL = '$CoinDataUrl/BTC/USD?apikey=$apiKey';
    http.Response response = await http.get(Uri.parse(requestURL));

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      return lastPrice;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}