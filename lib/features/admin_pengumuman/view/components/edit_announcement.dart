import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

import 'package:venturo_core/features/admin_pengumuman/controllers/admin_pengumuman_controller.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/button_gradient_admin.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/top_bar_add_pengumuman.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/top_bar_admin_pengumuman.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/upload_gambar_admin.dart';
import 'package:venturo_core/features/pembayaran/view/components/upload_gambar.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class EditAnnouncementPage extends StatefulWidget {
  final String announcementId; // Ubah tipe data menjadi String
  final String id;
  final String title;
  final int pinned;
  final String description;
  EditAnnouncementPage(
      {required this.announcementId,
      required this.id,
      required this.title,
      required this.pinned,
      required this.description});

  @override
  _EditAnnouncementPageState createState() => _EditAnnouncementPageState();
}

class _EditAnnouncementPageState extends State<EditAnnouncementPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text =
        widget.title; // Set initial value for title controller
    contentController.text =
        widget.description; // Set initial value for content controller
  }

  Map<String, dynamic> announcementData = {};
  File? _imageFile;
  List<String> selectedPin = [];
  // Metode untuk memilih gambar dari galeri
  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  // Metode untuk mengirim perubahan pengumuman ke server menggunakan PUT API
  Future<Map<String, dynamic>> _updateAnnouncement(
    String id,
    String title,
    String pinned,
    String description,
  ) async {
    try {
      print("Sending data: id=$id, title=$title, description=$description");
      final Map<String, dynamic> requestBody = {
        "title": title,
        "description": description,
        "id": id,
        "is_pinned": pinned
      };

      if (_imageFile != null) {
        // Convert image to base64
        List<int> imageBytes = await _imageFile!.readAsBytes();
        String base64Image = base64Encode(imageBytes);
        requestBody['photo'] = base64Image;
      }

      final response = await http.put(
        Uri.parse('https://rtonline-api.venturo.pro/api/v1/announcements'),
        body: requestBody,
      );

      if (response.statusCode == 200) {
        print(
            "Data updated successfully: id=$id, name=$title, access=$description");
        return json.decode(response.body);
      } else {
        print("API Error: ${response.body}");
        return {"error": "Failed to update data. Response: ${response.body}"};
      }
    } catch (e) {
      print(e.toString());
      return {"error": "Failed to update data. Error: ${e.toString()}"};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF0F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBarAdminPengumuman2(
              title: "Edit Pengumuman",
            ),

            30.verticalSpace,

            Padding(
              padding: const EdgeInsets.only(right: 340.0),
              child: Text(
                "Judul",
                style: NunitoTextStyle.fw800.copyWith(fontSize: 15),
              ),
            ),
            5.verticalSpace,
            Container(
              width: 380,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                shadows: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 8,
                    offset: Offset(4, 3),
                    spreadRadius: 0,
                  )
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: widget.title,
                  hintStyle: NunitoTextStyle.fw400,
                  border: InputBorder.none,
                ),
              ),
            ),
            25.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(right: 290.0),
              child: Text(
                "Isi Informasi",
                style: NunitoTextStyle.fw800.copyWith(fontSize: 15),
              ),
            ),
            5.verticalSpace,
            Container(
              width: 380,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                shadows: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 8,
                    offset: Offset(4, 3),
                    spreadRadius: 0,
                  )
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                controller: contentController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Masukkan Isi Informasi',
                  hintStyle: NunitoTextStyle.fw400,
                  border: InputBorder.none,
                ),
              ),
            ),
            25.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(right: 260.0),
              child: Text(
                "Upload Gambar",
                style: NunitoTextStyle.fw800.copyWith(fontSize: 15),
              ),
            ),
            5.verticalSpace,

            //DIBAWAH INI MERUPAKAN BUTTON UPLOAD GAMBAR
            Container(
              width: 380.0,
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 8,
                    offset: Offset(4, 3),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed:
                        _pickImage, // Panggil method untuk memilih gambar
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF094282),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Choose File',
                      style: TextStyle(
                        fontFamily: 'NunitoBold',
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                  ),

                  SizedBox(width: 10), // Spacer
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        'Upload Gambar Disini',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13.0,
                            fontFamily: 'NunitoReg'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Tambahkan input untuk upload gambar jika diperlukan
            320.verticalSpace,
            ButtonGradientAdmin(onPressed: () async {
              final content = contentController.text;
              final title = titleController.text;

              if (content.isNotEmpty && title.isNotEmpty) {
                Map<String, dynamic> response = await _updateAnnouncement(
                  widget.id,
                  title,
                  1.toString(),
                  content,
                );
                print(response);
                if (response.containsKey('error')) {
                } else {
                  Get.back();
                }
                // Panggil metode _updateAnnouncement
              }
            })
          ],
        ),
      ),
    );
  }
}
