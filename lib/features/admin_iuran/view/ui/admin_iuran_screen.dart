// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/admin_iuran/view/components/admin_iuran_card.dart';
import 'package:venturo_core/features/admin_iuran/view/components/header_admin_iuran.dart';
import 'package:venturo_core/features/admin_iuran/view/components/search_bar_admin_iuran.dart';

import 'package:venturo_core/features/data_warga/constants/data_warga_assets_constant.dart';
import 'package:venturo_core/features/data_warga/controllers/data_warga_controller.dart';
import 'package:venturo_core/features/data_warga/view/components/data_warga_card.dart';
import 'package:venturo_core/features/data_warga/view/components/header_data_warga.dart';
import 'package:venturo_core/features/data_warga/view/components/search_bar_data_warga.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class AdminIuranScreen extends StatelessWidget {
  AdminIuranScreen({Key? key}) : super(key: key);

  final assetsConstant = DataWargaAssetsConstant();

  @override
  Widget build(BuildContext context) {
    // List A
    List<AdminIuranCard> listDataWargaA = [];
    for (int i = 0; i < 10; i++) {
      listDataWargaA.add(
        const AdminIuranCard(
          profileBadge: "A-20",
          profileImage:
              "https://i.pinimg.com/564x/2f/fd/2a/2ffd2af47e1647ed1fe9cc3dd15aabc0.jpg",
          profileName: "Ahmad Sujadi",
          profileNumber: "0890876542",
        ),
      );
    }

    // List B
    List<AdminIuranCard> listDataWargaB = [];
    for (int i = 0; i < 20; i++) {
      listDataWargaB.add(
        const AdminIuranCard(
          profileBadge: "A-20",
          profileImage:
              "https://i.pinimg.com/564x/2f/fd/2a/2ffd2af47e1647ed1fe9cc3dd15aabc0.jpg",
          profileName: "Ahmad Sujadi",
          profileNumber: "0890876542",
        ),
      );
    }

    // List C
    List<AdminIuranCard> listDataWargaC = [];
    for (int i = 0; i < 12; i++) {
      listDataWargaC.add(
        const AdminIuranCard(
          profileBadge: "A-20",
          profileImage:
              "https://i.pinimg.com/564x/2f/fd/2a/2ffd2af47e1647ed1fe9cc3dd15aabc0.jpg",
          profileName: "Ahmad Sujadi",
          profileNumber: "0890876542",
        ),
      );
    }

    // List D
    List<AdminIuranCard> listDataWargaD = [];
    for (int i = 0; i < 5; i++) {
      listDataWargaD.add(
        const AdminIuranCard(
          profileBadge: "A-20",
          profileImage:
              "https://i.pinimg.com/564x/2f/fd/2a/2ffd2af47e1647ed1fe9cc3dd15aabc0.jpg",
          profileName: "Ahmad Sujadi",
          profileNumber: "0890876542",
        ),
      );
    }

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xffeff0f5),
        body: Column(
          children: [
            // Stack
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 135.w,
                ),
                // Topbar
                const HeaderAdminIuran(text: "Data Blok dan No.Rumah"),

                // Search Bar
                const Positioned(bottom: 0, child: SearchBarAdminIuran()),
              ],
            ),

            24.verticalSpace,

            SizedBox(
              width: 382.w,
              child: Obx(
                () => TabBar(
                  dividerColor: Colors.grey,
                  indicatorWeight: 2.w,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: const Color(0xFF6454F0),
                  onTap: (x) {
                    DataWargaController.to.currentIndex.value = x;
                  },
                  tabs: <Widget>[
                    Tab(
                      child:
                          buildTab(text: "Blok A", text2: "10 Warga", index: 0),
                    ),
                    Tab(
                      child:
                          buildTab(text: "Blok B", text2: "20 Warga", index: 1),
                    ),
                    Tab(
                      child:
                          buildTab(text: "Blok C", text2: "12 Warga", index: 2),
                    ),
                    Tab(
                      child:
                          buildTab(text: "Blok D", text2: "5 Warga", index: 3),
                    ),
                  ],
                ),
              ),
            ),

            19.verticalSpace,

            Expanded(
              child: SizedBox(
                child: TabBarView(
                  children: <Widget>[
                    // Blok A
                    ListView.builder(
                      padding:
                          EdgeInsetsDirectional.symmetric(horizontal: 24.w),
                      itemCount: listDataWargaA.length,
                      itemBuilder: (context, index) {
                        return AdminIuranCard(
                          profileImage: listDataWargaA[index].profileImage,
                          profileName: listDataWargaA[index].profileName,
                          profileNumber: listDataWargaA[index].profileNumber,
                          profileBadge: listDataWargaA[index].profileBadge,
                        );
                      },
                    ),

                    // Blok B
                    ListView.builder(
                      padding:
                          EdgeInsetsDirectional.symmetric(horizontal: 24.w),
                      itemCount: listDataWargaB.length,
                      itemBuilder: (context, index) {
                        return AdminIuranCard(
                          profileImage: listDataWargaB[index].profileImage,
                          profileName: listDataWargaB[index].profileName,
                          profileNumber: listDataWargaB[index].profileNumber,
                          profileBadge: listDataWargaB[index].profileBadge,
                        );
                      },
                    ),

                    // Blok C
                    ListView.builder(
                      padding:
                          EdgeInsetsDirectional.symmetric(horizontal: 24.w),
                      itemCount: listDataWargaC.length,
                      itemBuilder: (context, index) {
                        return AdminIuranCard(
                          profileImage: listDataWargaC[index].profileImage,
                          profileName: listDataWargaC[index].profileName,
                          profileNumber: listDataWargaC[index].profileNumber,
                          profileBadge: listDataWargaC[index].profileBadge,
                        );
                      },
                    ),

                    // Blok D
                    ListView.builder(
                      padding:
                          EdgeInsetsDirectional.symmetric(horizontal: 24.w),
                      itemCount: listDataWargaD.length,
                      itemBuilder: (context, index) {
                        return AdminIuranCard(
                          profileImage: listDataWargaD[index].profileImage,
                          profileName: listDataWargaD[index].profileName,
                          profileNumber: listDataWargaD[index].profileNumber,
                          profileBadge: listDataWargaD[index].profileBadge,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTab({
    required String text,
    required String text2,
    required int index,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: NunitoTextStyle.fw700.copyWith(
            color: (DataWargaController.to.currentIndex.value == index)
                ? const Color(0xFF6454F0)
                : Colors.grey,
            fontSize: 16.sp,
          ),
        ),
        Text(
          text2,
          style: NunitoTextStyle.fw500.copyWith(
            color: (DataWargaController.to.currentIndex.value == index)
                ? const Color(0xFF6454F0)
                : Colors.grey,
            fontSize: 10.sp,
          ),
        )
      ],
    );
  }
}
