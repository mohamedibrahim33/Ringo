import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowImage extends StatelessWidget {
  final String image;
  const ShowImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  start: 16.w, bottom: 32.h, top: 16.h),
              child: const Icon(
                Icons.arrow_back_ios_rounded,
              ),
            ),
          ),
          Expanded(
            child: Image.network(
              image,
              width: double.infinity,
              height: 120.w,
              fit: BoxFit.fill,
              loadingBuilder: (context, child, loadingProgress) =>
                  loadingProgress == null
                      ? child
                      : const Center(child: CircularProgressIndicator()),
              errorBuilder: (context, error, stackTrace) => Image.asset(
                "assets/images/logo.png",
                width: double.infinity,
                height: 120.w,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
