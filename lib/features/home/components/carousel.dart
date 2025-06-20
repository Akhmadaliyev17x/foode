import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart'; // Sizer kutubxonasi

class CarouselWidget extends StatelessWidget {
  final List<String> images;
  final Function(int) onTap;

  const CarouselWidget({
    super.key,
    required this.images,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Responsive bo'lishi uchun contextdan MediaQuery o'rniga sizer ishlatiladi
    return CarouselSlider(
      options: CarouselOptions(
        height: 25.h, // 25% screen height
        autoPlay: true,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: images.map(
        (element) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () => onTap(images.indexOf(element)),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(2.w), // Radius ham responsive
                  ),
                  elevation: 2,
                  child: Image.asset(
                    element,
                    fit: BoxFit.cover,
                    width: 100.w, // Full width of screen
                  ),
                ),
              );
            },
          );
        },
      ).toList(),
    );
  }
}
