import 'package:flutter/material.dart';
import 'coin_dart.dart';
import 'package:flutter/cupertino.dart';
import 'network.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String curr='USD';
  double value=0;
  double value1=0;
  double value2=0;

  @override
  void initState(){
    super.initState();

    ggetpricedata();
  }

  void ggetpricedata() async {

    nethelper net= nethelper('https://rest.coinapi.io/v1/exchangerate/$curr?apikey=2FC567680B17462ABDF7319FCB5E8B7D&invert=true&output_format=json');
    var pricedata=await net.getData();

    print(pricedata['rates'][740]['rate']);
    value=double. parse((pricedata['rates'][740]['rate']). toStringAsFixed(2));
    value1=double. parse((pricedata['rates'][1336]['rate']). toStringAsFixed(2));
    value2=double. parse((pricedata['rates'][1606]['rate']). toStringAsFixed(2));
   // rates[740].rate rates[1336].rate  rates[1606].rate

    //print(weatherdata['main']['temp']);


    // print(loc.long);
  }






  List<DropdownMenuItem<String>> getcurrency(){
    List<DropdownMenuItem<String>> l=[];
    for(String currency in currenciesList){

      var newItem=DropdownMenuItem(
      child:Text(currency),
      value: currency
      );
      l.add(newItem);
    }
    return l;
  }
  List<Widget> getcurrencyios(){
    List<Text> l=[];
    for(String currency in currenciesList){

      var wid=Text(currency);
      l.add(wid);
    }
    return l;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Cypto Tracker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $value $curr',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETH = $value2 $curr',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 DOGE = $value1 $curr',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child:CupertinoTheme(
              data: CupertinoThemeData(
    brightness: Brightness.dark,
              ),
              child: CupertinoPicker(itemExtent: 40,
                    
                    onSelectedItemChanged: (selecteditem){
                    setState((){

                      curr=currenciesList[selecteditem];
                      ggetpricedata();
                    });
                //  print(selecteditem);
                    },
                    children: getcurrencyios()),
            ),
            )
          
        ],
      ),
    );
  }
}

// DropdownButton<String>(
//
// items: getcurrency(),
// value: curr,
// onChanged: (value){
// setState((){
// curr=value as String;
// });
//
// },
// ),