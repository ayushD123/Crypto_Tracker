import 'package:http/http.dart';
import 'dart:convert';

class nethelper{
  nethelper(this.url);
  final String url;
  Future getData() async{
    Response r=await get( Uri.parse(url));
    String data=r.body;
    return jsonDecode(data);
  }
}










//https://rest.coinapi.io/v1/exchangerate/USD?apikey=2FC567680B17462ABDF7319FCB5E8B7D&invert=true&output_format=json