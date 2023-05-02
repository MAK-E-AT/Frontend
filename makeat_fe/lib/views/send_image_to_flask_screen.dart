// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makeat_fe/widgets/custom_app_bar.dart';

import '../widgets/custom_bottom_navigation_bar.dart';
import 'package:http/http.dart' as http;


class SendPhotoScreen extends StatefulWidget {
  const SendPhotoScreen({super.key});

  @override
  State<SendPhotoScreen> createState() => _SendPhotoScreenState();
}

class _SendPhotoScreenState extends State<SendPhotoScreen> {
  late Future<Uint8List> photo;
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
                const SizedBox(
                  height: 20.0,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black54, width: 2),
                  ),
                  width: MediaQuery.of(context).size.width * 0.76,
                  height:
                      MediaQuery.of(context).size.height * 0.38, // size 수정 필요
                  child: Image.asset(
                      'assets/images/sample_food/sample_food.png',
                      fit: BoxFit.cover),
                ),

                // buttton part //////////
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 13, 48, 78)),
                        onPressed: () => {
                          photo = onPhoto(ImageSource.gallery),
                          photo.then((val) {
                             print('get image');
                             print(val);
                           }).catchError((error) {
                             print('not get image');
                           }),
                          //getflask(url),

                          // photo.then((val) {
                        },
                        child: const Text(
                          '갤러리',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          photo = onPhoto(ImageSource.camera);
                          photo.then((val) {
                             print('get image');
                             print(val);
                           }).catchError((error) {
                             print('not get image');
                           });
                        },
                        child: const Text(
                          '카메라',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 13, 48, 78),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const SizedBox(
                  height: 24.0,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
} 


void getflask(url) async {
  try {
    http.get(url);
    print('겟 요청 보냄');
  } on SocketException catch (error) {
    print(error);
  } catch (error) {
    print('실패');
  }
}

