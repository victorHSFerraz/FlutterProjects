class GeoHelper {
  String by;
  bool validKey;
  Results results;
  double executionTime;
  bool fromCache;

  GeoHelper(
      {this.by,
        this.validKey,
        this.results,
        this.executionTime,
        this.fromCache});

  GeoHelper.fromJson(Map<String, dynamic> json) {
    by = json['by'];
    validKey = json['valid_key'];
    results =
    json['results'] != null ? new Results.fromJson(json['results']) : null;
    executionTime = json['execution_time'];
    fromCache = json['from_cache'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['by'] = this.by;
    data['valid_key'] = this.validKey;
    if (this.results != null) {
      data['results'] = this.results.toJson();
    }
    data['execution_time'] = this.executionTime;
    data['from_cache'] = this.fromCache;
    return data;
  }
}

class Results {
  String address;
  String type;
  String city;
  String region;
  String countryName;
  String continent;
  String continentCode;
  String regionCode;
  Country country;
  double latitude;
  double longitude;
  Null woeid;

  Results(
      {this.address,
        this.type,
        this.city,
        this.region,
        this.countryName,
        this.continent,
        this.continentCode,
        this.regionCode,
        this.country,
        this.latitude,
        this.longitude,
        this.woeid});

  Results.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    type = json['type'];
    city = json['city'];
    region = json['region'];
    countryName = json['country_name'];
    continent = json['continent'];
    continentCode = json['continent_code'];
    regionCode = json['region_code'];
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
    latitude = json['latitude'];
    longitude = json['longitude'];
    woeid = json['woeid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['type'] = this.type;
    data['city'] = this.city;
    data['region'] = this.region;
    data['country_name'] = this.countryName;
    data['continent'] = this.continent;
    data['continent_code'] = this.continentCode;
    data['region_code'] = this.regionCode;
    if (this.country != null) {
      data['country'] = this.country.toJson();
    }
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['woeid'] = this.woeid;
    return data;
  }
}

class Country {
  String name;
  String code;
  Null capital;
  Flag flag;
  Null callingCode;

  Country({this.name, this.code, this.capital, this.flag, this.callingCode});

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    capital = json['capital'];
    flag = json['flag'] != null ? new Flag.fromJson(json['flag']) : null;
    callingCode = json['calling_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    data['capital'] = this.capital;
    if (this.flag != null) {
      data['flag'] = this.flag.toJson();
    }
    data['calling_code'] = this.callingCode;
    return data;
  }
}

class Flag {
  String svg;
  String png16;

  Flag({this.svg, this.png16});

  Flag.fromJson(Map<String, dynamic> json) {
    svg = json['svg'];
    png16 = json['png_16'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['svg'] = this.svg;
    data['png_16'] = this.png16;
    return data;
  }
}
