// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:makeat_fe/views/analyzed_nutrition_screen.dart';
import 'package:makeat_fe/widgets/custom_image_picker.dart';
import 'package:makeat_fe/widgets/custom_pie_chart.dart';

import '../common/no_animation_page_route.dart';
import '../widgets/custom_bottom_navigation_bar.dart';


class FoodRecordDetailScreen extends StatefulWidget {
  final String selectedDate;
  final List<String> selectedTime;
  final List<String> selectedMeal;
  final List<Map<String, double>> selectedNutrition;


  const FoodRecordDetailScreen({
    Key? key, 
    required this.selectedDate,
    required this.selectedTime,
    required this.selectedMeal,
    required this.selectedNutrition,
  }) : super(key: key);

  @override
  State<FoodRecordDetailScreen> createState() => _FoodRecordDetailScreenState();
}

class _FoodRecordDetailScreenState extends State<FoodRecordDetailScreen> {

  // Future<Uint8List>? photo;
  // File? mPhoto;

  // Future<Uint8List> onPhoto(ImageSource source) async {
  //   XFile? f = await ImagePicker().pickImage(source: source);
  //   mPhoto = File(f!.path); // cache 에 저장되는 이미지 경로

  //   Future<Uint8List> photo = mPhoto!.readAsBytes(); // 이미지를 int 값으로 변환

  //   photo.then((val) {
  //     print(' 데이터 크기 = ${val.length}');
  //   }).catchError((error) {});

  //   return photo;
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: const CustomAppBar(),
        body: SafeArea(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 4.0),
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
              height: 10.0,
            ),
            Expanded(
              child: ListView.builder(
                // mealRecordList -> widget.selectedImage
                itemCount: widget.selectedMeal.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == widget.selectedMeal.length) {
                    // 리스트 뷰 맨 마지막 순번인 경우
                    return CustomImagePicker(
                      selectedDate: widget.selectedDate,
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 10.0),
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
                                      text: ' ${index + 1}끼  ',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                TextSpan(
                                  text: '${widget.selectedDate}  ${widget.selectedTime[index]}',
                                  style: const TextStyle(
                                    fontSize: 12.0,                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.81,
                            height: 160.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 2,
                              itemBuilder: (BuildContext context, int index2) {
                                if (index2 == 0) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black54,
                                        width: 0.5,
                                      ),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          NoAnimationPageRoute(
                                            builder: (context) =>
                                                AnalyzedNutritionScreen(
                                                  selectedDate: widget.selectedDate,
                                                  dataMap: widget.selectedNutrition[index],
                                                ),
                                            settings: const RouteSettings(
                                                name: 'analyzed_nutrition_screen')),
                                        );
                                      },
                                      child: Image.asset(
                                        widget.selectedMeal[index],
                                        width: MediaQuery.of(context).size.width *
                                            0.38,
                                        height:
                                          MediaQuery.of(context).size.width *
                                              0.4,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black54,
                                        width: 0.5,
                                      ),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          NoAnimationPageRoute(
                                            builder: (context) =>
                                              AnalyzedNutritionScreen(
                                                selectedDate: widget.selectedDate,
                                                dataMap: widget.selectedNutrition[index],
                                              ),
                                            settings: const RouteSettings(
                                                name: 'analyzed_nutrition_screen')),
                                        );
                                      },
                                      child: CustomPieChart(
                                        dataMap: widget.selectedNutrition[index],
                                        isLegends: false,
                                      ),
                                    ),
                                  );
                                }
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
