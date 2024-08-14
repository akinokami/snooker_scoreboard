import 'package:snooker_scoreboard/models/snooker.dart';

class PlayerModel {
  String? name;
  int? pts;
  int? total;
  List<Snooker>? snookerList = [];
  PlayerModel({this.name, this.pts = 0, this.total = 0, this.snookerList});
}
