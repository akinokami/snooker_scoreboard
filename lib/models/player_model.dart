import 'package:snooker_scoreboard/models/snooker.dart';

class PlayerModel {
  String? name;
  int? total;
  int? posPts;
  int? negPts;
  List<Snooker>? snookerList = [];
  PlayerModel(
      {this.name,
      this.total = 0,
      this.posPts = 0,
      this.negPts = 0,
      this.snookerList});
}
