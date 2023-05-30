class PokemonResponse {
  List<Pokemon> result;

  PokemonResponse({
    required this.result,
  });

  factory PokemonResponse.fromJson(Map<String, dynamic> json) =>
      PokemonResponse(
        result:
            List<Pokemon>.from(json["results"].map((x) => Pokemon.fromJson(x))),
      );
}

class Pokemon {
  String name;
  String url;

  Pokemon({
    this.name = '',
    required this.url,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
