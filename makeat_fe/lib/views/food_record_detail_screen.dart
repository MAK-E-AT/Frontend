// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../common/no_animation_page_route.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import 'image_picker_screen.dart';

class FoodRecordDetailScreen extends StatefulWidget {
  final String selectedDate;
  // final String savedTime;
  final List<String> selectedImage;

  const FoodRecordDetailScreen({
    Key? key, 
    required this.selectedDate,
    required this.selectedImage,
  }) : super(key: key);

  @override
  State<FoodRecordDetailScreen> createState() => _FoodRecordDetailScreenState();
}

class _FoodRecordDetailScreenState extends State<FoodRecordDetailScreen> {
  final List<List<String>> mealRecordList = [
    [
      'assets/images/sample_food/sample_food.png',
      'assets/images/sample_diagram/d1.png',
    ],
    [
      'assets/images/sample_food/sample_food.png',
      'assets/images/sample_diagram/d1.png',
    ],
  ];

  Future<Uint8List>? photo;
  File? mPhoto;

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
    return MaterialApp(
      home: Scaffold(
        appBar: const CustomAppBar(),
        body: SafeArea(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.selectedDate,
                  style: const TextStyle(
                      fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              height: 1.0,
              color: Colors.black,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView.builder(
                // mealRecordList -> widget.selectedImage
                itemCount: widget.selectedImage.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == widget.selectedImage.length) {
                    // 리스트 뷰 맨 마지막 순번인 경우
                    return Column(
                      children: [
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.81,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.black38,
                                ),
                                width: 150,
                                height: 35,
                                margin: const EdgeInsets.fromLTRB(0, 4, 0, 12),
                                padding: const EdgeInsets.all(8),
                                child: const Center(
                                  child: Text(
                                    '식단을 추가해주세요',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomIconButton(
                                      imagePath:
                                          'assets/images/meal_select/text.png',
                                      buttonText: '텍스트로 추가',
                                      onPressed: () {
                                        // 갤러리에서 사진 가져오기 기능
                                      },
                                    ),
                                    CustomIconButton(
                                      imagePath:
                                          'assets/images/meal_select/camera.png',
                                      buttonText: '카메라로 추가',
                                      onPressed: () async {
                                        final pickedPhoto =
                                            await onPhoto(ImageSource.camera);
                                        setState(() {
                                          photo = Future.value(pickedPhoto);
                                        });
                                      },
                                    ),
                                    CustomIconButton(
                                      imagePath:
                                          'assets/images/meal_select/gallery.png',
                                      buttonText: '앨범에서 추가',
                                      onPressed: () async {
                                        final pickedPhoto =
                                            await onPhoto(ImageSource.gallery);
                                        setState(() {
                                          photo = Future.value(pickedPhoto);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 10.0),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  children: [
                                    const WidgetSpan(
                                      child: Icon(
                                        Icons.restaurant,
                                        size: 16.0,
                                        color: Colors.red,
                                      ),
                                      alignment: PlaceholderAlignment.middle,
                                    ),
                                    TextSpan(
                                      text: ' ${index + 1}끼  -  ',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                TextSpan(
                                  text: '${widget.selectedDate}  08시 53분 ',
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.81,
                            height: 150.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 2,
                              itemBuilder: (BuildContext context, int index2) {
                                return Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black54,
                                      width: 0.5,
                                    ),
                                  ),
                                  margin: const EdgeInsets.all(0.2),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        NoAnimationPageRoute(
                                            builder: (context) =>
                                                ImagePickerScreen(
                                                  selectedDate:
                                                      widget.selectedDate,
                                                ),
                                            settings: const RouteSettings(
                                                name: 'food_record_screen')),
                                      );
                                    },
                                    child: Image.asset(
                                      widget.selectedImage[index],
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.4,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        )),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}
