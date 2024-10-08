import 'package:snooker_scoreboard/models/snooker.dart';

class PlayerModel {
  String? name;
  int? total;
  int? posPts;
  int? negPts;
  int? maxPts;
  int? plusFoulPts;
  List<Snooker>? snookerList = [];
  PlayerModel(
      {this.name,
      this.total = 0,
      this.posPts = 0,
      this.negPts = 0,
      this.maxPts = 0,
      this.plusFoulPts = 0,
      this.snookerList});
}
