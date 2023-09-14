import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

typedef FileViewerBuilder = Widget Function(
  List<PlatformFile>? files,
  FormFieldSetter<List<PlatformFile>> filesSetter,
);

class TypeSelector {
  final FileType type;
  final Widget selector;

  const TypeSelector({required this.type, required this.selector});
}

class FormBuilderFilePicker
    extends FormBuilderFieldDecoration<List<PlatformFile>> {
  final int? maxFiles;

  final bool allowMultiple;

  final bool previewImages;

  final List<TypeSelector> typeSelectors;

  final List<String>? allowedExtensions;

  final void Function(FilePickerStatus)? onFileLoading;

  final bool allowCompression;

  final bool withData;

  final bool withReadStream;

  final FileViewerBuilder? customFileViewerBuilder;

  final Widget Function(List<Widget> types)? customTypeViewerBuilder;

  FormBuilderFilePicker(
      {
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
      this.maxFiles,
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
      this.customFileViewerBuilder,
      this.customTypeViewerBuilder})
      : super(
          builder: (FormFieldState<List<PlatformFile>?> field) {
            final state = field as _FormBuilderFilePickerState;

            return InputDecorator(
              decoration: state.decoration.copyWith(
                  counterText: maxFiles != null
                      ? '${state._files.length} / $maxFiles'
                      : null),
              child: Column(
                children: <Widget>[
                  customTypeViewerBuilder != null
                      ? customTypeViewerBuilder(
                          state.getTypeSelectorActions(typeSelectors, field))
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: state.getTypeSelectorActions(
                              typeSelectors, field),
                        ),
                  const SizedBox(height: 3),
                  customFileViewerBuilder != null
                      ? customFileViewerBuilder.call(state._files,
                          (files) => state._setFiles(files ?? [], field))
                      : state.defaultFileViewer(state._files,
                          (files) => state._setFiles(files ?? [], field)),
                ],
              ),
            );
          },
        );

  @override
  FormBuilderFieldDecorationState<FormBuilderFilePicker, List<PlatformFile>>
      createState() => _FormBuilderFilePickerState();
}

class _FormBuilderFilePickerState extends FormBuilderFieldDecorationState<
    FormBuilderFilePicker, List<PlatformFile>> {
  static const imageFileExts = [
    'gif',
    'jpg',
    'jpeg',
    'png',
    'webp',
    'bmp',
    'dib',
    'wbmp',
  ];

  List<PlatformFile> _files = [];

  int? get _remainingItemCount =>
      widget.maxFiles == null ? null : widget.maxFiles! - _files.length;

  @override
  void initState() {
    super.initState();
    _files = initialValue ?? [];
  }

  Future<void> pickFiles(
      FormFieldState<List<PlatformFile>?> field, FileType fileType) async {
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
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    if (resultList != null) {
      setState(() => _files = [..._files, ...resultList!.files]);

      field.didChange(_files);
    }
  }

  void _setFiles(
      List<PlatformFile> files, FormFieldState<List<PlatformFile>?> field) {
    setState(() => _files = files);
    field.didChange(_files);
  }

  void removeFileAtIndex(int index, FormFieldState<List<PlatformFile>> field) {
    setState(() => _files.removeAt(index));
    field.didChange(_files);
  }

  Widget defaultFileViewer(
      List<PlatformFile> files, FormFieldSetter<List<PlatformFile>> setter) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        const count = 3;
        const spacing = 10;
        final itemSize =
            (constraints.biggest.width - (count * spacing)) / count;
        return Wrap(
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.start,
          runSpacing: 10,
          spacing: 10,
          children: List.generate(
            files.length,
            (index) {
              return Container(
                height: itemSize,
                width: itemSize,
                margin: const EdgeInsets.only(right: 2),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: (imageFileExts.contains(
                                  files[index].extension!.toLowerCase()) &&
                              widget.previewImages)
                          ? widget.withData
                              ? Image.memory(files[index].bytes!,
                                  fit: BoxFit.cover)
                              : Image.file(File(files[index].path!),
                                  fit: BoxFit.cover)
                          : Container(
                              alignment: Alignment.center,
                              color: theme.primaryColor,
                              child: Icon(
                                getIconData(files[index].extension!),
                                color: Colors.white,
                                size: 56,
                              ),
                            ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      width: double.infinity,
                      color: Colors.white.withOpacity(.8),
                      child: Text(
                        files[index].name,
                        style: theme.textTheme.bodySmall,
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    if (enabled)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            files.removeAt(index);
                            setter.call([...files]);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.7),
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            height: 22,
                            width: 22,
                            child: const Icon(
                              Icons.close,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  List<Widget> getTypeSelectorActions(List<TypeSelector> typeSelectors,
      FormFieldState<List<PlatformFile>?> field) {
    return <Widget>[
      ...typeSelectors.map(
        (typeSelector) => InkWell(
          onTap: enabled &&
                  (null == _remainingItemCount || _remainingItemCount! > 0)
              ? () => pickFiles(field, typeSelector.type)
              : null,
          child: typeSelector.selector,
        ),
      ),
    ];
  }

  IconData getIconData(String fileExtension) {
    final lowerCaseFileExt = fileExtension.toLowerCase();
    if (imageFileExts.contains(lowerCaseFileExt)) return Icons.image;

    return Icons.insert_drive_file;
  }

  @override
  void reset() {
    super.reset();
    setState(() => _files = widget.initialValue ?? []);
  }
}
