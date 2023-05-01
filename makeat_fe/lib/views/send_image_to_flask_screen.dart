// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../common/no_animation_page_route.dart';
import '../widgets/custom_elevated_button.dart';
import 'profile_user_info_screen.dart';


class SendImageToFlask extends StatefulWidget {
  const SendImageToFlask({super.key});

  @override
  State<SendImageToFlask> createState() => _SendImageToFlaskState();
}

class _SendImageToFlaskState extends State<SendImageToFlask> {
  late Future<Widget> photo;
  File? mPhoto;

  final url = Uri.parse('http://127.0.0.1:9900/test');

  Future<Widget> onPhoto(ImageSource source) async {
    XFile? f = await ImagePicker().pickImage(source: source);
    mPhoto = File(f!.path);

    Future<Uint8List> sendPhoto = mPhoto!.readAsBytes();

    sendPhoto.then((val) {
      print('{this.source} 일단 감');
      print(val);
      //이게 플라스크한테 넘어가는거
      //_postRequest(kakaoId: widget.userID, dataByte: val);
      //   print('지금 백엔드에 넣어봄');

      //   Future<int> data = _uploadToSignedURL(
      //       file: val, //val,
      //       url:
      //           'https://makeat.s3.amazonaws.com/3.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA37IAGAIXQ52EVAUK%2F20230224%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20230224T044146Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=4c2038c1c2e64589295642eccd3a9acef9ee1889d3aa751cd7af570657b603a8');
      //   print('전송 성공');

      //   data.then((value) => print('이유는 $value'));
      // }).catchError((error) {
      //   print('Faliure to 사진전송');
    });

    Widget photo = (mPhoto != null) ? Image.file(mPhoto!) : const Text('EMPTY');
    return photo;
    //setState(() => mPhoto = File(f!.path));
  }

  @override
  Widget build(BuildContext context) {
  
  return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),

                /* MAK-E-AT 로고(소) */
                Image.asset(
                  width: 140.0,
                  'assets/images/makeat_logo/logo_small_size.png',
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
                      'assets/images/sample_data/sample_food.png',
                      fit: BoxFit.cover),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 167, 212, 41)),
                          onPressed: () => {
                                print('텍스트로 추가'),
                              },
                          child: const Text('텍스트',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontFamily: "Pura"))),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 13, 48, 78)),
                          onPressed: () => {
                                photo = onPhoto(ImageSource.gallery),
                                print(photo),
                                print('사진 전송'),
                                getflask(url),

                                // photo.then((val) {
                                //   // 데이터가 나오면 해당 값을 출력
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (context) =>
                                //               AnaPage(mPhoto: val)));
                                //   // _uploadToSignedURL(
                                //   //     file: val, url: '1'); //버킷에 업로드 어케 함?
                                // }).catchError((error) {
                                //   // error가 해당 에러를 출력
                                //   print('error: $error');
                                // }),
                                // // Navigator.push(
                                // //     context,
                                // //     MaterialPageRoute(
                                // //         builder: (context) => AnaPage(mPhoto: photo)))
                              },
                          child: const Text('갤러리',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontFamily: "Pura"))),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          photo = onPhoto(ImageSource.camera);

                          // photo.then((val) {
                          //   // 데이터가 나오면 해당 값을 출력
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => AnaPage(mPhoto: val)));
                          // }).catchError((error) {
                          //   // error가 해당 에러를 출력
                          //   print('error: $error');
                          // });

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => AnaPage(mPhoto: photo)));
                        },
                        child: const Text(
                          '카메라',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 13, 48, 78),
                              fontFamily: "Pura"),
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
      bottomNavigationBar: CustomElevatedButton(
        buttonText: '영양 성분 확인하기',
        onPressed: () {
          return Navigator.push(
            context, 
            NoAnimationPageRoute(
              builder: (context) => const ProfileUserInfoScreen(), 
              settings: const RouteSettings(name: 'profile_user_info_screen')
            )
          );
        },
      )
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