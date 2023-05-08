import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

enum TEXT_VALID_TYPE { GENERAL, EMAIL, PASSWORD, PHONE, NUMBER, NONE }

class MyTextField extends StatefulWidget {
  late String hint;
  late String? text;
  late IconData? iconData;
  late TextInputType textInputType;
  late bool isPassword;
  late String prefixIconUrl;
  late Color? prefixIconColor;

  late bool isEnabled;
  late TEXT_VALID_TYPE textValidType;

  late int maxLines = 1;
  late int minLines = 1;
  TextEditingController? myController;
  String? Function(String?)? validator;
  late bool noInputBorder;
  ValueChanged<String>? onFieldSubmitted;
  late TextInputAction? textInputAction;

  List<TextInputFormatter>? listInputFormatter;
  MyTextField({
    Key? key,
    required this.hint,
    this.prefixIconColor,
    this.textInputAction,
    this.onFieldSubmitted,
    this.listInputFormatter,
    this.text = "",
    this.iconData,
    this.prefixIconUrl = '',
    this.validator,
    this.noInputBorder = false,
    this.textValidType = TEXT_VALID_TYPE.NONE,
    this.textInputType = TextInputType.text,
    this.myController,
    this.isPassword = false,
    this.isEnabled = true,
  }) : super(key: key);

  MyTextField.form({
    Key? key,
    required this.hint,
    this.text = "",
    this.noInputBorder = false,
    this.textInputAction = TextInputAction.done,
    this.onFieldSubmitted,
    this.prefixIconUrl = '',
    this.iconData,
    this.validator,
    this.textValidType = TEXT_VALID_TYPE.NONE,
    this.textInputType = TextInputType.text,
    this.myController,
    this.isPassword = false,
    this.isEnabled = true,
    this.maxLines = 1,
    this.minLines = 1,
  }) : super(key: key);

  @override
  _MyTextFieldState createState() {
    return _MyTextFieldState();
  }
}

class _MyTextFieldState extends State<MyTextField> {
// Create a text controller. Later, use it to retrieve the
// current value of the TextField.
  late final FocusNode _focus = FocusNode();

  bool _isFocusedChanged = false;

  @override
  void initState() {
    super.initState();
    _focus.addListener(_handleFocusChange);
    // WidgetsBinding.instance!.addPostFrameCallback((_){
    //   FocusScope.of(context).requestFocus(_focus);
    // });
  }

  void _handleFocusChange() {
    if (_focus.hasFocus != _isFocusedChanged) {
      setState(() {
        _isFocusedChanged = _focus.hasFocus;
      });
    }
  }

  @override
  void dispose() {
    _focus.removeListener(_handleFocusChange);
    // myController!.dispose();
    // widget.myController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.myController,
      textInputAction: widget.textInputAction,
      inputFormatters: widget.listInputFormatter,
      onFieldSubmitted: widget.onFieldSubmitted,
      // style: TextStyle(color: Color(AssetsColors.color_blue_004BFE)),
      keyboardType: widget.textInputType,
      obscureText: widget.isPassword,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      enableSuggestions: !widget.isPassword,
      autocorrect: !widget.isPassword,
      enabled: widget.isEnabled,
      enableInteractiveSelection: true,
      style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          // fontFamily: AssetsHelper.FONT_Avenir,
          fontWeight: FontWeight.w500),
      focusNode: _focus,
      validator: initValidator(widget.textValidType),
      onChanged: (text) => setState(() => text),
      cursorColor: Colors.blueGrey,
      decoration: InputDecoration(
          disabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          alignLabelWithHint: true,
          focusedBorder: widget.noInputBorder
              ? InputBorder.none
              : OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.grey),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
          // errorStyle: AppTextStyles.getRegularTextStyle(
          //     fontSize: 12, colorValue: AssetsColors.redColor),
          errorBorder: widget.noInputBorder
              ? null
              : const OutlineInputBorder(
                  borderSide: BorderSide(width: 0.8, color: Colors.grey),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
          enabledBorder: widget.noInputBorder
              ? InputBorder.none
              : const OutlineInputBorder(
                  borderSide: BorderSide(width: 0.8, color: Colors.grey),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          border: widget.noInputBorder
              ? InputBorder.none
              : const OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
          prefixIcon: widget.prefixIconUrl != ''
              ? Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: 20, end: 14, bottom: (widget.maxLines - 1) * 20.0),
                  child: SvgPicture.asset(
                    widget.prefixIconUrl,
                    color: widget.prefixIconColor,
                  ),
                )
              : widget.iconData == null
                  ? const SizedBox(
                      width: 16,
                    )
                  : Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 16, end: 5),
                      child: Icon(
                        widget.iconData,
                        size: 20,
                        color: _isFocusedChanged
                            ? Colors.blueGrey
                            : Colors.grey[700],
                      ),
                    ),
          prefixIconConstraints: BoxConstraints.loose(Size.infinite),
          hintText: widget.hint,
          hintStyle: const TextStyle(
              color: Colors.white60,
              fontSize: 12,
              // fontFamily: AssetsHelper.FONT_Avenir,
              fontWeight: FontWeight.w500)),
    );
  }

  initValidator(TEXT_VALID_TYPE textValidType) {
    switch (textValidType) {
      case TEXT_VALID_TYPE.GENERAL:
        return (value) {
          if (Validator.instance.generalValidator(value)) {
            return '* الحقل مطلوب';
          }
        };
      case TEXT_VALID_TYPE.EMAIL:
        return (value) {
          if (Validator.instance.generalValidator(value)) {
            return '* الحقل مطلوب';
          }
          if (Validator.instance.emailValidator(value)) {
            return 'الرجاء ادخال البريد الإلكتروني بالشكل الصحيح';
          }
        };
      case TEXT_VALID_TYPE.PASSWORD:
        return (value) {
          if (Validator.instance.generalValidator(value)) {
            return '* الحقل مطلوب';
          }
          if (Validator.instance.passwordValidator(value)) {
            return 'يجب ان يتكون من 6 احرف على الأقل';
          }
        };
      case TEXT_VALID_TYPE.PHONE:
        return (value) {
          if (Validator.instance.generalValidator(value)) {
            return '* الحقل مطلوب';
          }
          if (Validator.instance.phoneValidator(value)) {
            return 'الرجاء اخال رقم الهاتف بالصيغة الصحيحة';
          }
        };

      case TEXT_VALID_TYPE.NUMBER:
        return (value) {
          if (Validator.instance.generalValidator(value)) {
            return '* الحقل مطلوب';
          }
          if (Validator.instance.numbarValidator(value)) {
            return 'الرجاء ادخال الحقل بالشكل الصحيح';
          }
        };

      case TEXT_VALID_TYPE.NONE:
        if (widget.validator != null) {
          return widget.validator;
        }
    }
  }
}

class Validator {
  static var instance = Validator();

  bool emailValidator(String value) {
    bool showMessage;
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9\-\_]+(\.[a-zA-Z]+)*$");

    if (emailRegExp.hasMatch(value)) {
      showMessage = false;
    } else {
      showMessage = true;
    }
    return showMessage;
  }

  bool phoneValidator(String value) {
    bool showMessage;
    RegExp _anyLetter = RegExp(r'[A-Za-z]');
    final RegExp _phoneRegExp = RegExp(r'^\d{7,15}$');

    if (!_anyLetter.hasMatch(value) && _phoneRegExp.hasMatch(value)) {
      showMessage = false;
    } else {
      showMessage = true;
    }
    return showMessage;
  }

  bool numbarValidator(String value) {
    bool showMessage;
    RegExp _anyLetter = RegExp(r'[A-Za-z]');

    if (!_anyLetter.hasMatch(value)) {
      showMessage = false;
    } else {
      showMessage = true;
    }
    return showMessage;
  }

  bool passwordValidator(String value) {
    bool showMessage;

    if (value.length >= 6) {
      showMessage = false;
    } else {
      showMessage = true;
    }
    return showMessage;
  }

  bool generalValidator(String value) {
    bool showMessage;

    if (value.isEmpty) {
      showMessage = true;
    } else {
      showMessage = false;
    }
    return showMessage;
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  Widget? leading;
  List<Widget>? actions;
  CustomAppBar({super.key, this.leading, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: leading,
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0);
}
