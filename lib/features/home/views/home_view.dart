import 'package:doc_doc/core/helpers/spacing.dart';
import 'package:doc_doc/features/home/views/widgets/doctor_speciality_see_all.dart';
import 'package:doc_doc/features/home/views/widgets/doctors_blue_container.dart';
import 'package:doc_doc/features/home/views/widgets/doctors_list/doctors_list.dart';
import 'package:doc_doc/features/home/views/widgets/home_top_bar.dart';
import 'package:doc_doc/features/home/views/widgets/specialization_list_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 28.0),
          child: Column(
            children: [
              HomeTopBar(),
              SizedBox(height: 24),
              DoctorsBlueContainer(),
              verticalSpace(24),
              DoctorsSpecialitySeeAll(),
              verticalSpace(18),
              SpecializationsListView(),
              verticalSpace(8),
              DoctorsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
