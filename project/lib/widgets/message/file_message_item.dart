import 'package:project/common/theme/styles.dart';
import 'package:project/data/models/message/file_message.dart';
import 'package:project/data/models/message/info_file.dart';
import 'package:project/widgets/custom_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FileMessageItem extends StatelessWidget {
  final FileMessage? message;
  const FileMessageItem({
    super.key,
    required this.message,
  });

  _buildOneImage(InfoFile infoFile) {
    final width = Get.width / 1.5;
    final height = width * (infoFile.heightThumbnail ?? 0) / (infoFile.widthThumbnail ?? 1);
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: Get.height / 3),
      child: CustomAvatar(
        url: infoFile.thumbnail,
        hash: infoFile.hash,
        borderRadius: 8,
        width: width,
        height: height,
      ),
    );
  }

  _buildMutipleImage(List<InfoFile> infoFiles) {
    return SizedBox(
      width: Get.width / 1.5,
      child: GridView.builder(
        padding: padding(all: 0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: infoFiles.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: widthScale(4),
          crossAxisSpacing: widthScale(4),
        ),
        itemBuilder: (context, index) {
          final infoFile = infoFiles[index];
          return CustomAvatar(
            url: infoFile.thumbnail,
            hash: infoFile.hash,
            borderRadius: 8,
          );
        },
      ),
    );
  }

  _buildMessage() {
    if (message?.files == null || message!.files!.isEmpty) return const SizedBox();
    if (message!.files!.length == 1) return _buildOneImage(message!.files!.first);
    return _buildMutipleImage(message!.files!);
  }

  @override
  Widget build(BuildContext context) {
    return _buildMessage();
  }
}
