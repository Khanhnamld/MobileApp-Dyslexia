class Plant {
  final int id;
  final String title;
  final String body;
  final String img_url;
  final String dieukien;
  final String cachtrong;
  final String luuy;

  const Plant({
    required this.id,
    required this.title,
    required this.body,
    required this.img_url,
    required this.dieukien,
    required this.cachtrong,
    required this.luuy
  });

  factory Plant.fromJson(Map<String, dynamic> json) => Plant(
    id: json['id'],
    title: json['title'],
    body: json['body'],
    img_url: json['img_url'],
    dieukien: json['dieukien'],
    cachtrong: json['cachtrong'],
    luuy: json['luuy']
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'body': body,
    'img_url': img_url,
    'dieukien': dieukien,
    'cachtrong': cachtrong,
    'luuy': luuy
  };
}