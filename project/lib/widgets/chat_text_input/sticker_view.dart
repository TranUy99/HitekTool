import 'package:project/common/config/app_constants.dart';
import 'package:project/common/theme/styles.dart';
import 'package:project/data/models/message/sticker.dart';
import 'package:project/widgets/custom_avatar.dart';
import 'package:project/widgets/loadmore/custom_loadmore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_persistent_keyboard_height/flutter_persistent_keyboard_height.dart';

class StickerView extends StatefulWidget {
  final bool isShowSticker;
  final Function(Sticker) sendSticker;
  const StickerView({
    super.key,
    required this.isShowSticker,
    required this.sendSticker,
  });

  @override
  State<StickerView> createState() => _StickerViewState();
}

class _StickerViewState extends State<StickerView> {
  bool get _isShowSticker => widget.isShowSticker;
  Function(Sticker) get _sendSticker => widget.sendSticker;

  List<Sticker>? stickers;

  int limit = 100;

  @override
  void initState() {
    _loadStickers();
    super.initState();
  }

  Future<List<Sticker>> _getStickers() async {
    await Future.delayed(const Duration(seconds: 5));
    return List.generate(limit, (index) {
      return Sticker.fakeData;
    });
  }

  _loadStickers() async {
    var list = await _getStickers();
    if (mounted) {
      setState(() {
        stickers = list;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = _isShowSticker ? PersistentKeyboardHeight.of(context).keyboardHeight : MediaQuery.of(context).viewInsets.bottom;
    final safePadding = MediaQuery.of(context).padding.bottom;
    final backgroundColor = Theme.of(context).colorScheme.background;
    return Stack(
      children: [
        AnimatedPadding(
          padding: EdgeInsets.only(bottom: keyboardHeight < safePadding ? safePadding : keyboardHeight),
          duration: const Duration(milliseconds: 50),
          curve: Curves.decelerate,
        ),
        Container(
          color: backgroundColor,
          height: keyboardHeight,
          child: LoadMore(
            isLoading: stickers == null,
            onLoadMore: () async {
              return false;
            },
            isFinish: true,
            child: GridView.builder(
              padding: padding(horizontal: 8, bottom: safePadding, top: heightScale(8)),
              itemCount: stickers?.length ?? PLACEHOLDER_ITEM_LENGTH,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: widthScale(8),
                crossAxisSpacing: widthScale(8),
              ),
              itemBuilder: (context, index) {
                var item = stickers?[index] ?? Sticker.fakeData.copyWith(url: '');
                return CustomAvatar(
                  url: item.url,
                  hash: item.hash,
                  borderRadius: 0,
                  onTap: () => _sendSticker(item),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
