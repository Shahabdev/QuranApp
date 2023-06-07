class JuzModal {
  int? code;
  String? status;
  Data? data;

  JuzModal({this.code, this.status, this.data});

  JuzModal.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? number;
  List<Ayahs>? ayahs;
  Surahs? surahs;
  Edition? edition;

  Data({this.number, this.ayahs, this.surahs, this.edition});

  Data.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    if (json['ayahs'] != null) {
      ayahs = <Ayahs>[];
      json['ayahs'].forEach((v) {
        ayahs!.add(new Ayahs.fromJson(v));
      });
    }
    surahs =
    json['surahs'] != null ? new Surahs.fromJson(json['surahs']) : null;
    edition =
    json['edition'] != null ? new Edition.fromJson(json['edition']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    if (this.ayahs != null) {
      data['ayahs'] = this.ayahs!.map((v) => v.toJson()).toList();
    }
    if (this.surahs != null) {
      data['surahs'] = this.surahs!.toJson();
    }
    if (this.edition != null) {
      data['edition'] = this.edition!.toJson();
    }
    return data;
  }
}

class Ayahs {
  int? number;
  String? text;
  Surah? surah;
  int? numberInSurah;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;
  bool? sajda;

  Ayahs(
      {this.number,
        this.text,
        this.surah,
        this.numberInSurah,
        this.juz,
        this.manzil,
        this.page,
        this.ruku,
        this.hizbQuarter,
        this.sajda});

  Ayahs.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    text = json['text'];
    surah = json['surah'] != null ? new Surah.fromJson(json['surah']) : null;
    numberInSurah = json['numberInSurah'];
    juz = json['juz'];
    manzil = json['manzil'];
    page = json['page'];
    ruku = json['ruku'];
    hizbQuarter = json['hizbQuarter'];
    sajda = json['sajda'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['text'] = this.text;
    if (this.surah != null) {
      data['surah'] = this.surah!.toJson();
    }
    data['numberInSurah'] = this.numberInSurah;
    data['juz'] = this.juz;
    data['manzil'] = this.manzil;
    data['page'] = this.page;
    data['ruku'] = this.ruku;
    data['hizbQuarter'] = this.hizbQuarter;
    data['sajda'] = this.sajda;
    return data;
  }
}

class Surah {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  int? numberOfAyahs;

  Surah(
      {this.number,
        this.name,
        this.englishName,
        this.englishNameTranslation,
        this.revelationType,
        this.numberOfAyahs});

  Surah.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    englishName = json['englishName'];
    englishNameTranslation = json['englishNameTranslation'];
    revelationType = json['revelationType'];
    numberOfAyahs = json['numberOfAyahs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['name'] = this.name;
    data['englishName'] = this.englishName;
    data['englishNameTranslation'] = this.englishNameTranslation;
    data['revelationType'] = this.revelationType;
    data['numberOfAyahs'] = this.numberOfAyahs;
    return data;
  }
}

class Surahs {
  Surah? s78;
  Surah? s79;
  Surah? s80;
  Surah? s81;
  Surah? s82;
  Surah? s83;
  Surah? s84;
  Surah? s85;
  Surah? s86;
  Surah? s87;
  Surah? s88;
  Surah? s89;
  Surah? s90;
  Surah? s91;
  Surah? s92;
  Surah? s93;
  Surah? s94;
  Surah? s95;
  Surah? s96;
  Surah? s97;
  Surah? s98;
  Surah? s99;
  Surah? s100;
  Surah? s101;
  Surah? s102;
  Surah? s103;
  Surah? s104;
  Surah? s105;
  Surah? s106;
  Surah? s107;
  Surah? s108;
  Surah? s109;
  Surah? s110;
  Surah? s111;
  Surah? s112;
  Surah? s113;
  Surah? s114;

  Surahs(
      {this.s78,
        this.s79,
        this.s80,
        this.s81,
        this.s82,
        this.s83,
        this.s84,
        this.s85,
        this.s86,
        this.s87,
        this.s88,
        this.s89,
        this.s90,
        this.s91,
        this.s92,
        this.s93,
        this.s94,
        this.s95,
        this.s96,
        this.s97,
        this.s98,
        this.s99,
        this.s100,
        this.s101,
        this.s102,
        this.s103,
        this.s104,
        this.s105,
        this.s106,
        this.s107,
        this.s108,
        this.s109,
        this.s110,
        this.s111,
        this.s112,
        this.s113,
        this.s114});

  Surahs.fromJson(Map<String, dynamic> json) {
    s78 = json['78'] != null ? new Surah.fromJson(json['78']) : null;
    s79 = json['79'] != null ? new Surah.fromJson(json['79']) : null;
    s80 = json['80'] != null ? new Surah.fromJson(json['80']) : null;
    s81 = json['81'] != null ? new Surah.fromJson(json['81']) : null;
    s82 = json['82'] != null ? new Surah.fromJson(json['82']) : null;
    s83 = json['83'] != null ? new Surah.fromJson(json['83']) : null;
    s84 = json['84'] != null ? new Surah.fromJson(json['84']) : null;
    s85 = json['85'] != null ? new Surah.fromJson(json['85']) : null;
    s86 = json['86'] != null ? new Surah.fromJson(json['86']) : null;
    s87 = json['87'] != null ? new Surah.fromJson(json['87']) : null;
    s88 = json['88'] != null ? new Surah.fromJson(json['88']) : null;
    s89 = json['89'] != null ? new Surah.fromJson(json['89']) : null;
    s90 = json['90'] != null ? new Surah.fromJson(json['90']) : null;
    s91 = json['91'] != null ? new Surah.fromJson(json['91']) : null;
    s92 = json['92'] != null ? new Surah.fromJson(json['92']) : null;
    s93 = json['93'] != null ? new Surah.fromJson(json['93']) : null;
    s94 = json['94'] != null ? new Surah.fromJson(json['94']) : null;
    s95 = json['95'] != null ? new Surah.fromJson(json['95']) : null;
    s96 = json['96'] != null ? new Surah.fromJson(json['96']) : null;
    s97 = json['97'] != null ? new Surah.fromJson(json['97']) : null;
    s98 = json['98'] != null ? new Surah.fromJson(json['98']) : null;
    s99 = json['99'] != null ? new Surah.fromJson(json['99']) : null;
    s100 = json['100'] != null ? new Surah.fromJson(json['100']) : null;
    s101 = json['101'] != null ? new Surah.fromJson(json['101']) : null;
    s102 = json['102'] != null ? new Surah.fromJson(json['102']) : null;
    s103 = json['103'] != null ? new Surah.fromJson(json['103']) : null;
    s104 = json['104'] != null ? new Surah.fromJson(json['104']) : null;
    s105 = json['105'] != null ? new Surah.fromJson(json['105']) : null;
    s106 = json['106'] != null ? new Surah.fromJson(json['106']) : null;
    s107 = json['107'] != null ? new Surah.fromJson(json['107']) : null;
    s108 = json['108'] != null ? new Surah.fromJson(json['108']) : null;
    s109 = json['109'] != null ? new Surah.fromJson(json['109']) : null;
    s110 = json['110'] != null ? new Surah.fromJson(json['110']) : null;
    s111 = json['111'] != null ? new Surah.fromJson(json['111']) : null;
    s112 = json['112'] != null ? new Surah.fromJson(json['112']) : null;
    s113 = json['113'] != null ? new Surah.fromJson(json['113']) : null;
    s114 = json['114'] != null ? new Surah.fromJson(json['114']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.s78 != null) {
      data['78'] = this.s78!.toJson();
    }
    if (this.s79 != null) {
      data['79'] = this.s79!.toJson();
    }
    if (this.s80 != null) {
      data['80'] = this.s80!.toJson();
    }
    if (this.s81 != null) {
      data['81'] = this.s81!.toJson();
    }
    if (this.s82 != null) {
      data['82'] = this.s82!.toJson();
    }
    if (this.s83 != null) {
      data['83'] = this.s83!.toJson();
    }
    if (this.s84 != null) {
      data['84'] = this.s84!.toJson();
    }
    if (this.s85 != null) {
      data['85'] = this.s85!.toJson();
    }
    if (this.s86 != null) {
      data['86'] = this.s86!.toJson();
    }
    if (this.s87 != null) {
      data['87'] = this.s87!.toJson();
    }
    if (this.s88 != null) {
      data['88'] = this.s88!.toJson();
    }
    if (this.s89 != null) {
      data['89'] = this.s89!.toJson();
    }
    if (this.s90 != null) {
      data['90'] = this.s90!.toJson();
    }
    if (this.s91 != null) {
      data['91'] = this.s91!.toJson();
    }
    if (this.s92 != null) {
      data['92'] = this.s92!.toJson();
    }
    if (this.s93 != null) {
      data['93'] = this.s93!.toJson();
    }
    if (this.s94 != null) {
      data['94'] = this.s94!.toJson();
    }
    if (this.s95 != null) {
      data['95'] = this.s95!.toJson();
    }
    if (this.s96 != null) {
      data['96'] = this.s96!.toJson();
    }
    if (this.s97 != null) {
      data['97'] = this.s97!.toJson();
    }
    if (this.s98 != null) {
      data['98'] = this.s98!.toJson();
    }
    if (this.s99 != null) {
      data['99'] = this.s99!.toJson();
    }
    if (this.s100 != null) {
      data['100'] = this.s100!.toJson();
    }
    if (this.s101 != null) {
      data['101'] = this.s101!.toJson();
    }
    if (this.s102 != null) {
      data['102'] = this.s102!.toJson();
    }
    if (this.s103 != null) {
      data['103'] = this.s103!.toJson();
    }
    if (this.s104 != null) {
      data['104'] = this.s104!.toJson();
    }
    if (this.s105 != null) {
      data['105'] = this.s105!.toJson();
    }
    if (this.s106 != null) {
      data['106'] = this.s106!.toJson();
    }
    if (this.s107 != null) {
      data['107'] = this.s107!.toJson();
    }
    if (this.s108 != null) {
      data['108'] = this.s108!.toJson();
    }
    if (this.s109 != null) {
      data['109'] = this.s109!.toJson();
    }
    if (this.s110 != null) {
      data['110'] = this.s110!.toJson();
    }
    if (this.s111 != null) {
      data['111'] = this.s111!.toJson();
    }
    if (this.s112 != null) {
      data['112'] = this.s112!.toJson();
    }
    if (this.s113 != null) {
      data['113'] = this.s113!.toJson();
    }
    if (this.s114 != null) {
      data['114'] = this.s114!.toJson();
    }
    return data;
  }
}

class Edition {
  String? identifier;
  String? language;
  String? name;
  String? englishName;
  String? format;
  String? type;
  String? direction;

  Edition(
      {this.identifier,
        this.language,
        this.name,
        this.englishName,
        this.format,
        this.type,
        this.direction});

  Edition.fromJson(Map<String, dynamic> json) {
    identifier = json['identifier'];
    language = json['language'];
    name = json['name'];
    englishName = json['englishName'];
    format = json['format'];
    type = json['type'];
    direction = json['direction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identifier'] = this.identifier;
    data['language'] = this.language;
    data['name'] = this.name;
    data['englishName'] = this.englishName;
    data['format'] = this.format;
    data['type'] = this.type;
    data['direction'] = this.direction;
    return data;
  }
}