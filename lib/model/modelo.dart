import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
        this.greeting,
        this.instructions,
    });

    String greeting;
    List<String> instructions;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        greeting: json["greeting"],
        instructions: json["instructions"] == null ? [] : List<String>.from(json["instructions"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "greeting": greeting,
        "instructions": instructions == null ? [] : List<dynamic>.from(instructions.map((x) => x)),
    };
}
