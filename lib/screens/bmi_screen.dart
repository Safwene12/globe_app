import 'package:flutter/material.dart';
import 'package:globe_app/widgets/menu_bottom.dart';
import 'package:globe_app/widgets/menu_drawer.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final TextEditingController txtHeight= TextEditingController();
  final TextEditingController txtWeight= TextEditingController();
  final double fontSize =16;
  String heightHint="";
  String weightHint="";
  String result ='';
  bool isMetric=true;
  bool isImperial=false;
  double? height;
  double? weight;
  late List<bool> isSelected;
  @override
  void initState() {
    // TODO: implement initState
    isSelected=[isMetric,isImperial];

    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    heightHint="Please insert your height in "+
        (isMetric? 'meters': 'inches') ;
    weightHint="Please insert your weight in "+
        (isMetric? 'kilos': 'pounds') ;
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      drawer: MenuDrawer(),
      bottomNavigationBar: MenuButtom(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ToggleButtons(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Metric',
                      style: TextStyle(
                          fontSize: fontSize,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Imperial',
                      style: TextStyle(
                          fontSize: fontSize,
                      ),
                    ),
                  ),
                ],
                isSelected: isSelected,
                onPressed: toggleMeasure ,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: txtHeight,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: heightHint,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: txtWeight,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: weightHint,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(34.0),
              child: ElevatedButton(
                onPressed: findBMI,
                child: Text(
                  'Calculate BMI',
                  style: TextStyle(
                    fontSize: fontSize
                  ),
                ),
              ),
            ),
            Text(
              result,
              style: TextStyle(
                fontSize: fontSize
              ),
            )
          ],
        ),
      ),
    );
  }
  void toggleMeasure(value){
    if(value==0){
      isMetric=true;
      isImperial=false;
    }else{
      isMetric=false;
      isImperial=true;
    }
    setState(() {
      isSelected=[isMetric,isImperial];
    });
  }
  void findBMI(){
    double bmi=0;
    double height = double.tryParse(txtHeight.text) ?? 0;
    double weight = double.tryParse(txtWeight.text) ?? 0;
    if(isMetric){
      bmi = weight/ (height*height);
    }else{
      bmi = weight*703/(height*height);
    }
    setState(() {
      result= 'Your BMI is '+bmi.toStringAsFixed(2);
    });
  }
}
