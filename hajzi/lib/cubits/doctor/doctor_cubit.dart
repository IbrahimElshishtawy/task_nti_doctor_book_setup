import 'package:bloc/bloc.dart';
import 'doctor_state.dart';
import '../../services/doctor_service.dart';

class DoctorCubit extends Cubit<DoctorState> {
  final DoctorService doctorService;
  DoctorCubit(this.doctorService) : super(DoctorInitial());

  Future<void> fetchDoctors() async {
    emit(DoctorLoading());
    try {
      final doctors = await doctorService.getDoctors();
      emit(DoctorLoaded(doctors));
    } catch (e) {
      emit(DoctorError(e.toString()));
    }
  }
}
