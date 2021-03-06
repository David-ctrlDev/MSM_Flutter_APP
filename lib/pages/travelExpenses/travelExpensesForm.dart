import 'package:flutter/material.dart';
import 'package:msm_mobile_app/components/alertDialog.dart';
import 'package:msm_mobile_app/components/cameraPicture.dart';
import 'package:msm_mobile_app/components/draggableActionButton.dart';
import 'package:msm_mobile_app/components/travelExpensesFormContainer1.dart';
import 'package:msm_mobile_app/components/travelExpensesFormContainer2.dart';
import 'package:msm_mobile_app/components/travelExpensesFormContainer3.dart';
import 'package:msm_mobile_app/models/login_response.dart';
import 'package:msm_mobile_app/utilities/constants.dart';

class TravelExpensesForm extends StatefulWidget {
  final User? data;
  TravelExpensesForm(
    this.data,
  );

  _TravelExpensesFormState createState() => _TravelExpensesFormState(data);
}

int currentStep = 0;
var destination =destinationValue;

class _TravelExpensesFormState extends State<TravelExpensesForm> {
  final User? data;
  _TravelExpensesFormState(
    this.data,
  );



  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
  

    return WillPopScope(
      onWillPop:() => _showMyDialog2(),
      child: (Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
          floatingActionButton: DraggableButton(),
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          appBar: AppBar(
            title: Text("Suite MSM"),
            elevation: 0,
            backgroundColor: kPrimaryColor,
          ),
          body: SingleChildScrollView(
              child: Theme(
                  data: ThemeData(
                    colorScheme: Theme.of(context)
                        .colorScheme
                        .copyWith(primary: kPrimaryColor),
                  ),
                  child: Wrap(children: [
                    ClipPath(
                      clipper: SimpleClipper2(),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        width: MediaQuery.of(context).size.width * 1,
                        height: size.height * 0.3 - 100,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${(data!.nombres!)}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.left,
                                )
                              ],
                            ),
                            Text(
                              "${(data!.cargo)}",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 20),
                      height: 600,
                      child: Stepper(
                          controlsBuilder: (BuildContext context, ControlsDetails controls) {
                    return Row(
                      children: <Widget>[
                        TextButton(
                          onPressed: controls.onStepContinue,
                          child: const Text('Continuar'),
                        ),
                        TextButton(
                          onPressed: controls.onStepCancel,
                          child: const Text('Volver'),
                        ),
                      ],
                    );
                  },
                          type: StepperType.vertical,
                          steps: getSteps(),
                          currentStep: currentStep,
                          onStepTapped: (step) =>
                              
                              setState(() => currentStep = step),
                          onStepContinue: () {
                               switch (currentStep) {
                               case 0:{
                               
                                  if(associatedValue == null || associatedValue== ""){
                                    alertDialog(context, "Viaje Asociado");
                                    currentStep = -1;
                                  }
                                  else if(accountValue == null || accountValue ==""){
                                    alertDialog(context,"Cuenta Contable");
                                    currentStep = -1;
                                  }
                                  else if(travelObject.text ==""){
                                    alertDialog(context,"Objeto del Viaje");
                                    currentStep = -1;
                                  }
                                  else if(sapNumber.text ==""){
                                    alertDialog(context,"N??mero Sap");
                                    currentStep = -1;
                                  }
                                  else if(dateValueIni == null || dateValueIni ==""){
                                    alertDialog(context,"Seleccione la fecha de inico del viaje");
                                    currentStep = -1;
                                  }
                                  else if(dateValueEnd == null || dateValueEnd ==""){
                                    alertDialog(context,"Seleccione la fecha de fin del viaje");
                                    currentStep = -1;
                                  }
                               } 
                                 break;
                               default:
                             }
                            final isLastStep =
                                currentStep == getSteps().length - 1;
                                
                            if (isLastStep) {
                              print(destinationValue +
                                  associatedValue +
                                  accountValue +
                                  dateValueIni.toString() +
                                  dateValueEnd.toString()+
                                  destinationListAdd.toString());
                            } else {
                              setState(() => currentStep += 1);
                            }
                          },
                          onStepCancel: currentStep == 0
                              ? null
                              : () => setState(() => currentStep -= 1)),
                    ),
                  ]))))),
    );
  }
Future<bool> _showMyDialog2() async {

  return await showDialog(
    context: context,
    builder: (BuildContext context,) {
      return AlertDialog(
        title: const Text('??Seguro quieres regresar a la p??gina anterior?',style: TextStyle(fontWeight: FontWeight.bold),),
        content: Text("Existen datos sin guardar"),
        actions: <Widget>[
          TextButton(
            child: const Text('S??'),
            onPressed: () =>{
                travelObject.clear(),
                sapNumber.clear(),
                setState(() {
                  accountValue = "";
                  associatedValue = "";
                  dateValueEnd = "";
                  dateValueIni = "";
                  selectDate1Text = "Seleccione Fecha Inicio";
                  selectDate2Text = "Seleccione Fecha Fin";
                }),

               Navigator.of(context).pop(true)}),
          TextButton(
            child: const Text('No'),
            onPressed: ()=> 
               Navigator.of(context).pop(false))]);

    });
}

}

List<Step> getSteps() => [
      Step(
          isActive: currentStep >= 0,
          title: Text("Informaci??n Formato"),
          content: FormContainer1()),
      Step(
          isActive: currentStep >= 1,
          title: Text("Destinos"),
          content: FormContainer2()),
      Step(
          isActive: currentStep >= 2,
          title: Text("Desplazamientos Aeroportuarios"),
          content: FormContainer3()),
      Step(
          isActive: currentStep >= 3,
          title: Text("Gestiones Adicionales"),
          content: Container()),
      Step(
          isActive: currentStep >= 4,
          title: Text("Observaciones"),
          content: ImagePickerWidget()),
    ];

class SimpleClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    // path start with (0.0, 0.0) point
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height - 100);
    path.lineTo(0.0, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
