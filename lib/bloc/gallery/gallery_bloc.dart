import 'package:dotfluttertest/bloc/gallery/gallery_event.dart';
import 'package:dotfluttertest/bloc/gallery/gallery_state.dart';
import 'package:dotfluttertest/core/model/gallery_model.dart';
import 'package:dotfluttertest/core/repository/Gallery_Repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState>{
 GalleryRepository galleryRepository;

  GalleryBloc({@required this.galleryRepository});

  @override
  // TODO: implement initialState
  GalleryState get initialState => GalleryInitialState();

  @override
  Stream<GalleryState> mapEventToState(GalleryEvent event) async* {
    if ( event is FetchGalleryEvent) {
      yield GalleryLoadingState();
      try {
        List<Gallery> gallery = await galleryRepository.getGallery();
        yield GalleryLoadedState(gallery: gallery);
      }catch(e){
        yield GalleryErrorState(message: e);
      }
    }
  }



}