import 'package:flutter/material.dart';
import 'package:msm_mobile_app/components/travelExpensesFormContainer1.dart';
import 'package:msm_mobile_app/models/login_response.dart';
import 'package:msm_mobile_app/utilities/constants.dart';


class TravelExpensesForm extends StatefulWidget {
    final User? data;
  TravelExpensesForm(
    this.data,
  );


  _TravelExpensesFormState createState() => _TravelExpensesFormState(data);
} 
  
  int currentStep =0;
  
class _TravelExpensesFormState extends State<TravelExpensesForm>{
   final User? data;
  _TravelExpensesFormState(
    this.data,
  );
  @override

  Widget build(BuildContext context) {
    return(Scaffold(appBar:AppBar(title:Text("${data!.cargo}"),),
    body: Theme(
      data: ThemeData(colorScheme:Theme.of(context).colorScheme.copyWith(primary: kPrimaryColor), ),
      child:Stepper(
        controlsBuilder: (BuildContext context,
          {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
        return Row(
          children: <Widget>[
            TextButton(
              onPressed: onStepContinue,
              child: const Text('Continuar',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
            ),
            TextButton(
              onPressed: onStepCancel,
              child: const Text('Regresar',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
            ),
          ],
        );
      },
           type:StepperType.vertical,
            steps: getSteps(),
            currentStep: currentStep,
            onStepTapped: (step)=> setState(()=>currentStep=step),
            onStepContinue: () {
              print(datevalue);
              final isLastStep = currentStep == getSteps().length -1;
              if (isLastStep){
                print("Final");
              }else{
              setState(()=>currentStep +=1);
              }
            },
            onStepCancel: currentStep == 0? null :()=> setState(()=>currentStep -=1))
    )));

  }}


List <Step> getSteps()=>[
  Step(
    isActive: currentStep >= 0,
    title: Text("Información Formato"),
     content: FormContainer1(
       
     )),
  Step(
    isActive: currentStep >= 1,
    title: Text("Destinos"),
     content: Container()),
  Step(
    isActive: currentStep >= 2,
    title: Text("Desplazamientos Aeroportuarios"),
     content: Container()),
   Step(
     isActive: currentStep >= 3,
    title: Text("Gestiones Adicionales"),
     content: Container()),
   Step(
     isActive: currentStep>= 4,
    title: Text("Observaciones"),
     content: Container()),
];