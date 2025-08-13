import 'package:bloc/bloc.dart';
import 'record_state.dart';
import '../../services/record_service.dart';

class RecordCubit extends Cubit<RecordState> {
  final RecordService recordService;
  RecordCubit(this.recordService) : super(RecordInitial());

  Future<void> fetchRecords(String userId) async {
    emit(RecordLoading());
    try {
      final records = await recordService.getRecords(userId);
      emit(RecordLoaded(records));
    } catch (e) {
      emit(RecordError(e.toString()));
    }
  }
}
