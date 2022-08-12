part of 'adver_bloc.dart';

class AdverState {
  AdverStatus adverStatus;
  AdverState({required this.adverStatus});
  AdverState copyWith({
    AdverStatus? newAdverStatus,
  }) {  
    return AdverState(
      adverStatus: newAdverStatus ?? this.adverStatus,
    );
  }
  
}
