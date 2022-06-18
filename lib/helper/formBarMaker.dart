import 'package:flutter/material.dart';

class FormBar {
  static Widget inputBarWithLabel({
    required String name,
    required BuildContext context,
    required String onSaveStorage,
    required String initVal,
    bool? readOnlyRef,
    bool? autoFocusRef,
    TextInputType? keyboardTypeRef,
  }) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Text(
            name,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 12, right: 8),
          decoration: BoxDecoration(
            border: Border.all(width: 0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.only(left: 8),
          child: TextFormField(
            onSaved: (val) => onSaveStorage = val!,
            validator: (val) {
              return null;
            },
            readOnly: readOnlyRef != null ? true : false,
            initialValue: initVal,
            autofocus: autoFocusRef != null ? true : false,
            keyboardType: keyboardTypeRef,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Enter $name",
              hintStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 14,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
      ],
    );
  }

  static Widget inputBar({
    required String name,
    required BuildContext context,
    required String onSaveStorage,
    required String initVal,
    bool? readOnlyRef,
    bool? autoFocusRef,
    TextInputType? keyboardTypeRef,
  }) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        margin: const EdgeInsets.only(top: 8, bottom: 2, right: 8, left: 8),
        decoration: BoxDecoration(
          border: Border.all(width: 0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.only(left: 8),
        child: TextFormField(
          onSaved: (val) => onSaveStorage = val!,
          validator: (val) {
            return null;
          },
          keyboardType: keyboardTypeRef,
          readOnly: readOnlyRef != null ? true : false,
          initialValue: initVal,
          autofocus: autoFocusRef != null ? true : false,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Enter $name",
            hintStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 14,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ),
    );
  }
}
