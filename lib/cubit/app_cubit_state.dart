import 'package:equatable/equatable.dart';
import '../models/data_models.dart';

abstract class CubitState extends Equatable {}

class InitialState extends CubitState {

  @override
  List<Object?> get props => [];
}

class WelcomeState extends CubitState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends CubitState {
  @override
  List<Object?> get props => [];
  
}

class LoadedState extends CubitState {

  final List<Place> places;

  LoadedState({required this.places});
  @override
  List<Object?> get props => [places];
}

class PlaceState extends CubitState {
  final Place place;

  PlaceState({required this.place});
  @override
  List<Place> get props => [place];
}
