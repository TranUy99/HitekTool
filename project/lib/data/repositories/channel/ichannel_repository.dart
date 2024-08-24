import 'package:project/data/models/base_channel/base_channel.dart';

abstract class IChannelRepository {
  Future<List<BaseChannel>> getNetworkChannelList({required int page, int? limit});
}
