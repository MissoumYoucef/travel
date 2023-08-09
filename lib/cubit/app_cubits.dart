import 'package:bloc/bloc.dart';
import 'package:travelapp/cubit/app_cubit_state.dart';

import '../models/data_models.dart';
import '../services/data_services.dart';

class AppCubits extends Cubit<CubitState> {

  final DataServices dataServices;

  AppCubits(this.dataServices) : super(InitialState()){
    emit(WelcomeState());
  }

   void fetchdetailedPlace(Place place) {
    emit(PlaceState(place: place));
  }
  
  void fetchPlaces() async {
    try {

      emit(LoadingState());

      List<Place> places = await dataServices.getInfo();

      emit(LoadedState(places: places));
    } catch (e) {
      // Handle error state if needed
    }
  }
}
