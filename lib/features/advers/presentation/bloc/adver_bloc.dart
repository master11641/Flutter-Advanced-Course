import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/resources/data_state.dart';
import 'package:flutter_advanced_course/features/advers/data/models/adver_model/adver_model.dart';
import 'package:flutter_advanced_course/features/advers/domain/entities/adver_entity.dart';

import 'package:flutter_advanced_course/features/advers/presentation/bloc/adver_status.dart';


import '../../data/models/adver_input_model/fetch_input_model.dart';
import '../../domain/use_cases/get_advers_usecase.dart';

part 'adver_event.dart';
part 'adver_state.dart';

class AdverBloc extends Bloc<AdverEvent, AdverState> {
  final GetAdversUseCase getAdversUseCase;
  List<Items> adverItems = [];
  List<int> pageFetchedNumbers = [];
  List<int> pageFetchingNumbers = [];
  // bool filterActive = false;
  bool hasMore = true;
  FetchInputModel fetchInputModel = FetchInputModel()
    ..pageNumber = 1
    ..itemsInPage = 10;
  bool get catFilterIsActive {
    if (fetchInputModel.catId != null ) {
      return true;
    }
    return false;
  }

  AdverBloc(this.getAdversUseCase)
      : super(AdverState(adverStatus: AdverInit())) {
    on<AdverFetchEvent>((event, emit) async {
      //prevent duplicate fetch page number from server
      if (pageFetchingNumbers.contains(fetchInputModel.pageNumber) ||
          hasMore == false) {
        return;
      } else {
        pageFetchingNumbers.add(fetchInputModel.pageNumber!);
      }
      if (fetchInputModel.pageNumber == 1) {
        //progressIndicatore show in view
        emit(state.copyWith(newAdverStatus: AdverInit()));
      }

      DataState<AdverEntity> dataState =
          await getAdversUseCase(fetchInputModel);
      if (dataState is DataSuccess) {
        if (!pageFetchedNumbers.contains(dataState.data!.page!)) {
          hasMore = dataState.data!.hasMore!;
          pageFetchedNumbers.add(dataState.data!.page!);
          adverItems.addAll(dataState.data!.items!);
          dataState.data!.items = adverItems;
        }
        emit(state.copyWith(newAdverStatus: AdverCompleted(dataState.data!)));
      }

      if (dataState is DataFailed) {
        emit(state.copyWith(newAdverStatus: AdverError(dataState.error!)));
      }
    });

    on<AdverFilterEvent>((event, emit) async {
      adverItems.clear();
      hasMore = true;
      pageFetchedNumbers.clear();
      pageFetchingNumbers.clear();
      fetchInputModel
        ..pageNumber = 1
        ..itemsInPage = 10;
        //fetch from server  accure only on AdverEvent 
      AdverEvent event = AdverFetchEvent();
      add(event);
    });
  }
}
