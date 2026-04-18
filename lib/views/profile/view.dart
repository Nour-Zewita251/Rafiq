// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:rafiq/core/ui/filledbutton.dart';
// import 'package:rafiq/views/profile/widgets/imagepicker/view.dart';
// import 'package:rafiq/views/profile/widgets/studentdetails/view.dart';
// import '../../core/logic/helper_method.dart';
// import 'package:rafiq/views/userprofile/view.dart';
// import 'package:rafiq/core/ui/appbar.dart';
//
// class ProfileView extends StatefulWidget {
//   const ProfileView({super.key});
//
//   @override
//   State<ProfileView> createState() => _ProfileViewState();
// }
//
// class _ProfileViewState extends State<ProfileView> {
//   final _formKey = GlobalKey<FormState>();
//
//   final TextEditingController firstNameController = TextEditingController();
//   final TextEditingController lastNameController = TextEditingController();
//   final TextEditingController studentCodeController = TextEditingController();
//   final TextEditingController idController = TextEditingController();
//
//   File? selectedImage;
//
//   void onSave() {
//     if (_formKey.currentState!.validate()) {
//       // Debug print
//       debugPrint(firstNameController.text);
//       debugPrint(lastNameController.text);
//       debugPrint(studentCodeController.text);
//       debugPrint(idController.text);
//
//       // Navigate after successful validation
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => UserProfileView(
//             userImage: selectedImage,
//             firstName: firstNameController.text,
//             lastName: lastNameController.text,
//             studentCode: studentCodeController.text,
//           ),
//         ),
//       );
//     }
//   }
//
//   @override
//   void dispose() {
//     firstNameController.dispose();
//     lastNameController.dispose();
//     studentCodeController.dispose();
//     idController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppBar(),
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding:  EdgeInsets.symmetric(horizontal: 18.w),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 32.h),
//
//                   // Image Picker
//                   Center(
//                     child: ProfileImagePicker(
//                       image: selectedImage,
//                       onPick: () async {
//                         final picked = await ImagePicker().pickImage(
//                           source: ImageSource.gallery,
//                         );
//
//                         if (picked != null) {
//                           setState(() {
//                             selectedImage = File(picked.path);
//                           });
//                         }
//                       },
//                     ),
//
//                   ),
//
//                    SizedBox(height: 80.h),
//
//                   StudentDetails(
//                     label: "الاسم الأول",
//                     controller: firstNameController,
//                     validator: (value) =>
//                     value!.isEmpty ? "الحقل مطلوب" : null,
//                   ),
//
//                   SizedBox(height: 24.h),
//
//                   StudentDetails(
//                     label: "الاسم الأخير",
//                     controller: lastNameController,
//                     validator: (value) =>
//                     value!.isEmpty ? "الحقل مطلوب" : null,
//                   ),
//
//                   SizedBox(height: 24.h),
//
//                   StudentDetails(
//                     label: "كود الطالب",
//                     controller: studentCodeController,
//                     validator: (value) =>
//                     value!.length < 9 ? "كود الطالب غير صحيح" : null,
//                   ),
//
//                   SizedBox(height: 24.h),
//
//                   StudentDetails(
//                     label: "رقم البطاقة",
//                     controller: idController,
//                     validator: (value) =>
//                     value!.length < 14 ? "رقم البطاقة غير صحيح" : null,
//                   ),
//
//                  SizedBox(height: 72.h),
//
//
//                   CustomFilledButton(
//                     text: "حفظ التغييرات",textStyle:TextStyle(
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.w500,
//                   ),
//                     width: double.infinity,
//                     height: 42.h,
//                     radius: 14.r,
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         if (selectedImage == null) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(content: Text("الرجاء اختيار صورة")),
//                           );
//                           return;
//                         }
//                         goTo(UserProfileView(
//                           userImage: selectedImage,
//                           firstName: firstNameController.text,
//                           lastName: lastNameController.text,
//                           studentCode: studentCodeController.text,
//                         ));
//                       }
//                     },
//                   ),
//
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
///////////////
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:rafiq/core/ui/appbar.dart';
// import 'package:rafiq/core/ui/filledbutton.dart';
// import 'package:rafiq/views/profile/widgets/imagepicker/view.dart';
// import 'package:rafiq/views/profile/widgets/studentdetails/view.dart';
//
// import '../../core/logic/helper_method.dart';
// import '../userprofile/view.dart';
//
// class ProfileView extends StatefulWidget {
//   // 👇 البيانات دي جاية من API
//   final String firstName;
//   final String lastName;
//   final String studentCode;
//   final String nationalId;
//
//   const ProfileView({
//     super.key,
//     required this.firstName,
//     required this.lastName,
//     required this.studentCode,
//     required this.nationalId,
//   });
//
//   @override
//   State<ProfileView> createState() => _ProfileViewState();
// }
//
// class _ProfileViewState extends State<ProfileView> {
//   File? selectedImage;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//      // appBar: const CustomAppBar(),
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.symmetric(horizontal: 18.w),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 78.h),
//
//               /// Image Picker (الجزء الوحيد التفاعلي)
//               Center(
//                 child: ProfileImagePicker(
//                   image: selectedImage,
//                   onPick: () async {
//                     final picked = await ImagePicker().pickImage(
//                       source: ImageSource.gallery,
//                     );
//
//                     if (picked != null) {
//                       setState(() {
//                         selectedImage = File(picked.path);
//                       });
//                     }
//                   },
//                 ),
//               ),
//
//               SizedBox(height: 80.h),
//
//               /// بيانات من API (Display فقط)
//               StudentDetails(
//                 label: "الاسم الأول",
//                 value: widget.firstName,
//               ),
//
//               SizedBox(height: 24.h),
//
//               StudentDetails(
//                 label: "الاسم الأخير",
//                 value: widget.lastName,
//               ),
//
//               SizedBox(height: 24.h),
//
//               StudentDetails(
//                 label: "كود الطالب",
//                 value: widget.studentCode,
//               ),
//
//               SizedBox(height: 24.h),
//
//               StudentDetails(
//                 label: "رقم البطاقة",
//                 value: widget.nationalId,
//               ),
//
//               SizedBox(height: 72.h),
//
//               CustomFilledButton(
//                 text: "حفظ التغييرات",
//                 textStyle: TextStyle(
//                   fontSize: 16.sp,
//                   fontWeight: FontWeight.w500,
//                 ),
//                 width: double.infinity,
//                 height: 48.h,
//                 radius: 14.r,
//                 onPressed: () {
//                   if (selectedImage == null) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text("الرجاء اختيار صورة"),
//                       ),
//                     );
//                     return;
//                   }
//                   goTo(UserProfileView(
//                           userImage: selectedImage, firstName: '', lastName: '', studentCode: '',
//                          ));
//
//                   /// 👇 هنا لاحقًا
//                   /// send image to API
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rafiq/core/ui/appbar.dart';
import 'package:rafiq/core/ui/filledbutton.dart';
import 'package:rafiq/views/profile/widgets/imagepicker/view.dart';
import 'package:rafiq/views/profile/widgets/studentdetails/cubit/model.dart';
import 'package:rafiq/views/profile/widgets/studentdetails/view.dart';

import '../../core/logic/helper_method.dart';
import '../userprofile/view.dart';

class ProfileView extends StatefulWidget {
  final ProfileUserModel user;

  const ProfileView({
    super.key,
    required this.user,
  });

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: const CustomAppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(height: 56.h),

              Center(
                child: ProfileImagePicker(
                  image: selectedImage,
                  onPick: () async {
                    final picked = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);

                    if (picked != null) {
                      setState(() {
                        selectedImage = File(picked.path);
                      });
                    }
                  },
                ),
              ),

              SizedBox(height: 64.h),

              /// بيانات جاية من API (عرض فقط)
              StudentDetails(
                label: "الاسم الأول",
                value: widget.user.firstName,
              ),

              SizedBox(height: 24.h),

              StudentDetails(
                label: "الاسم الأخير",
                value: widget.user.lastName,
              ),

              SizedBox(height: 24.h),

              StudentDetails(
                label: "كود الطالب",
                value: widget.user.studentCode,
              ),

              SizedBox(height: 24.h),

              StudentDetails(
                label: "رقم البطاقة",
                value: widget.user.nationalId,
              ),

              SizedBox(height: 64.h),

              CustomFilledButton(
                text: "حفظ التغييرات",
                width: double.infinity,
                height: 56.h,
                radius: 14.r,
                onPressed: () {
                  if (selectedImage == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("الرجاء اختيار صورة"),
                      ),
                    );
                    return;
                  }
                  goTo(
                      UserProfileView(
                        user: ProfileUserModel.fromJson({}),
                        userImage: selectedImage,
                      ),
                  );

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
