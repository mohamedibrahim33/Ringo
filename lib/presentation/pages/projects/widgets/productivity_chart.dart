import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_test/core/utils/colors.dart';
import 'package:flutter_dev_test/presentation/components/text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductivityChart extends StatelessWidget {
  final List<ProductivityModel> productivityList = [
    ProductivityModel("Jan", 40),
    ProductivityModel("Feb", 60),
    ProductivityModel("Mar", 80),
    ProductivityModel("Apr", 30),
    ProductivityModel("May", 66),
    ProductivityModel("Jun", 77),
    ProductivityModel("Jul", 55),
    ProductivityModel("Aug", 70),
    ProductivityModel("Sep", 86),
    ProductivityModel("Oct", 70),
    ProductivityModel("Nov", 50),
    ProductivityModel("Dec", 60),
  ];
  ProductivityChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 32.h),
            child: const Row(
              children: [
                TextWidget(
                  title: "Productivity",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                Spacer(),
                Icon(Icons.more_horiz_rounded)
              ],
            ),
          ),
          SizedBox(
            height: 0.25.sh,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(width: 16.w),
                itemCount: productivityList.length,
                itemBuilder: (context, index) {
                  bool indexOfMonth =
                      DateFormat('MMM', "en").format(DateTime.now()) ==
                          productivityList[index].monthName;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Visibility(
                        visible: indexOfMonth,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.h, horizontal: 8.w),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: TextWidget(
                                title:
                                    "${productivityList[index].percentage?.round()}%",
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Positioned(
                              bottom: -8,
                              child: CustomPaint(
                                size: const Size(16, 12),
                                painter: RPSCustomPainter(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Flexible(
                        child: LayoutBuilder(builder: (context, constraints) {
                          final maxHeight = constraints.maxHeight;
                          return Container(
                            width: 48,
                            height: (maxHeight / 100) *
                                productivityList[index].percentage!.toDouble(),
                            decoration: ShapeDecoration(
                              color: indexOfMonth ? primaryColor : null,
                              gradient: indexOfMonth
                                  ? null
                                  : const LinearGradient(
                                      begin: Alignment(1.00, 0.00),
                                      end: Alignment(-1, 0),
                                      colors: [
                                        Color(0x33181C29),
                                        Color(0x19181C29)
                                      ],
                                    ),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 8.h),
                      TextWidget(
                        title: productivityList[index].monthName,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: secondaryColor,
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(5.26795, 11);
    path_0.cubicTo(6.03775, 12.3333, 7.96225, 12.3333, 8.73205, 11);
    path_0.lineTo(13.0622, 3.5);
    path_0.cubicTo(13.832, 2.16666, 12.8697, 0.5, 11.3301, 0.5);
    path_0.lineTo(2.66987, 0.5);
    path_0.cubicTo(1.13027, 0.5, 0.168022, 2.16667, 0.937822, 3.5);
    path_0.lineTo(5.26795, 11);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.black.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ProductivityModel {
  final String monthName;
  final double? percentage;
  ProductivityModel(this.monthName, this.percentage);
}
