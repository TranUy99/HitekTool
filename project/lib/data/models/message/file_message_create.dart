import 'package:project/data/models/message/base_message_create.dart';
import 'package:project/data/models/message/file_message.dart';
import 'package:project/data/models/message/info_file.dart';
import 'package:json_annotation/json_annotation.dart';

part 'file_message_create.g.dart';

@JsonSerializable()
class FileMessageCreate extends BaseMessageCreate {
  List<InfoFile>? files;
  FileMessageCreate({
    this.files,
    super.channelId,
  });

  factory FileMessageCreate.fromJson(Map<String, dynamic> json) => _$FileMessageCreateFromJson(json);

  Map<String, dynamic> toJson() => _$FileMessageCreateToJson(this);

  FileMessageCreate.withFile(FileMessage super.fileMessage)
      : files = fileMessage.files,
        super.withMessage();
}
