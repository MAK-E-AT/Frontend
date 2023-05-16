// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../views/analyzed_image_screen.dart';
import '../views/anlyzing_screen.dart';
import '../common/no_animation_page_route.dart';


class CustomImagePicker extends StatefulWidget {
  final String selectedDate;

  const CustomImagePicker({
    super.key,
    required this.selectedDate,
  });

  @override
  _CustomImagePickerState createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  Future<Uint8List>? photo;
  File? mPhoto;

  // Future<XFile?> onPhoto(ImageSource source) async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(source: source);
  //   return pickedFile;
  // }

  Future<Uint8List> onPhoto(ImageSource source) async {
    XFile? f = await ImagePicker().pickImage(source: source);
    mPhoto = File(f!.path); // cache 에 저장되는 이미지 경로

    Future<Uint8List> photo = mPhoto!.readAsBytes(); // 이미지를 int 값으로 변환

    photo.then((val) {
      // print(' 데이터 크기 = ${val.length}');
      print('get image');
    }).catchError((error) {});

    return photo;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20.0,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.81,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade800, 
              width: 2.5,
            ),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey.shade800,
                ),
                width: 160,
                height: 36,
                margin: const EdgeInsets.fromLTRB(0, 4, 0, 12),
                padding: const EdgeInsets.all(8),
                child: const Center(
                  child: Text(
                    '식단을 추가해주세요',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomIconButton(
                      imagePath: 'assets/images/meal_select/text.png',
                      buttonText: '텍스트로 추가',
                      onPressed: () {
                        Navigator.push(
                          context,
                          NoAnimationPageRoute(
                            builder: (context) => AnalyzedImageScreen(
                              selectedDate: widget.selectedDate,
                            ),
                            settings: const RouteSettings(name: 'image_screen')),
                        );
                      },
                    ),
                    CustomIconButton(
                      imagePath: 'assets/images/meal_select/camera.png',
                      buttonText: '카메라로 추가',
                      onPressed: () async {
                        final pickedPhoto = await onPhoto(ImageSource.camera);
                        setState(() {
                          photo = Future.value(pickedPhoto);
                          Navigator.push(
                            context,
                            NoAnimationPageRoute(
                              builder: (context) => AnalyzingScreen( 
                                photo: photo,
                                selectedDate: widget.selectedDate,
                              ),
                              settings: const RouteSettings(name: 'analyzed_image_screen')),
                          );
                        });
                      },
                    ),
                    CustomIconButton(
                      imagePath: 'assets/images/meal_select/gallery.png',
                      buttonText: '앨범에서 추가',
                      onPressed: () async {
                        final pickedPhoto = await onPhoto(ImageSource.gallery);
                        setState(() {
                          photo = Future.value(pickedPhoto);
                          Navigator.push(
                            context,
                            NoAnimationPageRoute(
                              builder: (context) => AnalyzingScreen( 
                                photo: photo,
                                selectedDate: widget.selectedDate,
                              ),
                              settings: const RouteSettings(name: 'image_screen')),
                          );
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final String imagePath;
  final String buttonText;
  final VoidCallback onPressed;

  const CustomIconButton({
    super.key, 
    required this.imagePath,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          child: Image.asset(
            imagePath,
            width: 60,
            height: 56,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          buttonText,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}