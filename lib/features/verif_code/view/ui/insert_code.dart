// auth_view.dart

// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';
import '../../../../configs/routes/route.dart';

class VerifView extends StatefulWidget {
  VerifView({Key? key}) : super(key: key);

  @override
  _VerifViewState createState() => _VerifViewState();
}

class _VerifViewState extends State<VerifView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 290,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF6EE2F5), Color(0xFF6454F0)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 8,
                    offset: Offset(4, 3),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'PERUM BUMI PALAPA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'PoppinsSemi',
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'RT 01',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'PoppinsBold',
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Mojolangu, Lowokwaru, Malang',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'NunitoBold',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Lupa Password',
                        style: TextStyle(
                          color: Color(0xFF1F1F1F),
                          fontSize: 20,
                          fontFamily: 'PoppinsBold',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Masukkan 4 kode yang sudah dikirim ke Emailmu.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF1F1F1F),
                          fontSize: 13,
                          fontFamily: 'NunitoMed',
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  textcode(),
                  SizedBox(height: 20),
                  buildVerifyButton(),
                ],
              ),
            ),
            SizedBox(height: 248),
            buildPlatformByContainer(),
          ],
        ),
      ),
    );
  }

  Widget textcode() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Pinput(
          length: 4,
          defaultPinTheme: PinTheme(
            width: 56,
            height: 56,
            textStyle: NunitoTextStyle.fw800.copyWith(fontSize: 30),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black, width: 2)),
            ),
          ),
          onChanged: (value) {
            setState(() {});
          },
        ),
      ),
    );
  }

  Widget buildVerifyButton() {
    return Column(
      children: [
        Material(
          child: Container(
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF6EE2F5), Color(0xFF6454F0)],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.newPassRoute);
                },
                splashColor: Color(
                    0xFF6454F0), // Set a distinct color for the splash effect
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  height: 54,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                  margin: EdgeInsets.symmetric(horizontal: 0.5),
                  child: Center(
                    child: Text(
                      'Verifikasi',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'NunitoBold',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Kirim ulang kode verifikasi dalam 00:57',
          style: TextStyle(
            color: Color(0xFF1F1F1F),
            fontSize: 13,
            fontFamily: 'Nunito',
          ),
        ),
      ],
    );
  }

  Widget buildPlatformByContainer() {
    return SizedBox(
      width: 201,
      height: 64,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(80, 0.5, 8, 20),
            child: Text(
              'Platform By',
              style: TextStyle(
                color: Color(0xFF6454F0),
                fontSize: 8,
                fontFamily: 'NunitoSem',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          Positioned(
            left: 44,
            top: 16,
            child: Container(
              width: 30,
              height: 30,
              child: Stack(children: [
                Positioned(child: Image.asset('assets/images/Gram.png'))
              ]),
            ),
          ),
          Positioned(
            left: 90,
            top: 26.50,
            child: Container(
              width: 66,
              height: 9,
              child: Stack(children: [
                Positioned(child: Image.asset('assets/images/Text.png'))
              ]),
            ),
          ),
          Positioned(
            left: 6,
            top: 51,
            child: Text(
              'RT BERKUALITAS, PENGURUS BERKELAS',
              style: TextStyle(
                color: Color(0xFF6454F0),
                fontSize: 7,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
                height: 0,
                letterSpacing: 1.40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
