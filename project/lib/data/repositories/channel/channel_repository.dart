import 'package:project/common/config/app_constants.dart';
import 'package:project/data/common/base_service.dart';
import 'package:project/data/models/base_channel/base_channel.dart';
import 'package:project/data/repositories/channel/ichannel_repository.dart';

class ChannelRepository extends IChannelRepository {
  ChannelRepository({
    required BaseService api,
  }) : _api = api;
  final BaseService _api;

  @override
  Future<List<BaseChannel>> getNetworkChannelList({required int page, int? limit}) async {
    limit = limit ?? LIMIT;

    await Future.delayed(const Duration(seconds: 1));

    return List.generate(page == 5 ? limit - 1 : limit, (index) {
      return BaseChannel.fakeData;
    });
  }
}
