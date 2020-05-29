import 'package:dotfluttertest/bloc/place/place_state.dart';
import 'package:dotfluttertest/bloc/place/places_event.dart';
import 'package:dotfluttertest/core/model/places_model.dart';
import 'package:dotfluttertest/core/repository/Dot_Repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaceBloc extends Bloc<PlaceEvent, PlaceState>{
  PlaceRepository repository;

  PlaceBloc({@required this.repository});

  @override
  PlaceState get initialState => PlaceInitialState();

  @override
  Stream<PlaceState> mapEventToState(PlaceEvent event) async*{
    if(event is FetchPlaceEvent){
        yield PlaceLoadingState();
      try{
        List<Place> places = await repository.getPlace();
        yield PlaceLoadedState(place: places);
      }catch(e){
        yield PlaceErrorState(message: e);
      }
    }
  }

}