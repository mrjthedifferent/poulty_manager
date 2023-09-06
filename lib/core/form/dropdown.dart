import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';

import '/config/theme/color.dart';

(Widget Function(), ValueNotifier<T?>) useDropdownFormField<T>(
  T? initialValue, {
  required Either<List<T>, Map<String, T>> items,
  ValueChanged<T?>? onChanged,
  InputDecoration? decoration,
}) {
  final selectedValue = useState<T?>(initialValue);

  useEffect(() {
    if (onChanged != null) {
      selectedValue.addListener(() {
        onChanged(selectedValue.value);
      });
    }

    return () {};
  }, [selectedValue.value]);

  final List<DropdownMenuItem<T>> dropdownItems = items.fold(
    (l) => l
        .map((e) => DropdownMenuItem(
              value: e,
              child: Text('$e'),
            ))
        .toList(),
    (r) => r.keys
        .map(
          (e) => DropdownMenuItem(
            value: r[e],
            child: Text(e),
          ),
        )
        .toList(),
  );

  Widget register() {
    return DropdownButtonFormField<T>(
      items: dropdownItems,
      value: selectedValue.value,
      onChanged: (T? value) {
        selectedValue.value = value as T;
      },
      padding: const EdgeInsets.all(4),
      focusColor: Colors.white,
      decoration: decoration ??
          const InputDecoration(
            focusColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.black2Color),
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            labelText: 'Select Your Fruit',
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.black2Color),
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
          ),
    );
  }

  // final dropdown = DropdownFormFieldData<T>(
  //   value: selectedValue.value,
  //   onChanged: (T? newValue) {
  //     selectedValue.value = newValue as T;
  //   },
  //   decoration: decoration ?? InputDecoration(labelText: name),
  //   items: dropdownItems,
  // );

  return (register, selectedValue);
}
