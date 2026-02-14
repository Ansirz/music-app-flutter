// To parse this JSON data, do
//
//     final deezerResponse = deezerResponseFromJson(jsonString);

import 'dart:convert';

DeezerResponse deezerResponseFromJson(String str) => DeezerResponse.fromJson(json.decode(str));

String deezerResponseToJson(DeezerResponse data) => json.encode(data.toJson());

class DeezerResponse {
    int resultCount;
    List<Result> results;

    DeezerResponse({
        required this.resultCount,
        required this.results,
    });

    factory DeezerResponse.fromJson(Map<String, dynamic> json) => DeezerResponse(
        resultCount: json["resultCount"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "resultCount": resultCount,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    WrapperType wrapperType;
    Kind kind;
    int artistId;
    int collectionId;
    int trackId;
    String artistName;
    String collectionName;
    String trackName;
    String collectionCensoredName;
    String trackCensoredName;
    String artistViewUrl;
    String collectionViewUrl;
    String trackViewUrl;
    String previewUrl;
    String artworkUrl30;
    String artworkUrl60;
    String artworkUrl100;
    double collectionPrice;
    double trackPrice;
    DateTime releaseDate;
    Explicitness collectionExplicitness;
    Explicitness trackExplicitness;
    int discCount;
    int discNumber;
    int trackCount;
    int trackNumber;
    int trackTimeMillis;
    Country country;
    Currency currency;
    String primaryGenreName;
    bool isStreamable;
    String? contentAdvisoryRating;
    String? collectionArtistName;
    int? collectionArtistId;
    String? collectionArtistViewUrl;

    Result({
        required this.wrapperType,
        required this.kind,
        required this.artistId,
        required this.collectionId,
        required this.trackId,
        required this.artistName,
        required this.collectionName,
        required this.trackName,
        required this.collectionCensoredName,
        required this.trackCensoredName,
        required this.artistViewUrl,
        required this.collectionViewUrl,
        required this.trackViewUrl,
        required this.previewUrl,
        required this.artworkUrl30,
        required this.artworkUrl60,
        required this.artworkUrl100,
        required this.collectionPrice,
        required this.trackPrice,
        required this.releaseDate,
        required this.collectionExplicitness,
        required this.trackExplicitness,
        required this.discCount,
        required this.discNumber,
        required this.trackCount,
        required this.trackNumber,
        required this.trackTimeMillis,
        required this.country,
        required this.currency,
        required this.primaryGenreName,
        required this.isStreamable,
        this.contentAdvisoryRating,
        this.collectionArtistName,
        this.collectionArtistId,
        this.collectionArtistViewUrl,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        wrapperType: wrapperTypeValues.map[json["wrapperType"]]!,
        kind: kindValues.map[json["kind"]]!,
        artistId: json["artistId"],
        collectionId: json["collectionId"],
        trackId: json["trackId"],
        artistName: json["artistName"],
        collectionName: json["collectionName"],
        trackName: json["trackName"],
        collectionCensoredName: json["collectionCensoredName"],
        trackCensoredName: json["trackCensoredName"],
        artistViewUrl: json["artistViewUrl"],
        collectionViewUrl: json["collectionViewUrl"],
        trackViewUrl: json["trackViewUrl"],
        previewUrl: json["previewUrl"],
        artworkUrl30: json["artworkUrl30"],
        artworkUrl60: json["artworkUrl60"],
        artworkUrl100: json["artworkUrl100"],
        collectionPrice: json["collectionPrice"]?.toDouble(),
        trackPrice: json["trackPrice"]?.toDouble(),
        releaseDate: DateTime.parse(json["releaseDate"]),
        collectionExplicitness: explicitnessValues.map[json["collectionExplicitness"]]!,
        trackExplicitness: explicitnessValues.map[json["trackExplicitness"]]!,
        discCount: json["discCount"],
        discNumber: json["discNumber"],
        trackCount: json["trackCount"],
        trackNumber: json["trackNumber"],
        trackTimeMillis: json["trackTimeMillis"],
        country: countryValues.map[json["country"]]!,
        currency: currencyValues.map[json["currency"]]!,
        primaryGenreName: json["primaryGenreName"],
        isStreamable: json["isStreamable"],
        contentAdvisoryRating: json["contentAdvisoryRating"],
        collectionArtistName: json["collectionArtistName"],
        collectionArtistId: json["collectionArtistId"],
        collectionArtistViewUrl: json["collectionArtistViewUrl"],
    );

    Map<String, dynamic> toJson() => {
        "wrapperType": wrapperTypeValues.reverse[wrapperType],
        "kind": kindValues.reverse[kind],
        "artistId": artistId,
        "collectionId": collectionId,
        "trackId": trackId,
        "artistName": artistName,
        "collectionName": collectionName,
        "trackName": trackName,
        "collectionCensoredName": collectionCensoredName,
        "trackCensoredName": trackCensoredName,
        "artistViewUrl": artistViewUrl,
        "collectionViewUrl": collectionViewUrl,
        "trackViewUrl": trackViewUrl,
        "previewUrl": previewUrl,
        "artworkUrl30": artworkUrl30,
        "artworkUrl60": artworkUrl60,
        "artworkUrl100": artworkUrl100,
        "collectionPrice": collectionPrice,
        "trackPrice": trackPrice,
        "releaseDate": releaseDate.toIso8601String(),
        "collectionExplicitness": explicitnessValues.reverse[collectionExplicitness],
        "trackExplicitness": explicitnessValues.reverse[trackExplicitness],
        "discCount": discCount,
        "discNumber": discNumber,
        "trackCount": trackCount,
        "trackNumber": trackNumber,
        "trackTimeMillis": trackTimeMillis,
        "country": countryValues.reverse[country],
        "currency": currencyValues.reverse[currency],
        "primaryGenreName": primaryGenreName,
        "isStreamable": isStreamable,
        "contentAdvisoryRating": contentAdvisoryRating,
        "collectionArtistName": collectionArtistName,
        "collectionArtistId": collectionArtistId,
        "collectionArtistViewUrl": collectionArtistViewUrl,
    };
}

enum Explicitness {
    CLEANED,
    EXPLICIT,
    NOT_EXPLICIT
}

final explicitnessValues = EnumValues({
    "cleaned": Explicitness.CLEANED,
    "explicit": Explicitness.EXPLICIT,
    "notExplicit": Explicitness.NOT_EXPLICIT
});

enum Country {
    USA
}

final countryValues = EnumValues({
    "USA": Country.USA
});

enum Currency {
    USD
}

final currencyValues = EnumValues({
    "USD": Currency.USD
});

enum Kind {
    SONG
}

final kindValues = EnumValues({
    "song": Kind.SONG
});

enum WrapperType {
    TRACK
}

final wrapperTypeValues = EnumValues({
    "track": WrapperType.TRACK
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
