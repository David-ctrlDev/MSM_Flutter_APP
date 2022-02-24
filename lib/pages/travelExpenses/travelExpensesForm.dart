import 'package:flutter/material.dart';
import 'package:msm_mobile_app/components/draggableActionButton.dart';
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

int currentStep = 0;

class _TravelExpensesFormState extends State<TravelExpensesForm> {
  final User? data;
  _TravelExpensesFormState(
    this.data,
  );

  void showAlert(BuildContext context) {}

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Future.delayed(Duration.zero, () => showAlert(context));

    return (Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: DraggableButton(),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        appBar: AppBar(
          title: Text("${data!.cargo}"),
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
                                "Saludos ${(data!.nombres!)}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
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
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 30, 20),
                    height: 800,
                    child: Stepper(
                        controlsBuilder: (BuildContext context,
                            {VoidCallback? onStepContinue,
                            VoidCallback? onStepCancel}) {
                          return Row(
                            children: [
                              TextButton(
                                  onPressed: onStepContinue,
                                  child: const Text(
                                    'Continuar',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )),
                              TextButton(
                                onPressed: onStepCancel,
                                child: const Text('Regresar',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
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
                          final isLastStep =
                              currentStep == getSteps().length - 1;
                          if (isLastStep) {
                            print(destinationValue + associatedValue + accountValue+
                                dateValueIni.toString() +
                                dateValueEnd.toString());
                          } else {
                            setState(() => currentStep += 1);
                          }
                        },
                        onStepCancel: currentStep == 0
                            ? null
                            : () => setState(() => currentStep -= 1)),
                  ),
                ])))));
  }
}

List<Step> getSteps() => [
      Step(
          isActive: currentStep >= 0,
          title: Text("Información Formato"),
          content: FormContainer1()),
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
          isActive: currentStep >= 4,
          title: Text("Observaciones"),
          content: Container()),
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
