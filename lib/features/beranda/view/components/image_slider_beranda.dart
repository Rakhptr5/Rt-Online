// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/beranda/controllers/image_slider_controller.dart';

class ImageSliderBeranda extends StatefulWidget {
  const ImageSliderBeranda({super.key});

  @override
  State<ImageSliderBeranda> createState() => _ImageSliderBerandaState();
}

class _ImageSliderBerandaState extends State<ImageSliderBeranda> {
  // int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Slider
        CarouselSlider(
          options: CarouselOptions(
            enableInfiniteScroll: true,
            autoPlay: true,
            height: 177.w,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                ImageSliderController.to.onIndexChanged(index);
              });
            },
          ),

          // Image
          items: ImageSliderController.to.repository.imageUrls
              .asMap()
              .entries
              .map((entry) {
            //
            int index = entry.key;
            String url = entry.value;

            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigasi ke DetailBannerScreen dengan membawa indeks gambar
                        ImageSliderController.to.goToDetailScreen(
                            ImageSliderController.to.repository.imageUrls,
                            index);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: SizedBox(
                          width: 382.w,
                          child: Image.network(
                            url,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
