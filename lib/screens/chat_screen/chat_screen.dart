import 'dart:io';

import 'package:fintech_app/components/custom_appbar.dart';
import 'package:fintech_app/constants/app_decorations.dart';
import 'package:fintech_app/constants/assets_path.dart';
import 'package:fintech_app/widgets/tiles/receiver_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../global_widgets/custom_dialog.dart';
import '../../global_widgets/image_picker_manager.dart';
import '../../widgets/tiles/sender_tile.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final msgController = TextEditingController();

  final List<String> msgList = [
    'hi! How can I help you?',
    'I seem to be having Problems With the pay bills',
    'ok. we are working on it',
    'it worked! thanks for the help!',
    'hi! How can I help you?',
    'I seem to be having Problems With the pay bills',
    'ok. we are working on it  '
  ];
  File? _pickedImage;
  _pickImage() {
    CustomDialogs.showImageSelectionDialog(context, onSelectGallery: () async {
      _pickedImage =
          await ImagePickerManager.getImageFromGallery(context) ?? _pickedImage;
      setState(() {});
    }, onSelectCamera: () async {
      _pickedImage =
          await ImagePickerManager.getImageFromCamera(context) ?? _pickedImage;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Live Chat',
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  itemBuilder: (context, index) {
                    return index % 2 == 0
                        ? ReceiverTile(
                            msg: msgList[index],
                          )
                        : SenderTile(
                            msg: msgList[index],
                          );
                  },
                  itemCount: msgList.length,
                ),
              ),
            ),
            Container(
              height: 60,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: Platform.isIOS ? 16 : 4),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      _pickImage();
                    },
                    child: SvgPicture.asset(
                      AssetsPath.IC_CHAT_CAM,
                    ),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Container(
                      child: TextField(
                        decoration: chatTextFieldDecoration,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

// *** Receiver Message Tile

// *** Sender Message Tile
