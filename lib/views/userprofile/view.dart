import'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq/core/ui/appbar.dart';
import 'package:rafiq/views/userprofile/widgets/academichistory/cubit/model.dart';
import 'package:rafiq/views/userprofile/widgets/academichistory/view.dart';
import 'package:rafiq/views/userprofile/widgets/gpasimulator/view.dart';
import 'package:rafiq/views/userprofile/widgets/progresscards/cubit/model.dart';
import 'package:rafiq/views/userprofile/widgets/progresscards/view.dart';
import 'package:rafiq/views/profile/widgets/studentdetails/cubit/model.dart';


class UserProfileView extends StatelessWidget {
  final File? userImage;
  final ProfileUserModel user;
  const UserProfileView({
    super.key,
    this.userImage,
    required this.user,
  });



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40.r,
                      backgroundImage: userImage != null
                          ? FileImage(userImage!)
                          : const AssetImage(
                        'assets/images/default_avatar.png',
                      ) as ImageProvider,
                    ),
                    SizedBox(width: 16.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              user.firstName,
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              user.lastName,
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "رقم الطالب: ${user.studentCode}",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: const Color(0xFF9092A2),
                          ),
                        ),

                        SizedBox(height: 8.h),
                        Text(
                          "القسم: ذكاء اصطناعى",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: const Color(0xFF9092A2),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 24.h),


                ProgressCards(
                  progress: fakeStudentProgress,
                ),

                //SizedBox(height: 24.h),
                //GPASimulatorCard(),
                SizedBox(height: 24.h),
                //AcademicHistoryView(),
                AcademicHistoryView(
                  semester: fakeSemester,
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
