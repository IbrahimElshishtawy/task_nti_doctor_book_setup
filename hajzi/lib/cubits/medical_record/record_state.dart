import '../../models/medical_record_model.dart';

abstract class RecordState {}

class RecordInitial extends RecordState {}

class RecordLoading extends RecordState {}

class RecordLoaded extends RecordState {
  final List<MedicalRecordModel> records;
  RecordLoaded(this.records);
}

class RecordError extends RecordState {
  final String error;
  RecordError(this.error);
}
