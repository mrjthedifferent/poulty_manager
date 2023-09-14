import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TypeSelector {
  final FileType type;
  final Widget selector;

  const TypeSelector({required this.type, required this.selector});
}

class SingleFilePicker extends FormBuilderFieldDecoration<PlatformFile?> {
  final bool allowMultiple;

  final bool previewImages;

  final List<TypeSelector> typeSelectors;

  final List<String>? allowedExtensions;

  final void Function(FilePickerStatus)? onFileLoading;

  final bool allowCompression;

  final bool withData;

  final bool withReadStream;

  SingleFilePicker({
    //From Super
    super.key,
    required super.name,
    super.validator,
    super.initialValue,
    super.decoration,
    super.onChanged,
    super.valueTransformer,
    super.enabled,
    super.onSaved,
    super.autovalidateMode = AutovalidateMode.disabled,
    super.onReset,
    super.focusNode,
    this.withData = false,
    this.withReadStream = false,
    this.allowMultiple = false,
    this.previewImages = true,
    this.typeSelectors = const [
      TypeSelector(type: FileType.any, selector: Icon(Icons.add_circle))
    ],
    this.allowedExtensions,
    this.onFileLoading,
    this.allowCompression = true,
  }) : super(
          builder: (FormFieldState<PlatformFile?> field) {
            final state = field as _SingleFilePickerState;

            if (state._files != null) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade700),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        state._files!.name,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () => {
                        state.clearFile(),
                        field.didChange(null),
                      },
                      child: const Icon(Icons.close),
                    ),
                  ],
                ),
              );
            }
            return InkWell(
              onTap: () {
                state.pickFiles(field, FileType.any);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade500),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 10),
                      const Icon(Icons.file_present_outlined),
                      const SizedBox(width: 10),
                      Text('ফাইল যুক্ত করুন',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade700)),
                    ],
                  ),
                ),
              ),
            );

            // return InputDecorator(
            //   decoration: state.decoration.copyWith(
            //       counterText: maxFiles != null
            //           ? '${state._files.length} / $maxFiles'
            //           : null),
            //   child: Column(
            //     children: <Widget>[
            //       customTypeViewerBuilder != null
            //           ? customTypeViewerBuilder(
            //               state.getTypeSelectorActions(typeSelectors, field))
            //           : Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: state.getTypeSelec torActions(
            //                   typeSelectors, field),
            //             ),
            //       const SizedBox(height: 3),
            //       customFileViewerBuilder != null
            //           ? customFileViewerBuilder.call(state._files,
            //               (files) => state._setFiles(files ?? [], field))
            //           : state.defaultFileViewer(state._files,
            //               (files) => state._setFiles(files ?? [], field)),
            //     ],
            //   ),
            // );
          },
        );

  @override
  FormBuilderFieldDecorationState<SingleFilePicker, PlatformFile?>
      createState() => _SingleFilePickerState();
}

class _SingleFilePickerState
    extends FormBuilderFieldDecorationState<SingleFilePicker, PlatformFile?> {
  PlatformFile? _files;

  @override
  void initState() {
    super.initState();
    _files = initialValue;
  }

  Future<void> pickFiles(
      FormFieldState<PlatformFile?> field, FileType fileType) async {
    FilePickerResult? resultList;

    try {
      resultList = await FilePicker.platform.pickFiles(
        type: fileType,
        allowedExtensions: widget.allowedExtensions,
        allowCompression: widget.allowCompression,
        onFileLoading: widget.onFileLoading,
        allowMultiple: widget.allowMultiple,
        withData: widget.withData,
        withReadStream: widget.withReadStream,
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }

    if (!mounted) return;

    if (resultList != null) {
      setState(() => _files = resultList!.files.first);

      field.didChange(_files);
    }
  }

  void _setFiles(PlatformFile files, FormFieldState<PlatformFile?> field) {
    setState(() => _files = files);
    field.didChange(_files);
  }

  void removeFile(FormFieldState<PlatformFile> field) {
    setState(() => _files = null);
    field.didChange(_files);
  }

  void clearFile() {
    setState(() => _files = null);
  }

  Widget defaultFileViewer(
      PlatformFile? files, FormFieldSetter<PlatformFile> setter) {
    if (files != null) {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 10),
            Text(files.name),
            const SizedBox(width: 10),
            InkWell(
              onTap: () => {
                clearFile(),
                setter.call(null),
              },
              child: const Icon(Icons.close),
            ),
          ],
        ),
      );
    }
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Row(
        children: [
          SizedBox(width: 10),
          Icon(Icons.add_circle),
          SizedBox(width: 10),
          Text('Add File'),
        ],
      ),
    );

    // return LayoutBuilder(
    //   builder: (context, constraints) {
    //     const count = 3;
    //     const spacing = 10;
    //     final itemSize =
    //         (constraints.biggest.width - (count * spacing)) / count;
    //     return Wrap(
    //       alignment: WrapAlignment.start,
    //       runAlignment: WrapAlignment.start,
    //       runSpacing: 10,
    //       spacing: 10,
    //       children: List.generate(
    //         files.length,
    //         (index) {
    //           return Container(
    //             height: itemSize,
    //             width: itemSize,
    //             margin: const EdgeInsets.only(right: 2),
    //             child: Stack(
    //               alignment: Alignment.bottomCenter,
    //               children: <Widget>[
    //                 Container(
    //                   alignment: Alignment.center,
    //                   child: (imageFileExts.contains(
    //                               files[index].extension!.toLowerCase()) &&
    //                           widget.previewImages)
    //                       ? widget.withData
    //                           ? Image.memory(files[index].bytes!,
    //                               fit: BoxFit.cover)
    //                           : Image.file(File(files[index].path!),
    //                               fit: BoxFit.cover)
    //                       : Container(
    //                           alignment: Alignment.center,
    //                           color: theme.primaryColor,
    //                           child: Icon(
    //                             getIconData(files[index].extension!),
    //                             color: Colors.white,
    //                             size: 56,
    //                           ),
    //                         ),
    //                 ),
    //                 Container(
    //                   padding: const EdgeInsets.symmetric(horizontal: 2),
    //                   width: double.infinity,
    //                   color: Colors.white.withOpacity(.8),
    //                   child: Text(
    //                     files[index].name,
    //                     style: theme.textTheme.bodySmall,
    //                     maxLines: 2,
    //                     overflow: TextOverflow.clip,
    //                   ),
    //                 ),
    //                 if (enabled)
    //                   Positioned(
    //                     top: 0,
    //                     right: 0,
    //                     child: InkWell(
    //                       onTap: () {
    //                         files.removeAt(index);
    //                         setter.call([...files]);
    //                       },
    //                       child: Container(
    //                         margin: const EdgeInsets.all(3),
    //                         decoration: BoxDecoration(
    //                           color: Colors.grey.withOpacity(.7),
    //                           shape: BoxShape.circle,
    //                         ),
    //                         alignment: Alignment.center,
    //                         height: 22,
    //                         width: 22,
    //                         child: const Icon(
    //                           Icons.close,
    //                           size: 18,
    //                           color: Colors.white,
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //               ],
    //             ),
    //           );
    //         },
    //       ),
    //     );
    //   },
    // );
  }

  @override
  void reset() {
    super.reset();
    setState(() => _files = widget.initialValue);
  }
}
