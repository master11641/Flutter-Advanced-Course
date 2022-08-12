import '../../../../core/resources/data_state.dart';
import '../../data/models/adver_input_model/fetch_input_model.dart';
import '../entities/adver_entity.dart';

abstract class AdverRepository {
  Future<DataState<AdverEntity>> fetchAdvers(FetchInputModel fetchInputModel);
}
