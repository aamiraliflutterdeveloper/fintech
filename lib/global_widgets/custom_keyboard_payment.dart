import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/constants/assets_path.dart';
import 'package:fintech_app/dashboard_screen.dart';
import 'package:fintech_app/global_widgets/custom_elevated_button.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:fintech_app/global_widgets/custom_toast.dart';
import 'package:fintech_app/global_widgets/custom_white_box.dart';
import 'package:fintech_app/global_widgets/fetch_svg.dart';
import 'package:fintech_app/utils/nav_router.dart';
import 'package:flutter/material.dart';

class CustomKeyboardPayment extends StatefulWidget {
  const CustomKeyboardPayment({Key? key}) : super(key: key);

  @override
  _CustomKeyboardPaymentState createState() => _CustomKeyboardPaymentState();
}

class _CustomKeyboardPaymentState extends State<CustomKeyboardPayment> {
  late TextEditingController _controller = TextEditingController();
  bool isButtonActive = false;

  @override
  void initState() {
    _controller = TextEditingController();
    isButtonEnabled();
    super.initState();
  }

  isButtonEnabled() {
    _controller.addListener(() {
      final isButtonActive = _controller.text.length >= 6;
      setState(() {
        this.isButtonActive = isButtonActive;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height * .5,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              width: MediaQuery.of(context).size.width,
              child: CustomWhiteBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFieldForm(
                        controller: _controller,
                        onChanged: (value) {
                          setState(() {
                            isButtonActive = true;
                          });
                          print('called');
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: CustomText(
                          text: 'Enter 8 - digit Till ID',
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CustomKeyboard(
              onTextInput: (myText) {
                _insertText(myText);
              },
              onBackspace: () {
                _backspace();
              },
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.bottomCenter,
              child: CustomElevatedButton(
                  width: MediaQuery.of(context).size.width * .8,
                  onPress: () {
                    isButtonActive == true
                        ? NavRouter.pushAndRemoveUntil(
                            context, DashboardScreen())
                        : customToast('Please fill the form correctly');
                  },
                  primaryColor: isButtonActive == false
                      ? AppColors.whiteColor
                      : AppColors.blueDark,
                  title: 'Continue',
                  textColor: isButtonActive == false
                      ? AppColors.blueDark
                      : AppColors.whiteColor,
                  fontSize: 18,
                  alignment: MainAxisAlignment.spaceBetween,
                  image: isButtonActive == false
                      ? AssetsPath.IC_green_line_bottom_button
                      : AssetsPath.IC_white_line_bottom_button),
            )
          ],
        ),
      ),
    );
  }

  void _insertText(String myText) {
    final text = _controller.text;
    final textSelection = _controller.selection;
    final newText = text.replaceRange(
      textSelection.start,
      textSelection.end,
      myText,
    );
    final myTextLength = myText.length;
    _controller.text = newText;
    _controller.selection = textSelection.copyWith(
      baseOffset: textSelection.start + myTextLength,
      extentOffset: textSelection.start + myTextLength,
    );
  }

  void _backspace() {
    final text = _controller.text;
    final textSelection = _controller.selection;
    final selectionLength = textSelection.end - textSelection.start;

    if (selectionLength > 0) {
      final newText = text.replaceRange(
        textSelection.start,
        textSelection.end,
        '',
      );
      _controller.text = newText;
      _controller.selection = textSelection.copyWith(
        baseOffset: textSelection.start,
        extentOffset: textSelection.start,
      );
      return;
    }

    // The cursor is at the beginning.
    if (textSelection.start == 0) {
      return;
    }

    // Delete the previous character
    final previousCodeUnit = text.codeUnitAt(textSelection.start - 1);
    final offset = _isUtf16Surrogate(previousCodeUnit) ? 2 : 1;
    final newStart = textSelection.start - offset;
    final newEnd = textSelection.start;
    final newText = text.replaceRange(
      newStart,
      newEnd,
      '',
    );
    _controller.text = newText;
    _controller.selection = textSelection.copyWith(
      baseOffset: newStart,
      extentOffset: newStart,
    );
  }

  bool _isUtf16Surrogate(int value) {
    return value & 0xF800 == 0xD800;
  }
}

class CustomKeyboard extends StatelessWidget {
  const CustomKeyboard({
    Key? key,
    required this.onTextInput,
    this.onBackspace,
  }) : super(key: key);

  final ValueSetter<String> onTextInput;
  final VoidCallback? onBackspace;

  void _textInputHandler(String text) => onTextInput.call(text);

  void _backspaceHandler() => onBackspace?.call();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .3,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              buildRowOne(),
              SizedBox(
                height: 10,
              ),
              buildRowTwo(),
              SizedBox(
                height: 10,
              ),
              buildRowThree(),
              SizedBox(
                height: 10,
              ),
              buildRowFour(),
            ],
          ),
        ),
      ],
    );
  }

  Expanded buildRowOne() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: '1',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '2',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '3',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowTwo() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: '4',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '5',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '6',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowThree() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: '7',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '8',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '9',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowFour() {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            // flex: flex,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Material(
                color: Colors.white,
                child: InkWell(
                  onTap: () {
                    onBackspace?.call();
                  },
                  child: Center(
                    child: SvgImage(path: AssetsPath.BLUE_THUMB),
                  ),
                ),
              ),
            ),
          ),
          TextKey(
            text: '0',
            onTextInput: _textInputHandler,
            style: const TextStyle(color: Colors.black, fontSize: 23),
          ),
          BackspaceKey(
            onBackspace: _backspaceHandler,
          ),
        ],
      ),
    );
  }
}

class TextKey extends StatelessWidget {
  const TextKey({
    Key? key,
    this.text,
    this.style,
    required this.onTextInput,
    this.flex = 1,
  }) : super(key: key);

  final TextStyle? style;
  final String? text;
  final ValueSetter<String> onTextInput;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          color: Colors.white,
          child: InkWell(
            onTap: () {
              onTextInput.call(text!);
            },
            child: Center(
                child: Text(
              text!,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 25),
            )),
          ),
        ),
      ),
    );
  }
}

class BackspaceKey extends StatelessWidget {
  const BackspaceKey({
    Key? key,
    this.onBackspace,
    this.flex = 1,
  }) : super(key: key);

  final VoidCallback? onBackspace;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          color: Colors.white,
          child: InkWell(
            onTap: () {
              onBackspace?.call();
            },
            child: const Center(
              child: Icon(
                Icons.backspace,
                size: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldForm extends StatelessWidget {
  const TextFieldForm({
    Key? key,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);
  final TextEditingController controller;
  final ValueChanged? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        hintText: '00000000',
        hintStyle: TextStyle(color: AppColors.lightGreyColor, fontSize: 30),
        // prefix: prefix,
        contentPadding:
            EdgeInsets.only(left: 30, bottom: 11, top: 11, right: 30),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
        ),
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
      style: const TextStyle(fontSize: 24),
      autofocus: true,
      showCursor: true,
      readOnly: true,
    );
  }
}
