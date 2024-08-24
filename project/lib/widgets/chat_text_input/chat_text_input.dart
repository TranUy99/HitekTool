import 'dart:math';

import 'package:project/common/component/component.dart';
import 'package:project/common/config/app_enum.dart';
import 'package:project/common/theme/styles.dart';
import 'package:project/data/models/message/base_message.dart';
import 'package:project/data/models/message/file_message.dart';
import 'package:project/data/models/message/info_file.dart';
import 'package:project/data/models/message/sticker.dart';
import 'package:project/data/models/message/text_message.dart';
import 'package:project/utils/gap.dart';
import 'package:project/widgets/chat_text_input/chat_icon_button.dart';
import 'package:project/widgets/chat_text_input/sticker_view.dart';
import 'package:project/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class ChatTextInput extends StatefulWidget {
  final TextEditingController textInputController;
  final FocusNode focusNode;
  final bool isShowSticker;
  final Function switchShowSticker;
  final Function(BaseMessage message) onAddMessage;
  const ChatTextInput({
    super.key,
    required this.textInputController,
    required this.focusNode,
    required this.isShowSticker,
    required this.switchShowSticker,
    required this.onAddMessage,
  });

  @override
  State<ChatTextInput> createState() => _ChatTextInputState();
}

class _ChatTextInputState extends State<ChatTextInput> {
  Function(BaseMessage message) get onAddMessage => widget.onAddMessage;

  TextEditingController get textInputController => widget.textInputController;

  FocusNode get focusNode => widget.focusNode;

  bool get isShowSticker => widget.isShowSticker;

  bool isShowMoreButton = true;

  bool isShowKeyboard = false;

  bool isPreviousShowingKeyboard = false;

  @override
  void initState() {
    focusNode.addListener(_focusNodeListener);
    textInputController.addListener(_textInputListener);
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    textInputController.dispose();
    super.dispose();
  }

  _focusNodeListener() async {
    setState(() {
      isShowMoreButton = !focusNode.hasFocus;
    });
    if (focusNode.hasFocus) {
      await Future.delayed(const Duration(milliseconds: 350));
    }
    setState(() {
      isShowKeyboard = focusNode.hasFocus;
    });
  }

  _textInputListener() {
    if (!isShowMoreButton) return;
    setState(() {
      isShowMoreButton = false;
    });
  }

  _hideKeyboard() async {
    if (!focusNode.hasFocus) return;
    focusNode.unfocus();
    await Future.delayed(const Duration(milliseconds: 200));
  }

  _onTakePhoto() async {
    await _hideKeyboard();
    // handle take photo
    // _uploadFile
  }

  _onPickImages() async {
    await _hideKeyboard();
    // handle pick images
    // _uploadFile
  }

  _uploadFile(String path) {
    var randomId = Random().nextInt(50) + 100;

    final FileMessage message = FileMessage(
      id: const Uuid().v4(),
      userId: "1",
      files: [
        InfoFile(
          id: const Uuid().v4(),
          thumbnail: 'https://picsum.photos/id/$randomId/200/300',
          hash: 'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
          widthThumbnail: 200,
          heightThumbnail: 300,
        ),
      ],
      type: MessageType.file,
    );
    onAddMessage(message);
  }

  _switchShowSticker() async {
    if (!isShowSticker) {
      isPreviousShowingKeyboard = focusNode.hasFocus;
      FocusScope.of(context).requestFocus(FocusNode());
    } else if (focusNode.hasFocus) {
      isPreviousShowingKeyboard = focusNode.hasFocus;
      return focusNode.unfocus();
    } else if (isPreviousShowingKeyboard) {
      focusNode.requestFocus();
      await Future.delayed(const Duration(milliseconds: 500));
    }
    widget.switchShowSticker();
  }

  _openShowMoreButtons() {
    setState(() {
      isShowMoreButton = true;
    });
  }

  _onSend() {
    final text = textInputController.text.trim();
    if (text.isEmpty) return;
    final TextMessage message = TextMessage(
      id: const Uuid().v4(),
      userId: "1",
      message: text,
      type: MessageType.msg,
    );
    onAddMessage(message);
    textInputController.clear();
  }

  _sendSticker(Sticker? sticker) {
    if (sticker == null) return;
    final FileMessage message = FileMessage(
      id: const Uuid().v4(),
      userId: "1",
      type: MessageType.file,
      files: [
        InfoFile(
          id: const Uuid().v4(),
          thumbnail: sticker.url,
          hash: sticker.hash,
          widthThumbnail: 200,
          heightThumbnail: 300,
        ),
      ],
    );
    onAddMessage(message);
  }

  Widget _buildTextInput() {
    return Expanded(
      child: SizedBox(
        child: TextField(
          focusNode: focusNode,
          controller: textInputController,
          style: Component.textStyle.mediumRegular,
          minLines: 1,
          maxLines: 5,
          decoration: InputDecoration(
            filled: true,
            isCollapsed: true, // fix large padding
            contentPadding: padding(horizontal: 16, vertical: 8),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: Component.radius.custom(24),
            ),
            hintText: "placeholder".tr,
            hintStyle: Component.textStyle.mediumRegular,
          ),
        ),
      ),
    );
  }

  Widget _buildMoreButtons() {
    if (isShowMoreButton) {
      return Row(
        children: [
          ChatIconButton(icon: Icons.camera_alt, callback: _onTakePhoto),
          ChatIconButton(icon: Icons.photo, callback: _onPickImages),
          ChatIconButton(icon: Icons.emoji_emotions, callback: _switchShowSticker),
        ],
      );
    }
    return ChatIconButton(icon: Icons.keyboard_arrow_right, callback: _openShowMoreButtons);
  }

  Widget _buildInput() {
    return Column(
      children: [
        const CustomDivider(),
        Padding(
          padding: padding(vertical: 8, horizontal: 16),
          child: Row(
            children: [
              _buildMoreButtons(),
              _buildTextInput(),
              ChatIconButton(icon: Icons.send, callback: _onSend),
            ].gapHorizontal(widthScale(8)),
          ),
        ),
        StickerView(
          isShowSticker: isShowSticker,
          sendSticker: _sendSticker,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildInput();
  }
}
