import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var wtController = TextEditingController();
  var htFeetController = TextEditingController();
  var htInchController = TextEditingController();

  var bmiScore= 0.0;

  var bmiType="";

  var bgColor = Colors.white;
  var imgPath= "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Color(0x252525),
        title: Center(child: Text("BMI APP",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,

          children: [
            Text("Measure Your BMI",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
            const SizedBox(
              height: 21,
            ),
            TextField(
              controller: wtController ,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.line_weight),
                label: Text("Weight"),
                hintText: "Enter your Weight(in KGs)....",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                )
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            TextField(
              controller: htFeetController ,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.height),
                  label: Text("Feet"),
                  hintText: "Enter your Height(in Feet)....",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                  )
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            TextField(
              controller: htInchController ,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.height),
                  label: Text("Inch"),
                  hintText: "Enter your Height(in Inches)....",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                  )
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            ElevatedButton(onPressed: (){
              /// Calculate BMI here
              calculateBMI(); /// Call BMi CAlculation

            },
                child: const Text("Calculate BMI")),
            const SizedBox(
              height: 11,
            ),
            bmiScore==0.0 ? Container() : Text("Your BMI is ${bmiScore.toStringAsFixed(2)}",style: TextStyle(fontSize: 21),),
            imgPath != "" ? Image.asset(imgPath,width: 40,height: 40,): Container(),
            bmiType=="" ? Container() : Text("You're $bmiType",style: TextStyle(fontSize: 16),)
          ],
        ),
      ),
    );
  }

  /// BMI calculation is here
  void calculateBMI(){
    var wt = int.parse(wtController.text.toString());
    var ft = int.parse(htFeetController.text.toString());
    var inch = int.parse(htInchController.text.toString());


    var totalInches = (ft*12) + inch ;
    var totalCM = totalInches*2.54 ;
    var totalM = totalCM/100 ;

    var bmi = wt/(pow(totalM, 2));

    /// to get the type from BMI (Healthy , OverWt , UnderWt)
    if(bmi>25){
      bmiType= "Over Weight";
      bgColor= Colors.red.shade300;
      imgPath= "assets/images/over-weight.png";
    }else if (bmi<18){
      bmiType= "Under Weight";
      bgColor= Colors.yellow.shade200;
      imgPath= "assets/images/ic_underweight.png";
    }else{
      bmiType= "Healthy";
      bgColor= Colors.green.shade200;
      imgPath= "assets/images/ic_healthy.png";
    }
        bmiScore = bmi ;
    wtController.text= "" ;
    htFeetController.text= "" ;
    htInchController.text= "" ;

    setState(() {

    });

  }
}

