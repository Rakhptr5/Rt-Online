// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:venturo_core/features/data_warga/view/components/button_gradient_data_warga.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class DataWargaBottomsheet extends StatefulWidget {
  const DataWargaBottomsheet({
    Key? key,
    required this.name,
    required this.date_of_birth,
    required this.phone_number,
    required this.photo_url,
  }) : super(key: key);

  final String name;
  final String date_of_birth;
  final String phone_number;
  final String photo_url;
  @override
  _DataWargaBottomsheetState createState() => _DataWargaBottomsheetState();
}

class _DataWargaBottomsheetState extends State<DataWargaBottomsheet> {
  @override
  Widget build(BuildContext context) {
    // Container
    return Container(
      width: 430.w,
      height: 490.w,
      padding: EdgeInsets.only(
        top: 12.w,
        left: 24.w,
        right: 24.w,
        bottom: 0.w,
      ),
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
      child: Column(
        children: [
          // Bar
          Container(
            width: 100.w,
            height: 5.w,
            decoration: ShapeDecoration(
              color: const Color(0xFF0B0C0D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),

          // Text
          Container(
            margin: EdgeInsets.symmetric(vertical: 15.w),
            height: 30.w,
            child: Text(
              'Detail Warga',
              style: PoppinsTextStyle.fw600.copyWith(
                color: Colors.black,
                fontSize: 20.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Profile
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Container
              Container(
                padding: EdgeInsets.all(8.w),
                width: 148.w,
                height: 148.w,

                // Profile Image
                child: Container(
                  width: 132.w,
                  height: 132.w,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.photo_url),
                      fit: BoxFit.cover,
                    ),
                    shape: OvalBorder(),
                  ),
                ),
              ),

              // Blok
              Positioned(
                bottom: 4.w,
                child: Container(
                  width: 55.w,
                  height: 26.w,
                  padding: EdgeInsets.symmetric(vertical: 4.w),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF094181),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),

                  // Text
                  child: Center(
                    child: Text(
                      'A-20',
                      style: NunitoTextStyle.fw700.copyWith(
                        color: const Color(0xFFE2DDFE),
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          8.verticalSpace,

          // Text Nama
          Text(
            widget.name, // Using the name from the widget
            style: PoppinsTextStyle.fw600.copyWith(
              color: const Color(0xFF0B0C0D),
              fontSize: 20.sp,
            ),
          ),

          15.verticalSpace,

          // Text tgl
          TextFieldDetailWarga(
            label: "Tempat, Tanggal Lahir",
            tanggal: widget.date_of_birth,
          ),

          15.verticalSpace,

          // Text no
          TextFieldDetailWarga(
            label: "No. Telepon",
            tanggal: widget.phone_number,
          ),

          15.verticalSpace,

          // Button
          ButtonGradientDataWarga(
            text: "Chat WA",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class TextFieldDetailWarga extends StatelessWidget {
  const TextFieldDetailWarga({
    Key? key,
    required this.label,
    required this.tanggal,
  }) : super(key: key);

  final String label;
  final String tanggal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 382.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: NunitoTextStyle.fw700.copyWith(
              color: const Color(0xFF0B0C0D),
              fontSize: 14.sp,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.w),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(width: 1)),
            ),
            height: 38.w,
            child: TextField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
              readOnly: true,
              controller: TextEditingController(text: tanggal),
            ),
          ),
        ],
      ),
    );
  }
}
