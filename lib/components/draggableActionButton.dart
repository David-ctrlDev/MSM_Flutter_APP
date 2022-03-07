import 'package:flutter/material.dart';
import 'package:draggable_fab/draggable_fab.dart';
import 'package:msm_mobile_app/utilities/constants.dart';

class DraggableButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (DraggableFab(
        child: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          splashColor: Colors.tealAccent,
          onPressed: (){
            print("hello");
          },
          child: Icon(Icons.circle_notifications_sharp,
        ),
      )));
  }
}