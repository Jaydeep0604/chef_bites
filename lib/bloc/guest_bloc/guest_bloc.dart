import 'package:bloc/bloc.dart';
import 'package:chef_bites/bloc/guest_bloc/guest_event.dart';
import 'package:chef_bites/bloc/guest_bloc/guest_state.dart';
import 'package:chef_bites/model/guest_model.dart';
import 'package:chef_bites/repo/guest_repo.dart';

class GuestBloc extends Bloc<GuestEvent, GuestState> {
  GuestRepo repo;
  GuestBloc({required this.repo}) : super(InitialGuestState()) {
    on<GuestEvent>(_onGuestEvent);
  }
  _onGuestEvent(GuestEvent event, Emitter<GuestState> emit) async {
    try {
      emit(LoadingGuestState());
      List<GuestModel> gData = (await repo.getGuestData());
      if (gData.isEmpty) {
        emit(NoGuestState());
      } else {
        emit(LoadedGuestState(guestModel: gData));
      }
    } catch (e) {
      emit(ErrorGuesrState(msg: e.toString()));
    }
  }
}
