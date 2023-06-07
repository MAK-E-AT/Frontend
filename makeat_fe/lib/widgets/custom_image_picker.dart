// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../views/food_record_screen.dart';
import '../views/analyzed_image_screen.dart';
import '../views/anlyzing_screen.dart';
import '../common/no_animation_page_route.dart';

class CustomImagePicker extends StatefulWidget {
  final String selectedDate;
  final bool isLabel;
  final double spaceBetween;

  const CustomImagePicker({
    super.key,
    required this.selectedDate,
    this.isLabel = true,
    this.spaceBetween = 20.0,
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

  void sendRequest(File image) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://3.34.110.7:8080/analized-nutrient-info'),
    );

    request.files.add(
      await http.MultipartFile.fromPath(
        'image',
        image.path,
        filename: '화면 캡처 2023-05-09 164154.png',
      ),
    );

    var response = await request.send();

    if (response.statusCode == 200) {
      print('Request sent successfully');
    } else {
      print('Error sending request. Status code: ${response.statusCode}');
    }
  }

  void printResponseBody(http.StreamedResponse response) async {
    // Response의 body를 문자열로 변환
    var responseBody = await response.stream.bytesToString();

    // JSON 형식인 경우 디코딩하여 출력
    try {
      var jsonBody = json.decode(responseBody);
      print(jsonBody);
    } catch (e) {
      // JSON 형식이 아닌 경우 그대로 출력
      print(responseBody);
    }
  }

  void sendSpring(File image) async {
    List<int> imageBytes = await image.readAsBytes();

    // HTTP POST 요청 보내기
    String url = 'http://3.34.110.7:8080/upload'; // 업로드할 서버 URL

    var request = http.MultipartRequest('POST', Uri.parse(url));

    // Content-Type 헤더 설정
    request.headers['Content-Type'] = 'image/png'; // 전송할 이미지 파일 형식에 맞게 설정

    // 파일 데이터를 추가
    request.files.add(
      http.MultipartFile.fromBytes('image', imageBytes, filename: 'image.jpg'),
    );
    // 추가적인 필드나 헤더를 설정할 수도 있음
    // request.headers['Authorization'] = 'Bearer your-token';

    // 요청 보내고 응답 받기
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print('사진 업로드 성공');
      print(response.stream);
      printResponseBody(response);
    } else {
      print('사진 업로드 실패: ${response.reasonPhrase}');
    }
  }

  Future onPhoto(ImageSource source) async {
    XFile? f = await ImagePicker().pickImage(source: source);

    // 예외 처리(완)
    if (f == null) {
      // ignore: use_build_context_synchronously
      return Navigator.push(
        context,
        NoAnimationPageRoute(
            builder: (context) => FoodRecordScreen(),
            settings: const RouteSettings(name: 'food_record_screen')),
      );
    }

    mPhoto = File(f.path); // cache 에 저장되는 이미지 경로
    Future<Uint8List> photo = mPhoto!.readAsBytes(); // 이미지를 int 값으로 변환
    photo.then((val) {
      // print(' 데이터 크기 = ${val.length}');
      //SendImageToFlask().sendToImageToFlask(val);
      sendSpring(File(f.path));
      //sendRequest(File(f.path));

      print('get image');
    }).catchError((error) {
      print('error');
    });

    return photo;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.spaceBetween,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.81,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade700,
              width: 1.2,
            ),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              (widget.isLabel == true) 
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade700,
                      width: 1.2
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  width: 160,
                  height: 38,
                  margin: const EdgeInsets.fromLTRB(0, 4, 0, 12),
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: Text(
                      '식단을 추가해주세요',
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 14,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              : const SizedBox(height: 8.0,),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomIconButton(
                      imagePath: 'assets/images/meal_select/text.png',
                      buttonText: '텍스트로 추가',
                      textColor: Colors.grey.shade800,
                      onPressed: () {
                        Navigator.push(
                          context,
                          NoAnimationPageRoute(
                              builder: (context) => AnalyzedImageScreen(
                                    selectedDate: widget.selectedDate,
                                  ),
                              settings:
                                  const RouteSettings(name: 'image_screen')),
                        );
                      },
                    ),
                    CustomIconButton(
                      imagePath: 'assets/images/meal_select/camera.png',
                      buttonText: '카메라로 추가',
                      textColor: Colors.grey.shade800,
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
                                settings: const RouteSettings(
                                    name: 'analyzed_image_screen')),
                          );
                        });
                      },
                    ),
                    CustomIconButton(
                      imagePath: 'assets/images/meal_select/gallery.png',
                      buttonText: '앨범에서 추가',
                      textColor: Colors.grey.shade800,
                      onPressed: () async {
                        final pickedPhoto = await onPhoto(ImageSource.gallery);
                        if (pickedPhoto != null) {
                          setState(() {
                            photo = Future.value(pickedPhoto);
                            Navigator.push(
                              context,
                              NoAnimationPageRoute(
                                  builder: (context) => AnalyzingScreen(
                                        photo: photo,
                                        selectedDate: widget.selectedDate,
                                      ),
                                  settings: const RouteSettings(
                                      name: 'image_screen')),
                            );
                          });
                        }
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
        SizedBox(
          height: widget.spaceBetween,
        ),
      ],
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final String imagePath;
  final String buttonText;
  final VoidCallback onPressed;
  final Color textColor;

  const CustomIconButton({
    super.key,
    required this.imagePath,
    required this.buttonText,
    required this.onPressed,
    this.textColor = Colors.black,
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
          style: TextStyle(color: textColor, fontSize: 12),
        ),
      ],
    );
  }
}
