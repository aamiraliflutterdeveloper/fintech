import 'package:fintech_app/constants/assets_path.dart';
import 'package:fintech_app/global_widgets/fetch_svg.dart';
import 'package:flutter/material.dart';

import '../thumb_verification_dialog.dart';

class CustomKeyboardWithThumb extends StatelessWidget {
  CustomKeyboardWithThumb({
    Key? key,
    this.onTextInput,
    this.onBackspace,
  }) : super(key: key);

  final ValueSetter<String>? onTextInput;
  final VoidCallback? onBackspace;

  void _textInputHandler(String text) => onTextInput!.call(text);

  void _backspaceHandler() => onBackspace?.call();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          buildRowOne(),
          buildRowTwo(),
          buildRowThree(),
          buildRowFour(),
        ],
      ),
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
          ThumbSign(),
          TextKey(
            text: '0',
            onTextInput: _textInputHandler,
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
    @required this.text,
    this.onTextInput,
    this.flex = 1,
  }) : super(key: key);

  final String? text;
  final ValueSetter<String>? onTextInput;
  final int? flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex!,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          color: Colors.white,
          child: InkWell(
            onTap: () {
              onTextInput?.call(text!);
            },
            child: Center(
                child: Text(
              text!,
              style: TextStyle(fontSize: 28),
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
  final int? flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex!,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          color: Colors.white,
          child: InkWell(
            onTap: () {
              onBackspace?.call();
            },
            child: Container(
              child: Center(
                child: Icon(Icons.backspace),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ThumbSign extends StatelessWidget {
  const ThumbSign({
    Key? key,
    this.flex = 1,
  }) : super(key: key);

  final int? flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex!,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          color: Colors.white,
          child: InkWell(
            onTap: () {
              thumbDialog(context);
            },
            child: Container(
              child: Center(
                child: SvgImage(path: AssetsPath.BLUE_THUMB),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
