class TranslatorModel {
  TranslatorModel({
    required this.input,
    this.image,
    this.translated,
  });

  late final String? input;
  late final String? image;
  late final Translated? translated;

  TranslatorModel.fromJson(Map<String, dynamic> json) {
    input = json['input'];
    image = json['image'];
    translated = json['translated'] != null
        ? Translated.fromJson(json['translated'])
        : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'input': input,
      'image': image,
      'translated': translated?.toJson(),
    };
  }
}

class Translated {
  Translated({
    this.de,
    this.en,
    this.es,
    this.fr,
    this.it,
  });

  final String? de;
  final String? en;
  final String? es;
  final String? fr;
  final String? it;

  factory Translated.fromJson(Map<String, dynamic> json) {
    return Translated(
      de: json['de'],
      en: json['en'],
      es: json['es'],
      fr: json['fr'],
      it: json['it'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'de': de,
      'en': en,
      'es': es,
      'fr': fr,
      'it': it,
    };
  }
}
