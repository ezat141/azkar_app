class AzkarAzkarModel {
  int id;
  String category;
  String audio;
  String filename;
  List<Cont> array;

  AzkarAzkarModel({
    required this.id,
    required this.category,
    required this.audio,
    required this.filename,
    required this.array,
  });

  factory AzkarAzkarModel.fromJson(Map<String, dynamic> json) {
    return AzkarAzkarModel(
      id: json['id'],
      category: json['category'],
      audio: json['audio'],
      filename: json['filename'],
      array: (json['array'] as List)
          .map((arrayJson) => Cont.fromJson(arrayJson))
          .toList(),
    );
  }
}

class Cont {
  int id;
  String text;
  int count;
  String audio;
  String filename;

  Cont({
    required this.id,
    required this.text,
    required this.count,
    required this.audio,
    required this.filename,
  });

  factory Cont.fromJson(Map<String, dynamic> json) {
    return Cont(
      id: json['id'],
      text: json['text'],
      count: json['count'],
      audio: json['audio'],
      filename: json['filename'],
    );
  }
}
