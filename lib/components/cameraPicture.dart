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
              _ImageView(_imgPath),
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
  Widget _ImageView(imgPath) {
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

  
     /*Toma una foto*/
  Future _takePhoto() async {
    final ImagePicker _picker = ImagePicker();
    var image = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      _imgPath = image;
    });
  }

     /*Álbum*/
  _openGallery() async {
    final ImagePicker _picker = ImagePicker();
    var image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imgPath = image;
    });
  }
}