import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stop extends StatefulWidget {
  const Stop({Key? key}) : super(key: key);

  @override
  _StopState createState() => _StopState();
}

class _StopState extends State<Stop> {
  List<Step> step = [];
  int current = 0;
  @override
  void initState() {
    super.initState();
    step = [
      Step(
          title: Text('Step 1'),
          content: Text("Do something at Step 2"),
          isActive: true),
      Step(
          title: Text('Step 2'),
          content: Text("Do something at Step 3"),
          isActive: false),
      Step(
          title: Text('Step 3'),
          content: Text("Do something at Step 4"),
          isActive: false),
      Step(
          title: Text('Step 4'),
          content: Text("Do something at Step 5"),
          isActive: false),
      Step(
          title: Text('Step 5'),
          content: Text("Do something at Step 1"),
          isActive: false),
    ];
  }

  void StepCont() {
    setState(() {
      current++;
      if (current >= step.length) current = step.length - 1;
      // step[current].isActive = true;
    });
  }

  void StepCan() {
    setState(() {
      current--;
      if (current < 0) current = 0;
    });
  }

  void StepTap(int index) {
    setState(() {
      current = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(32),
          child: Stepper(
            steps: step,
            type: StepperType.horizontal,
            currentStep: current,
            onStepCancel: StepCan,
            onStepContinue: StepCont,
            onStepTapped: StepTap,
          )),
    );
  }
}
