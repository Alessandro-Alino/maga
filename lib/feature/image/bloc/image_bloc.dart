import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maga/feature/image/model/image_model.dart';
import 'package:maga/feature/image/repo/image_repo.dart';

part 'image_state.dart';

part 'image_event.dart';

part 'image_bloc.freezed.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImageRepo imageRepo;
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  ImageBloc(this.imageRepo) : super(ImageState.initState()) {
    on<_InitialEvent>((event, emit) => _initial(event, emit));
    on<_GetImagesEvent>((event, emit) async => await _getImages(event, emit));
    on<_GetOneImageEvent>(
      (event, emit) async => await _getOneImage(event, emit, event.id),
    );
    on<_SelectImageEvent>(
      (event, emit) => _selectImage(event, emit, event.image),
    );
  }

  //-------------------------------//

  // Initial
  initial() => add(ImageEvent.initial());

  // Get Images
  getImages() => add(ImageEvent.getImages());

  // Get ONE Image
  getOneImage({required int id}) => add(ImageEvent.getOneImage(id: id));

  // Select Images
  selectImages({ImageModel? image}) =>
      add(ImageEvent.selectImage(image: image));

  //-------------------------------//

  // _Initial
  _initial(ImageEvent event, Emitter<ImageState> emit) {
    emit(ImageState.initState());
  }

  // _Get Images
  Future<void> _getImages(ImageEvent event, Emitter<ImageState> emit) async {
    emit(
      state.copyWith(
        status: ImageStatus.loading,
        manageStatus: ManageImageStatus.initial,
      ),
    );
    int page = 1;
    int perPage = 100;
    List<ImageModel> imageList = [];
    try {
      Response<dynamic> response = await imageRepo.getImages(
        page: page,
        perPage: perPage,
      );
      log('${response.realUri}');
      // Total number Image
      int totalImage = int.parse(
        response.headers.map.entries
            .singleWhere((e) => e.key == 'x-wp-total')
            .value
            .first,
      );
      // Total Pages
      int pages = int.parse(
        response.headers.map.entries
            .singleWhere((e) => e.key == 'x-wp-totalpages')
            .value
            .first,
      );
      // Image List
      List<ImageModel> firstImageList =
          (response.data as List).map((e) => ImageModel.fromJson(e)).toList();
      // Add Element to List
      imageList.addAll(firstImageList);
      emit(
        state.copyWith(
          status: ImageStatus.success,
          fetchedImageList: imageList,
          filterImageList: imageList,
          totalImage: totalImage,
          pages: pages,
          currentPage: page,
        ),
      );
      // Pagination
      while (page < pages) {
        page++;
        Response<dynamic> nextResponse = await imageRepo.getImages(
          page: page,
          perPage: perPage,
        );
        List<ImageModel> nextPageImage =
            (nextResponse.data as List)
                .map((e) => ImageModel.fromJson(e))
                .toList();
        imageList.addAll(nextPageImage);
        emit(
          state.copyWith(
            status: ImageStatus.success,
            fetchedImageList: imageList,
            filterImageList: imageList,
            totalImage: totalImage,
            pages: pages,
            currentPage: page,
          ),
        );
      }
    } catch (e) {
      log('BLOC: Error to Fetch Image: $e');
      emit(state.copyWith(status: ImageStatus.error));
    }
  }

  // _Get ONE Image
  Future<void> _getOneImage(
    ImageEvent event,
    Emitter<ImageState> emit,
    int id,
  ) async {
    emit(
      state.copyWith(
        status: ImageStatus.loading,
        manageStatus: ManageImageStatus.initial,
      ),
    );
    try {
      Response<dynamic> response = await imageRepo.getOneImage(id: id);
      emit(state.copyWith(status: ImageStatus.success));
      log('Image $id: $response');
    } catch (e) {
      log('BLOC: Error to Fetch One Image: $e');
      emit(state.copyWith(status: ImageStatus.error));
    }
  }

  // _Select image
  _selectImage(ImageEvent event, Emitter<ImageState> emit, ImageModel? image) {
    if (state.selectedImage != image && image != null) {
      log('Immagine selezionata');
      emit(state.copyWith(selectedImage: image));
    } else {
      log('Immagine rimossa');
      emit(state.copyWith(selectedImage: null));
    }
  }
}
