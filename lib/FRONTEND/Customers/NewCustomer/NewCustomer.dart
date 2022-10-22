import 'package:flutter/material.dart';
import 'package:sales/FRONTEND/Customers/NewCustomer/stepper1.dart';
import 'package:sales/FRONTEND/Customers/NewCustomer/stepper2.dart';
import 'package:sales/FRONTEND/Customers/NewCustomer/stepper3.dart';

class Newcustomer extends StatefulWidget {
  const Newcustomer({Key? key}) : super(key: key);

  @override
  State<Newcustomer> createState() => _NewcustomerState();
}

class _NewcustomerState extends State<Newcustomer> {


  int currentstep = 0;
  List<Step> getSteps()=>[
    Step(state:currentstep>0?StepState.complete:StepState.indexed,isActive:currentstep>=0,title: Text('STEP - 1'), content: stepper1()),
    Step(state:currentstep>1?StepState.complete:StepState.indexed,isActive:currentstep>=1,title: Text('STEP - 2'), content: stepper2()),
    Step(state:currentstep>2?StepState.complete:StepState.indexed,isActive:currentstep>=2,title: Text('STEP - 3'), content: stepper3()),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Text(
          "New Customer",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(primary: Colors.cyan)),
      child: Stepper(
        currentStep: currentstep,
        type: StepperType.horizontal,
          steps: getSteps(),
        onStepContinue: () {
          setState(() {
            if(currentstep==2){
              print("Completed");
            }
            else{
              currentstep += 1;
            }
          });
        },
        onStepCancel: (){
          setState(() {
           if(currentstep==0){

           }
           else{
             currentstep -= 1;
           }
          });
        },
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return currentstep==2?Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 150,
                      height: 40,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.cyan
                            ),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            )
                        ),
                        onPressed: (){

                        },
                        child: const Text("Save", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      height: 40,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.cyan
                            ),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            )
                        ),
                        onPressed: details.onStepCancel,
                        child: const Text("Cancel", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300,
                  height: 40,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.cyan
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        )
                    ),
                    onPressed: (){

                    },
                    child: const Text("Save & Order", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  ),
                ),
              ),
              const SizedBox(height: 50,)
            ],
          ):Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.cyan
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          )
                      ),
                      onPressed: details.onStepContinue,
                      child: const Text("Next", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.cyan
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          )
                      ),
                      onPressed: details.onStepCancel,
                      child: const Text("Cancel", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50,)
            ],
          );
        },
    ),
      ),
    );
  }
}