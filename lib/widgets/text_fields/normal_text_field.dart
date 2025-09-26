// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bite_and_seat/core/typedefs/text_field_validator.dart';
import 'package:bite_and_seat/core/typedefs/updating_text_field_content.dart';
import 'package:flutter/material.dart';

class NormalTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final TextFieldValidator validatorFunction;
  final String labelText;
  final String hintText;
  final Icon? textFieldIcon;
  final bool isPassword;
  final TextInputType? textInputType;
  final bool? isDisabled;
  final bool isMultiline;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputAction? textInputAction;
  final UpdatingTextFieldContent? onChange;
  const NormalTextField({
    super.key,
    required this.textEditingController,
    required this.validatorFunction,
    required this.labelText,
    required this.hintText,
    this.textFieldIcon,
    this.isPassword = false,
    this.textInputType,
    this.isDisabled,
    this.isMultiline = false,
    this.focusNode,
    this.nextFocusNode,
    this.textInputAction,
    this.onChange,
  });

  @override
  State<NormalTextField> createState() => _NormalTextFieldState();
}

class _NormalTextFieldState extends State<NormalTextField> {
  late bool isObscured;

  @override
  void initState() {
    super.initState();
    isObscured = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        TextFormField(
          controller: widget.textEditingController,
          validator: widget.validatorFunction,
          focusNode: widget.focusNode,
          textInputAction:
              widget.textInputAction ??
              (widget.nextFocusNode != null
                  ? TextInputAction.next
                  : TextInputAction.done),
          onFieldSubmitted: (_) {
            if (widget.nextFocusNode != null) {
              FocusScope.of(context).requestFocus(widget.nextFocusNode);
            }
          },
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: widget.textFieldIcon,
            suffixIcon: widget.isPassword
                ? isObscured
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              isObscured = false;
                            });
                          },
                          icon: Icon(Icons.visibility),
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              isObscured = true;
                            });
                          },
                          icon: Icon(Icons.visibility_off),
                        )
                : null,
            border: OutlineInputBorder(),
          ),
          keyboardType: widget.isMultiline
              ? TextInputType.multiline
              : widget.textInputType ?? TextInputType.text,
          readOnly: widget.isDisabled ?? false,
          maxLines: widget.isMultiline ? 3 : 1,
          obscureText: isObscured,
          onChanged: widget.onChange,
        ),
      ],
    );
  }
}
