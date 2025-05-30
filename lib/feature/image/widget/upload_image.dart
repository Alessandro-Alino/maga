import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maga/feature/image/bloc/image_bloc.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  late final ImageBloc _imageBloc;
  final TextEditingController _nameImage = TextEditingController();

  @override
  void initState() {
    super.initState();
    _imageBloc = context.read<ImageBloc>();
  }

  @override
  void dispose() {
    _nameImage.dispose();
    _imageBloc.chooseImage(reset: true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              centerTitle: true,
              scrolledUnderElevation: 0.0,
              leading: const SizedBox.shrink(),
              title: const Text('Upload Foto'),
              backgroundColor: Colors.transparent,
              actionsPadding: const EdgeInsets.only(right: 8.0),
              actions: [
                IconButton(
                  onPressed: () => context.router.pop(),
                  icon: Icon(Icons.close),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                spacing: 16.0,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image Selected
                  Container(
                    width: 300.0,
                    height: 300.0,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: BlocBuilder<ImageBloc, ImageState>(
                      builder: (context, state) {
                        return state.choosedImage != null
                            ? Image.file(state.choosedImage!)
                            : const SizedBox.shrink();
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ActionChip(
                        onPressed: () {
                          _imageBloc.chooseImage();
                        },
                        label: const Text('Seleziona Immagine'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: Row(
                spacing: 8.0,
                children: [
                  // Go Back
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        context.router.pop();
                      },
                      child: const Text('Indietro'),
                    ),
                  ),
                  // Upload Photo
                  BlocConsumer<ImageBloc, ImageState>(
                    listener: (context, state) {
                      if (state.manageStatus == ManageImageStatus.success) {
                        context.router.pop();
                      }
                    },
                    builder: (context, state) {
                      return Expanded(
                        child: FilledButton(
                          onPressed:
                              state.manageStatus == ManageImageStatus.loading
                                  ? null
                                  : () {
                                    if (state.choosedImage != null) {
                                      context.read<ImageBloc>().uploadImage(
                                        image: state.choosedImage!,
                                      );
                                    }
                                  },
                          child: Text(
                            state.manageStatus == ManageImageStatus.loading
                                ? 'Uploading...'
                                : 'Upload',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
