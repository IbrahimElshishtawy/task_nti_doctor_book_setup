import 'package:bloc/bloc.dart';
import 'appointment_state.dart';
import '../../services/appointment_service.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  final AppointmentService appointmentService;
  AppointmentCubit(this.appointmentService) : super(AppointmentInitial());

  Future<void> fetchAppointments(String userId) async {
    emit(AppointmentLoading());
    try {
      final appointments = await appointmentService.getAppointments(userId);
      emit(AppointmentLoaded(appointments));
    } catch (e) {
      emit(AppointmentError(e.toString()));
    }
  }
}
