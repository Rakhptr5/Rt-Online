// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:venturo_core/features/iuran_warga/view/components/header_riwayat_pembayaran.dart';
import 'package:venturo_core/features/iuran_warga/view/components/struk_pembayaran_card.dart';
import 'package:venturo_core/features/iuran_warga/view/ui/struk_pembayaran_screen.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';

class RiwayatPembayaranCard extends StatelessWidget {
  const RiwayatPembayaranCard({
    Key? key,
    this.isTahun = false,
  }) : super(key: key);

  final bool? isTahun;

  @override
  Widget build(BuildContext context) {
    // Container Card
    var amount = 300000;
    var amount2 = 600000;
    int length;

    return (isTahun == false)
        ?
        // isTahun
        Container(
            width: 382.w,
            padding: EdgeInsets.all(12.w),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),

            // Column List Riwayat Pembayaran
            child: Column(
              children: List.generate(
                length = 7,
                (index) => (index == length - 1)
                    ? buildRiwayatCard(1800000, isLast: true)
                    : buildRiwayatCard(amount),
              ),
            ),
          )
        : Column(
            children: [
              // header
              const HeaderRiwayatPembayaran(date: "2022"),

              25.verticalSpace,

              // Card
              Container(
                width: 382.w,
                padding: EdgeInsets.all(12.w),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                // Column List Riwayat Pembayaran
                child: Column(
                  children: List.generate(
                    length = 8,
                    (index) => (index == length - 1)
                        ? buildRiwayatCard(1800000, isLast: true)
                        : buildRiwayatCard(amount2),
                  ),
                ),
              ),
            ],
          );
  }

  GestureDetector buildRiwayatCard(int amount, {final bool isLast = false}) {
    return GestureDetector(
      onTap: () {
        Get.to(const StrukPembayaranScreen());
      },
      child: Container(
        width: 358.w,
        padding: EdgeInsets.symmetric(vertical: 12.w),

        decoration:
            // isLast ?
            (isLast == true)
                ? null
                : const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Color(0xFFB5B7C4),
                      ),
                    ),
                  ),

        // Row Content
        child: Row(
          children: [
            // Title, Date
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text
                Text(
                  'Iuran Bulan Desember',
                  style: NunitoTextStyle.fw700.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 16.sp,
                  ),
                ),

                // Date
                Text(
                  '27 Okt 2023, 14:33',
                  style: NunitoTextStyle.fw400.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 14.sp,
                  ),
                )
              ],
            ),

            Expanded(child: Container()),

            // Nominal
            Text(
              NumberFormat.currency(
                      locale: "id", decimalDigits: 0, symbol: "-Rp ")
                  .format((amount != true) ? amount : 0),
              style: NunitoTextStyle.fw600.copyWith(
                color: const Color(0xFFD40202),
                fontSize: 16.sp,
              ),
            ),

            8.horizontalSpace,

            // Button Icon
            SizedBox(
              width: 24.w,
              child: const ImageIcon(
                AssetImage("assets/images/ic_arrow_ios_right.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
