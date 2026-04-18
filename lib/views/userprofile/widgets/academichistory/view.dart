// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import 'cubit/model.dart';
//
// class AcademicHistoryView extends StatelessWidget {
//   final SemesterModel semester;
//
//   const AcademicHistoryView({super.key
//   required this.semester,
//
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.all(16.w),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12.r),
//         color: const Color(0xFFE8F2FC),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Title
//           Text(
//             "التاريخ الأكاديمي",
//             style: TextStyle(
//               fontSize: 18.sp,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//
//           SizedBox(height: 16.h),
//
//           // Semester + GPA
//           Row(
//             children: [
//               Expanded(
//                 child: Text(
//                   "خريف 2025",
//                   style: TextStyle(
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 12.w,
//                   vertical: 4.h,
//                 ),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(9999.r),
//                   color: const Color(0xFFA3C9F5),
//                 ),
//                 child: Text(
//                   "GPA: 3.7",
//                   style: TextStyle(
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.w400,
//                     color: const Color(0xFF1564BF),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//
//           SizedBox(height: 12.h),
//
//           // Course card
//           Container(
//             width: double.infinity,
//             padding: EdgeInsets.all(12.w),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8.r),
//               color: const Color(0xFFFDFDFC),
//             ),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       "CS-305",
//                       style: TextStyle(
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w500,
//                         color: const Color(0xFF17181C),
//                       ),
//                     ),
//                     const Spacer(),
//                     Text(
//                       "3 ساعات",
//                       style: TextStyle(
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w500,
//                         color: const Color(0xFF17181C),
//                       ),
//                     ),
//                   ],
//                 ),
//
//                 SizedBox(height: 2.h),
//
//                 Row(
//                   children: [
//                     Text(
//                       "هياكل البيانات",
//                       style: TextStyle(
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w500,
//                         color: const Color(0xFF9092A2),
//                       ),
//                     ),
//                     const Spacer(),
//                     Text(
//                       "A",
//                       style: TextStyle(
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w600,
//                         color: const Color(0xFF1564BF),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubit/model.dart';
class AcademicHistoryView extends StatelessWidget {
  final SemesterModel semester;

  const AcademicHistoryView({
    super.key,
    required this.semester,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: const Color(0xFFE8F2FC),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "التاريخ الأكاديمي",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
          ),

          SizedBox(height: 16.h),

          Row(
            children: [
              Expanded(
                child: Text(
                  semester.semesterName,
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9999.r),
                  color: const Color(0xFFA3C9F5),
                ),
                child: Text(
                  "GPA: ${semester.gpa}",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF1564BF),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          ...semester.courses.map((course) {
            return Container(
              margin: EdgeInsets.only(bottom: 8.h),
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: const Color(0xFFFDFDFC),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(course.code),
                      const Spacer(),
                      Text("${course.creditHours} ساعات"),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      Text(course.name),
                      const Spacer(),
                      Text(
                        course.grade,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1564BF),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
