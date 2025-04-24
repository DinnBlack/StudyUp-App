import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/constants.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final TextInputType keyboardType;
  final String? prefixIcon;
  final String? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final VoidCallback? onPrefixIconTap;
  final VoidCallback? onSuffixIconTap;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
    this.onPrefixIconTap,
    this.onSuffixIconTap,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_focusChangeListener);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_focusChangeListener);
    _focusNode.dispose();
    super.dispose();
  }

  void _focusChangeListener() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: _focusNode,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.label,

        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon != null
            ? GestureDetector(
          onTap: widget.onPrefixIconTap,
          child: SvgPicture.asset(
            widget.prefixIcon!,
            width: 16,
            height: 16,
            color: _isFocused ? AppColors.primary : Colors.grey,
          ),
        )
            : null,
        suffixIcon: widget.suffixIcon != null
            ? GestureDetector(
          onTap: widget.onSuffixIconTap,
          child: Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(8),
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: _isFocused ?  AppColors.primary.withOpacity(0.1): Colors.grey.withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(30)),
            ),
            child: SvgPicture.asset(
              widget.suffixIcon!,
              colorFilter: ColorFilter.mode(
                _isFocused ? AppColors.primary : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
          ),
        )
            : null,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppPadding.medium,
          vertical: AppPadding.normal,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: AppRadius.large,
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.large,
          borderSide: BorderSide(color: AppColors.primary, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.large,
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
      ),
    );
  }
}
