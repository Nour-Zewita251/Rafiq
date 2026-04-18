import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq/views/dashboard/widgets/academicsummarycards/view.dart';
import 'package:rafiq/views/dashboard/widgets/gpaprogress/view.dart';
import 'package:rafiq/views/dashboard/widgets/planprogresscard/view.dart';
import 'package:rafiq/views/dashboard/widgets/welcomecard/view.dart';

import '../../core/ui/appbar.dart';
class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "لوحة التحكم",),
      // body: SafeArea(child: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 16),
      //
      //   child: Column(children: [
      //     SizedBox(height: 20),
      //      WelcomeCard(),
      //      SizedBox(height: 20,),
      //     AcademicSummaryCards(),
      //     SizedBox(height: 20,),
      //     GPAProgress(),
      //
      //   ],),
      // )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 20),
                WelcomeCard(),
                SizedBox(height: 20),
                AcademicSummaryCards(),
                SizedBox(height: 20),
                GPAProgress(),
                SizedBox(height: 20),
                PlanProgressCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
