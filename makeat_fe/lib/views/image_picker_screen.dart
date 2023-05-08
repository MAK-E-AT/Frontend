// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makeat_fe/views/anlyzing_screen.dart';
import 'package:makeat_fe/views/food_record_detail_screen.dart';
import 'package:makeat_fe/widgets/custom_app_bar.dart';
import 'package:makeat_fe/widgets/custom_elevated_button.dart';

import '../common/no_animation_page_route.dart';

class ImagePickerScreen extends StatefulWidget {
  final String selectedDate;

  const ImagePickerScreen({
    Key? key,
    required this.selectedDate,
  }) : super(key: key);

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  Future<Uint8List>? photo;
  File? mPhoto;

  final url = Uri.parse('http://127.0.0.1:9900/test');

  Future<Uint8List> onPhoto(ImageSource source) async {
    XFile? f = await ImagePicker().pickImage(source: source);
    mPhoto = File(f!.path); // cache 에 저장되는 이미지 경로

    Future<Uint8List> photo = mPhoto!.readAsBytes(); // 이미지를 int 값으로 변환

    photo.then((val) {
      print(' 데이터 크기 = ${val.length}');
    }).catchError((error) {});

    return photo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 30.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black54, width: 2),
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.width * 0.8,
                  child: photo != null
                      ? FutureBuilder<Uint8List>(
                          future: photo,
                          builder: (BuildContext context,
                              AsyncSnapshot<Uint8List> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.hasData) {
                                return Image.memory(
                                  snapshot.data!,
                                  fit: BoxFit.cover,
                                );
                              } else {
                                return const Center(
                                    child: Text('이미지를 가져오지 못했습니다.'));
                              }
                            } else {
                              return Image.asset(
                                'assets/images/sample_food/sample_food.png',
                                fit: BoxFit.cover,
                              );
                            }
                          },
                        )
                      : Image.asset(
                          'assets/images/sample_food/sample_food.png',
                          fit: BoxFit.cover,
                        ),
                ),

                // buttton part //////////
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 13, 48, 78)),
                        onPressed: () async {
                          final pickedPhoto =
                              await onPhoto(ImageSource.gallery);
                          setState(() {
                            photo = Future.value(pickedPhoto);
                          });
                        },
                        child: const Text(
                          '갤러리',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () async {
                          final pickedPhoto = await onPhoto(ImageSource.camera);
                          setState(() {
                            photo = Future.value(pickedPhoto);
                          });
                        },
                        child: const Text(
                          '카메라',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 13, 48, 78),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 167, 212, 41)),
                        onPressed: () => {},
                        child: const Text(
                          '텍스트',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomElevatedButton(
        buttonText: '이 사진으로 식단 분석하러 가기',
        onPressed: () {
          return Navigator.push(
              context,
              NoAnimationPageRoute(
                  builder: (context) => const AnalyzingScreen(),
                  settings: const RouteSettings(name: 'analyzing_screen')));
        },
      ),
    );
  }
}
