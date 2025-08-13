import '../../models/appointment_model.dart';

abstract class AppointmentState {}

class AppointmentInitial extends AppointmentState {}

class AppointmentLoading extends AppointmentState {}

class AppointmentLoaded extends AppointmentState {
  final List<AppointmentModel> appointments;
  AppointmentLoaded(this.appointments);
}

class AppointmentError extends AppointmentState {
  final String error;
  AppointmentError(this.error);
}
