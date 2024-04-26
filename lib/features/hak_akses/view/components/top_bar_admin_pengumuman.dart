// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/add_pengumuman.dart';
import 'package:venturo_core/features/hak_akses/view/components/add_pengumuman.dart';
import 'package:venturo_core/features/laporan_keuangan/view/ui/laporan_keuangan_screen.dart';
import 'package:venturo_core/features/profile/view/ui/profile_screen.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';

import '../../../../configs/routes/route.dart';

class TopBarHakAkses extends StatelessWidget {
  const TopBarHakAkses({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430.w,
      height: 120.w,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF6EE2F5),
            Color(0xFF6454F0),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x1E000000),
            blurRadius: 18,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),

      // TopBar Tata Tertib
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 382.w,
                height: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Button Back Icons
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.w),
                      child: SizedBox(
                        width: 40.w,
                        height: 40.w,
                        child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const ImageIcon(
                            AssetImage("assets/images/ic_arrow_ios_left.png"),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    // Text Informasi
                    Text(
                      (title == null) ? 'Pengumuman' : title!,
                      textAlign: TextAlign.center,
                      style: PoppinsTextStyle.fw600.copyWith(
                        color: Colors.white,
                        fontSize: 20.sp,
                      ),
                    ),

                    // Add a white square-shaped container with a transparent "+" icon
                    Container(
                      width: 30.w,
                      height: 30.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero, // Set padding to zero
                        onPressed: () {
                          Get.to(AddHakAksesPage());
                          // Add the functionality you want when the icon is pressed
                        },
                        alignment: Alignment
                            .center, // Align the icon to the center of the container
                        icon: Icon(
                          Icons.add,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
