import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maga/feature/category/bloc/category_bloc.dart';
import 'package:maga/feature/category/model/category.dart';
import 'package:maga/feature/category/widget/selected_image.dart';
import 'package:maga/feature/image/bloc/image_bloc.dart';
import 'package:maga/feature/image/model/image_model.dart';
import 'package:maga/widget/app_textfield.dart';
import 'package:maga/feature/category/widget/categ_image.dart';
import 'package:maga/feature/image/widget/image_grid.dart';

@RoutePage()
class ManageCategoryPage extends StatefulWidget {
  const ManageCategoryPage({super.key, @PathParam('id') this.id, this.categ});

  final int? id;
  final CategModel? categ;

  @override
  State<ManageCategoryPage> createState() => _ManageCategoryPageState();
}

class _ManageCategoryPageState extends State<ManageCategoryPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _parentCategCntr = TextEditingController();
  final TextEditingController _nomeCategCntr = TextEditingController();
  final TextEditingController _descCategCntr = TextEditingController();
  final ValueNotifier<ImageModel?> _imageSel = ValueNotifier<ImageModel?>(null);
  final ValueNotifier<int> _parentCateg = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    if (widget.categ != null) {
      _initTextFormField();
    }
  }

  @override
  void dispose() {
    _parentCategCntr.dispose();
    _nomeCategCntr.dispose();
    _descCategCntr.dispose();
    _imageSel.dispose();
    super.dispose();
  }

  // Init the TextFormField
  _initTextFormField() {
    // Parent Value
    _parentCateg.value = widget.categ!.parent;
    // Parent Name
    _parentCategCntr.text =
        widget.categ!.parent == 0
            ? 'Categoria Genitore'
            : context
                .read<CategoryBloc>()
                .state
                .fetchedCategoriesList
                .singleWhere((e) => e.id == widget.categ!.parent)
                .name;
    // Categ Name
    _nomeCategCntr.text = widget.categ!.name;
    // Categ Description
    _descCategCntr.text = widget.categ?.description ?? '';
  }

  // Open the modal Bottom Sheet to select the CategImage
  _showModalImageGrid() {
    return showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (context, controller) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Theme.of(context).canvasColor,
              ),
              margin: const EdgeInsets.all(8.0),
              child: ImageGrid(controller: controller),
            );
          },
        );
      },
    );
  }

  _unselectImage() {
    if (context.read<ImageBloc>().state.selectedImage != null) {
      context.read<ImageBloc>().selectImage(image: null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // When navigate back, reset the selected image.
      onPopInvokedWithResult: (b, result) {
        _unselectImage();
      },
      child: BlocListener<CategoryBloc, CategoryState>(
        listener: (context, state) {
          if (state.manageStatus == ManageCategStatus.success) {
            context.router.pop();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              '${widget.categ == null ? 'Crea' : 'Modifica'} Categoria',
            ),
          ),
          body: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 1400.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    spacing: 16.0,
                    children: [
                      // Image Categ
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                // Open the modal Bottom Sheet to select the CategImage
                                _showModalImageGrid();
                              },
                              child: BlocConsumer<ImageBloc, ImageState>(
                                listener: (context, state) async {
                                  // Delayed image disappear when selected image is null
                                  if (state.selectedImage != null) {
                                    _imageSel.value = state.selectedImage;
                                  }
                                },
                                builder: (context, state) {
                                  return Stack(
                                    children: [
                                      // Current image
                                      AnimatedScale(
                                        duration: Durations.long4,
                                        scale:
                                            state.selectedImage != null
                                                ? 0.7
                                                : 1.0,
                                        child: CategImage(
                                          src: widget.categ?.image?.src,
                                          width: 250.0,
                                          height: 250.0,
                                        ),
                                      ),
                                      // Selected Image
                                      SelectedImage(imageSel: _imageSel.value),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Parent Categ
                      DropdownMenu(
                        initialSelection: widget.categ == null ? 0 : null,
                        menuHeight: 400.0,
                        width: 250.0,
                        controller: _parentCategCntr,
                        onSelected: (e) {
                          _parentCateg.value = e!;
                        },
                        dropdownMenuEntries: [
                          DropdownMenuEntry(
                            value: 0,
                            label: 'Categoria Genitore',
                          ),
                          ...context
                              .read<CategoryBloc>()
                              .state
                              .fetchedCategoriesList
                              .map((categ) {
                                return DropdownMenuEntry(
                                  value: categ.id,
                                  label: categ.name,
                                  enabled:
                                      categ.id == 15 ||
                                              categ.id == widget.categ?.id
                                          ? false
                                          : true,
                                );
                              }),
                        ],
                      ),
                      // Nome Categ
                      AppTextField(
                        controller: _nomeCategCntr,
                        hintText: 'Nome Categoria',
                        validator: (e) {
                          if (e == null || e.isEmpty) {
                            return 'Non può essere vuoto';
                          }
                          return null;
                        },
                      ),
                      // Descrizione Categ
                      AppTextField(
                        controller: _descCategCntr,
                        hintText: 'Descrizione Categoria',
                        validator: (e) {
                          if (e == null || e.isEmpty) {
                            return 'Non può essere vuoto';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          floatingActionButton: BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              return state.manageStatus == ManageCategStatus.loading
                  ? FloatingActionButton(
                    onPressed: () {},
                    child: CircularProgressIndicator.adaptive(),
                  )
                  : FloatingActionButton.extended(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Create Categ
                        if (widget.categ == null) {
                          // Image Selected
                          ImageModelz? categImage =
                              _imageSel.value == null
                                  ? null
                                  : ImageModelz(
                                    id: _imageSel.value!.id,
                                    src: _imageSel.value!.guid.rendered,
                                  );
                          // Categ Managed
                          CategModel category = CategModel(
                            name: _nomeCategCntr.text,
                            parent: _parentCateg.value,
                            description: _descCategCntr.text,
                            image: categImage,
                          );
                          // Create Categ
                          context.read<CategoryBloc>().createCategory(
                            category: category,
                          );
                        }
                        // UPDATE Categ
                        else {
                          // Image Selected
                          ImageModelz? categImage =
                              _imageSel.value == null
                                  ? widget.categ?.image
                                  : ImageModelz(
                                    id: _imageSel.value!.id,
                                    src: _imageSel.value!.guid.rendered,
                                  );
                          // Categ Managed
                          CategModel categUpdate = widget.categ!.copyWith(
                            name: _nomeCategCntr.text,
                            parent: _parentCateg.value,
                            description: _descCategCntr.text,
                            image: categImage,
                          );
                          // Update Categ
                          context.read<CategoryBloc>().updateCategory(
                            category: categUpdate,
                          );
                          // Navigate Back
                          context.router.pop();
                        }
                      }
                    },
                    icon: Icon(Icons.add),
                    label: Text(widget.categ == null ? 'Crea' : 'Modifica'),
                  );
            },
          ),
        ),
      ),
    );
  }
}
