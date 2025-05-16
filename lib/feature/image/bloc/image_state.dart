part of 'image_bloc.dart';

@freezed
sealed class ImageState with _$ImageState {
  const factory ImageState({
    required ImageStatus status,
    required ManageImageStatus manageStatus,
    required List<ImageModel> fetchedImageList,
    required List<ImageModel> filterImageList,
    required int totalImage,
    required int pages,
    required int currentPage,
    ImageModel? selectedImage,
    String? errorMessage,
  }) = _ImageState;

  static initState() => ImageState(
    status: ImageStatus.initial,
    manageStatus: ManageImageStatus.initial,
    fetchedImageList: [],
    filterImageList: [],
    errorMessage: null,
    totalImage: 0,
    pages: 0,
    selectedImage: null,
    currentPage: 0,
  );
}

enum ImageStatus { initial, loading, success, error }

enum ManageImageStatus { initial, loading, success, error }
