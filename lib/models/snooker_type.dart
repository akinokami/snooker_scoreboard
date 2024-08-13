class SnookerType {
  int? id;
  String? name;
  String? image;

  SnookerType({this.id, this.name, this.image});
}

List<SnookerType> typeList = [
  SnookerType(id: 6, name: '6', image: 'assets/images/snooker_six.webp'),
  SnookerType(id: 10, name: '10', image: 'assets/images/snooker_ten.webp'),
  SnookerType(id: 15, name: '15', image: 'assets/images/snooker_fifteen.webp'),
];
