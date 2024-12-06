import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  TextEditingController WeightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String Result = "";
  String bmi = "";

  void CalculatorBMI(String Weight, String height) {
    double WeightDouble = double.parse(Weight);
    double heightDouble = double.parse(height);
    setState(() {
      bmi = (WeightDouble / (heightDouble * heightDouble)).toStringAsFixed(2);
      String bmiCategory = getCategory(bmi);
      Result = "You are in $bmiCategory  category.";
    });
  }

  String getCategory(String bmi) {
    double bmiDouble = double.parse(bmi);
    String category = '';
    if (bmiDouble < 18.5) {
      category = 'Underweight';
    } else if (18.5 <= bmiDouble && bmiDouble < 24.9) {
      category = 'Healthty';
    } else if (bmiDouble > 25 && bmiDouble <= 29) {
      category = 'Overweight';
    } else {
      category = 'Obese';
    }
    return category;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Center(
              child: Text(
            "BMI CALCULATOR",
            style: TextStyle(fontSize: 25, color: Colors.amber),
          )),
          SizedBox(
            height: 60,
          ),
          SizedBox(
            height: 60,
            width: 310,
            child: TextField(
              controller: WeightController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  "Enter Weight here (in Kg)",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 60,
            width: 310,
            child: TextField(
              controller: heightController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  "Enter Height here (in m)",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 40,
            width: 150,
            child: ElevatedButton(
                onPressed: () {
                  CalculatorBMI(WeightController.text, heightController.text);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text(
                  "Calculator",
                  style: TextStyle(fontSize: 18),
                )),
          ),
          SizedBox(height: 35),
          Container(
            height: 45,
            width: 260,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 230, 138, 1)),
            child: Center(
                child: Text(
              "BMI:$bmi",
              style: TextStyle(fontSize: 20),
            )),
          ),
          SizedBox(
            height: 45,
          ),
          Text(Result)
        ],
      ),
    );
  }
}
