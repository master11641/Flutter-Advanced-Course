
import 'package:flutter_advanced_course/core/usecase/use_case.dart';
import 'package:flutter_advanced_course/features/advers/domain/entities/adver_entity.dart';
import 'package:flutter_advanced_course/features/advers/domain/repository/adver_repository.dart';

import '../../../../core/resources/data_state.dart';
import '../../data/models/adver_input_model/fetch_input_model.dart';

class GetAdversUseCase extends UseCase<DataState<AdverEntity>, FetchInputModel>{
  final AdverRepository adverRepository;
  GetAdversUseCase(this.adverRepository);
  @override
  Future<DataState<AdverEntity>> call(FetchInputModel param) {
     return   adverRepository.fetchAdvers(param);
  }
     
}