import 'package:flutter/material.dart';
import 'package:globe_app/data/weather.dart';
import '../data/http_helper.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather result=Weather('', '', 0, 0, 0, 0);
  final TextEditingController txtPlace= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather'
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                controller: txtPlace,
                decoration: InputDecoration(
                  hintText: 'Enter a city',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: getData,
                  )
                ),
              ),
            ),
            WeatherRow('Place: ', result.name),
            WeatherRow('Description: ', result.description),
            WeatherRow('Temperature: ', result.temperature.toStringAsFixed(2)),
            WeatherRow('Perceived: ', result.perceived.toStringAsFixed(2)),
            WeatherRow('Pressure: ', result.pressure.toString()),
            WeatherRow('Humidity: ', result.humidity.toString()),
          ],
        ),
      ),
    );
  }
  getData() async{
    HttpHelper helper = HttpHelper();
    result = await helper.getWeather(txtPlace.text);
    print(result);
    setState(() {

    });
  }
  Widget WeatherRow(String label,String value){
    Widget row=Padding(
      padding:EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).hintColor,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              value,
              style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  return row;
  }

}
