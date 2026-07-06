import 'package:doc_doc/core/helpers/spacing.dart';
import 'package:doc_doc/features/home/data/models/specializations_response_model.dart';
import 'package:doc_doc/features/home/logic/home_cubit.dart';
import 'package:doc_doc/features/home/logic/home_state.dart';
import 'package:doc_doc/features/home/views/widgets/doctors_list/doctors_shimmer_loading.dart';
import 'package:doc_doc/features/home/views/widgets/specialization/speciality_list_view.dart';
import 'package:doc_doc/features/home/views/widgets/specialization/speciality_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecializationsListView extends StatelessWidget {
  const SpecializationsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState<SpecializationsResponseModel>>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Failure,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => setupLoading(),
          success: (doctors) => setupSuccess(doctors),
          error: (message) => setupError(),
          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }

  /// shimmer loading for specializations and doctors
  Widget setupLoading() {
    return Expanded(
      child: Column(
        children: [
          const SpecialityShimmerLoading(),
          verticalSpace(8),
          const DoctorsShimmerLoading(),
        ],
      ),
    );
  }

  Widget setupSuccess(SpecializationsResponseModel specializationsList) {
    return SpecialityListView(
      specializationDataList: specializationsList.specializationDataList ?? [],
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
