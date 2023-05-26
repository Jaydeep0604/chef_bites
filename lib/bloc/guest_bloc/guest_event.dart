import 'package:equatable/equatable.dart';

abstract class GuestEvent extends Equatable {}

class fetchGuestEvent extends GuestEvent {
  @override 
  List<Object?> get props => [];
}
