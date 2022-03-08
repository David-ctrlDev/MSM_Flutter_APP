import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';


class ImagePickerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImagePickerState();
  }
}

class _ImagePickerState extends State<ImagePickerWidget> {
  var _imgPath;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              imageView(_imgPath),
              ElevatedButton(
                onPressed: _takePhoto,
                child: Text ("Foto"),
              ),
              ElevatedButton(
                onPressed: _openGallery,
                                 child:Text ("Seleccionar foto"),
              ),
            ],
          ),
        );
  } 
  Widget imageView(imgPath) {
    if (imgPath == null) {
      return Center(
                 child:Text("Seleccione una foto o tome una foto"),
      );
    } else {
      
      return Image.file(File(
        imgPath.path),
      );
    }
  }

  
     /*Take a Picture*/
  Future _takePhoto() async {
    final ImagePicker _picker = ImagePicker();
    var image = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      _imgPath = image;
    });
  }

     /*Gallery*/
  _openGallery() async {
    final ImagePicker _picker = ImagePicker();
    var image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imgPath = image;
    });
  }
}