import 'package:chef_bites/model/guest_model.dart';
import 'package:equatable/equatable.dart';

abstract class GuestState extends Equatable {}

class InitialGuestState extends GuestState {
  @override
  List<Object?> get props => [];
}

class LoadingGuestState extends GuestState {
  @override
  List<Object?> get props => [];
}

class LoadedGuestState extends GuestState {
  List<GuestModel> guestModel;
  bool hasReachedMax;
  LoadedGuestState({this.hasReachedMax = false, required this.guestModel});
  @override
  List<Object?> get props => [guestModel];
}

class NoGuestState extends GuestState {
  @override
  List<Object?> get props => [];
  @override
  String toString() {
    return "No User Data Available";
  }
}

class ErrorGuesrState extends GuestState {
  String msg;
  ErrorGuesrState({required this.msg});
  @override
  List<Object?> get props => [];
  @override
  String toString() {
    return msg;
  }
}
