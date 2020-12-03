// To parse this JSON data, do
//
//     final parseApi = parseApiFromJson(jsonString);

import 'dart:convert';

ParseApi parseApiFromJson(String str) => ParseApi.fromJson(json.decode(str));

String parseApiToJson(ParseApi data) => json.encode(data.toJson());

class ParseApi {
  ParseApi({
    this.chartDate,
    this.diurnal,
    this.nocturnal,
    this.moonPhase,
    this.planets,
    this.points,
    this.angles,
    this.houses,
  });

  DateTime chartDate;
  bool diurnal;
  bool nocturnal;
  String moonPhase;
  Planets planets;
  Points points;
  Angles angles;
  Map<String, Asc> houses;

  factory ParseApi.fromJson(Map<String, dynamic> json) => ParseApi(
    chartDate: DateTime.parse(json["chartDate"]),
    diurnal: json["diurnal"],
    nocturnal: json["nocturnal"],
    moonPhase: json["moonPhase"],
    planets: Planets.fromJson(json["planets"]),
    points: Points.fromJson(json["points"]),
    angles: Angles.fromJson(json["angles"]),
    houses: Map.from(json["houses"]).map((k, v) => MapEntry<String, Asc>(k, Asc.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "chartDate": chartDate.toIso8601String(),
    "diurnal": diurnal,
    "nocturnal": nocturnal,
    "moonPhase": moonPhase,
    "planets": planets.toJson(),
    "points": points.toJson(),
    "angles": angles.toJson(),
    "houses": Map.from(houses).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class Angles {
  Angles({
    this.asc,
    this.mc,
    this.desc,
    this.ic,
  });

  Asc asc;
  Asc mc;
  Asc desc;
  Asc ic;

  factory Angles.fromJson(Map<String, dynamic> json) => Angles(
    asc: Asc.fromJson(json["asc"]),
    mc: Asc.fromJson(json["mc"]),
    desc: Asc.fromJson(json["desc"]),
    ic: Asc.fromJson(json["ic"]),
  );

  Map<String, dynamic> toJson() => {
    "asc": asc.toJson(),
    "mc": mc.toJson(),
    "desc": desc.toJson(),
    "ic": ic.toJson(),
  };
}

class Asc {
  Asc({
    this.angle,
    this.sign,
    this.chartAngle,
    this.signAngle,
    this.formattedChartAngle,
    this.formattedSignAngle,
    this.house,
  });

  String angle;
  String sign;
  double chartAngle;
  double signAngle;
  FormattedAngle formattedChartAngle;
  FormattedAngle formattedSignAngle;
  int house;

  factory Asc.fromJson(Map<String, dynamic> json) => Asc(
    angle: json["angle"] == null ? null : json["angle"],
    sign: json["sign"],
    chartAngle: json["chartAngle"].toDouble(),
    signAngle: json["signAngle"].toDouble(),
    formattedChartAngle: FormattedAngle.fromJson(json["formattedChartAngle"]),
    formattedSignAngle: FormattedAngle.fromJson(json["formattedSignAngle"]),
    house: json["house"] == null ? null : json["house"],
  );

  Map<String, dynamic> toJson() => {
    "angle": angle == null ? null : angle,
    "sign": sign,
    "chartAngle": chartAngle,
    "signAngle": signAngle,
    "formattedChartAngle": formattedChartAngle.toJson(),
    "formattedSignAngle": formattedSignAngle.toJson(),
    "house": house == null ? null : house,
  };
}

class FormattedAngle {
  FormattedAngle({
    this.degrees,
    this.minutes,
    this.seconds,
  });

  String degrees;
  String minutes;
  String seconds;

  factory FormattedAngle.fromJson(Map<String, dynamic> json) => FormattedAngle(
    degrees: json["degrees"],
    minutes: json["minutes"],
    seconds: json["seconds"],
  );

  Map<String, dynamic> toJson() => {
    "degrees": degrees,
    "minutes": minutes,
    "seconds": seconds,
  };
}

class Planets {
  Planets({
    this.sun,
    this.moon,
    this.mercury,
    this.venus,
    this.mars,
    this.jupiter,
    this.saturn,
    this.uranus,
    this.neptune,
    this.pluto,
    this.chiron,
  });

  Sun sun;
  Moon moon;
  Chiron mercury;
  Pluto venus;
  Mars mars;
  PlanetsJupiter jupiter;
  Saturn saturn;
  Uranus uranus;
  Neptune neptune;
  Pluto pluto;
  Chiron chiron;

  factory Planets.fromJson(Map<String, dynamic> json) => Planets(
    sun: Sun.fromJson(json["sun"]),
    moon: Moon.fromJson(json["moon"]),
    mercury: Chiron.fromJson(json["mercury"]),
    venus: Pluto.fromJson(json["venus"]),
    mars: Mars.fromJson(json["mars"]),
    jupiter: PlanetsJupiter.fromJson(json["jupiter"]),
    saturn: Saturn.fromJson(json["saturn"]),
    uranus: Uranus.fromJson(json["uranus"]),
    neptune: Neptune.fromJson(json["neptune"]),
    pluto: Pluto.fromJson(json["pluto"]),
    chiron: Chiron.fromJson(json["chiron"]),
  );

  Map<String, dynamic> toJson() => {
    "sun": sun.toJson(),
    "moon": moon.toJson(),
    "mercury": mercury.toJson(),
    "venus": venus.toJson(),
    "mars": mars.toJson(),
    "jupiter": jupiter.toJson(),
    "saturn": saturn.toJson(),
    "uranus": uranus.toJson(),
    "neptune": neptune.toJson(),
    "pluto": pluto.toJson(),
    "chiron": chiron.toJson(),
  };
}

class Chiron {
  Chiron({
    this.planet,
    this.sign,
    this.chartAngle,
    this.signAngle,
    this.formattedChartAngle,
    this.formattedSignAngle,
    this.movement,
    this.aspects,
  });

  String planet;
  String sign;
  double chartAngle;
  double signAngle;
  FormattedAngle formattedChartAngle;
  FormattedAngle formattedSignAngle;
  String movement;
  ChironAspects aspects;

  factory Chiron.fromJson(Map<String, dynamic> json) => Chiron(
    planet: json["planet"],
    sign: json["sign"],
    chartAngle: json["chartAngle"].toDouble(),
    signAngle: json["signAngle"].toDouble(),
    formattedChartAngle: FormattedAngle.fromJson(json["formattedChartAngle"]),
    formattedSignAngle: FormattedAngle.fromJson(json["formattedSignAngle"]),
    movement: json["movement"],
    aspects: ChironAspects.fromJson(json["aspects"]),
  );

  Map<String, dynamic> toJson() => {
    "planet": planet,
    "sign": sign,
    "chartAngle": chartAngle,
    "signAngle": signAngle,
    "formattedChartAngle": formattedChartAngle.toJson(),
    "formattedSignAngle": formattedSignAngle.toJson(),
    "movement": movement,
    "aspects": aspects.toJson(),
  };
}

class ChironAspects {
  ChironAspects({
    this.moon,
    this.mercury,
    this.venus,
    this.jupiter,
    this.neptune,
    this.pluto,
    this.chiron,
  });

  MoonClass moon;
  MoonClass mercury;
  MoonClass venus;
  MoonClass jupiter;
  MoonClass neptune;
  MoonClass pluto;
  MoonClass chiron;

  factory ChironAspects.fromJson(Map<String, dynamic> json) => ChironAspects(
    moon: MoonClass.fromJson(json["moon"]),
    mercury: json["mercury"] == null ? null : MoonClass.fromJson(json["mercury"]),
    venus: MoonClass.fromJson(json["venus"]),
    jupiter: MoonClass.fromJson(json["jupiter"]),
    neptune: MoonClass.fromJson(json["neptune"]),
    pluto: MoonClass.fromJson(json["pluto"]),
    chiron: json["chiron"] == null ? null : MoonClass.fromJson(json["chiron"]),
  );

  Map<String, dynamic> toJson() => {
    "moon": moon.toJson(),
    "mercury": mercury == null ? null : mercury.toJson(),
    "venus": venus.toJson(),
    "jupiter": jupiter.toJson(),
    "neptune": neptune.toJson(),
    "pluto": pluto.toJson(),
    "chiron": chiron == null ? null : chiron.toJson(),
  };
}

class MoonClass {
  MoonClass({
    this.object,
    this.type,
    this.aspect,
    this.orb,
    this.movement,
  });

  String object;
  String type;
  int aspect;
  double orb;
  Movement movement;

  factory MoonClass.fromJson(Map<String, dynamic> json) => MoonClass(
    object: json["object"],
    type: json["type"],
    aspect: json["aspect"],
    orb: json["orb"].toDouble(),
    movement: movementValues.map[json["movement"]],
  );

  Map<String, dynamic> toJson() => {
    "object": object,
    "type": type,
    "aspect": aspect,
    "orb": orb,
    "movement": movementValues.reverse[movement],
  };
}

enum Movement { APPLICATIVE, SEPARATIVE, EXACT }

final movementValues = EnumValues({
  "Applicative": Movement.APPLICATIVE,
  "Exact": Movement.EXACT,
  "Separative": Movement.SEPARATIVE
});

class PlanetsJupiter {
  PlanetsJupiter({
    this.planet,
    this.sign,
    this.chartAngle,
    this.signAngle,
    this.formattedChartAngle,
    this.formattedSignAngle,
    this.movement,
    this.aspects,
  });

  String planet;
  String sign;
  double chartAngle;
  double signAngle;
  FormattedAngle formattedChartAngle;
  FormattedAngle formattedSignAngle;
  String movement;
  JupiterAspects aspects;

  factory PlanetsJupiter.fromJson(Map<String, dynamic> json) => PlanetsJupiter(
    planet: json["planet"],
    sign: json["sign"],
    chartAngle: json["chartAngle"].toDouble(),
    signAngle: json["signAngle"].toDouble(),
    formattedChartAngle: FormattedAngle.fromJson(json["formattedChartAngle"]),
    formattedSignAngle: FormattedAngle.fromJson(json["formattedSignAngle"]),
    movement: json["movement"],
    aspects: JupiterAspects.fromJson(json["aspects"]),
  );

  Map<String, dynamic> toJson() => {
    "planet": planet,
    "sign": sign,
    "chartAngle": chartAngle,
    "signAngle": signAngle,
    "formattedChartAngle": formattedChartAngle.toJson(),
    "formattedSignAngle": formattedSignAngle.toJson(),
    "movement": movement,
    "aspects": aspects.toJson(),
  };
}

class JupiterAspects {
  JupiterAspects({
    this.sun,
    this.moon,
    this.mercury,
    this.mars,
    this.saturn,
  });

  MoonClass sun;
  MoonClass moon;
  MoonClass mercury;
  MoonClass mars;
  MoonClass saturn;

  factory JupiterAspects.fromJson(Map<String, dynamic> json) => JupiterAspects(
    sun: MoonClass.fromJson(json["sun"]),
    moon: MoonClass.fromJson(json["moon"]),
    mercury: MoonClass.fromJson(json["mercury"]),
    mars: MoonClass.fromJson(json["mars"]),
    saturn: MoonClass.fromJson(json["saturn"]),
  );

  Map<String, dynamic> toJson() => {
    "sun": sun.toJson(),
    "moon": moon.toJson(),
    "mercury": mercury.toJson(),
    "mars": mars.toJson(),
    "saturn": saturn.toJson(),
  };
}

class Mars {
  Mars({
    this.planet,
    this.sign,
    this.chartAngle,
    this.signAngle,
    this.formattedChartAngle,
    this.formattedSignAngle,
    this.movement,
    this.aspects,
  });

  String planet;
  String sign;
  double chartAngle;
  double signAngle;
  FormattedAngle formattedChartAngle;
  FormattedAngle formattedSignAngle;
  String movement;
  MarsAspects aspects;

  factory Mars.fromJson(Map<String, dynamic> json) => Mars(
    planet: json["planet"],
    sign: json["sign"],
    chartAngle: json["chartAngle"].toDouble(),
    signAngle: json["signAngle"].toDouble(),
    formattedChartAngle: FormattedAngle.fromJson(json["formattedChartAngle"]),
    formattedSignAngle: FormattedAngle.fromJson(json["formattedSignAngle"]),
    movement: json["movement"],
    aspects: MarsAspects.fromJson(json["aspects"]),
  );

  Map<String, dynamic> toJson() => {
    "planet": planet,
    "sign": sign,
    "chartAngle": chartAngle,
    "signAngle": signAngle,
    "formattedChartAngle": formattedChartAngle.toJson(),
    "formattedSignAngle": formattedSignAngle.toJson(),
    "movement": movement,
    "aspects": aspects.toJson(),
  };
}

class MarsAspects {
  MarsAspects({
    this.sun,
    this.moon,
    this.venus,
    this.jupiter,
    this.saturn,
    this.uranus,
    this.neptune,
    this.northNode,
  });

  MoonClass sun;
  MoonClass moon;
  MoonClass venus;
  MoonClass jupiter;
  MoonClass saturn;
  MoonClass uranus;
  MoonClass neptune;
  MoonClass northNode;

  factory MarsAspects.fromJson(Map<String, dynamic> json) => MarsAspects(
    sun: MoonClass.fromJson(json["sun"]),
    moon: MoonClass.fromJson(json["moon"]),
    venus: MoonClass.fromJson(json["venus"]),
    jupiter: MoonClass.fromJson(json["jupiter"]),
    saturn: MoonClass.fromJson(json["saturn"]),
    uranus: MoonClass.fromJson(json["uranus"]),
    neptune: MoonClass.fromJson(json["neptune"]),
    northNode: MoonClass.fromJson(json["north node"]),
  );

  Map<String, dynamic> toJson() => {
    "sun": sun.toJson(),
    "moon": moon.toJson(),
    "venus": venus.toJson(),
    "jupiter": jupiter.toJson(),
    "saturn": saturn.toJson(),
    "uranus": uranus.toJson(),
    "neptune": neptune.toJson(),
    "north node": northNode.toJson(),
  };
}

class Moon {
  Moon({
    this.planet,
    this.sign,
    this.chartAngle,
    this.signAngle,
    this.formattedChartAngle,
    this.formattedSignAngle,
    this.movement,
    this.aspects,
  });

  String planet;
  String sign;
  double chartAngle;
  double signAngle;
  FormattedAngle formattedChartAngle;
  FormattedAngle formattedSignAngle;
  String movement;
  MoonAspects aspects;

  factory Moon.fromJson(Map<String, dynamic> json) => Moon(
    planet: json["planet"],
    sign: json["sign"],
    chartAngle: json["chartAngle"].toDouble(),
    signAngle: json["signAngle"].toDouble(),
    formattedChartAngle: FormattedAngle.fromJson(json["formattedChartAngle"]),
    formattedSignAngle: FormattedAngle.fromJson(json["formattedSignAngle"]),
    movement: json["movement"],
    aspects: MoonAspects.fromJson(json["aspects"]),
  );

  Map<String, dynamic> toJson() => {
    "planet": planet,
    "sign": sign,
    "chartAngle": chartAngle,
    "signAngle": signAngle,
    "formattedChartAngle": formattedChartAngle.toJson(),
    "formattedSignAngle": formattedSignAngle.toJson(),
    "movement": movement,
    "aspects": aspects.toJson(),
  };
}

class MoonAspects {
  MoonAspects({
    this.sun,
    this.mercury,
    this.venus,
    this.mars,
    this.jupiter,
    this.uranus,
    this.neptune,
    this.pluto,
  });

  MoonClass sun;
  MoonClass mercury;
  MoonClass venus;
  MoonClass mars;
  MoonClass jupiter;
  MoonClass uranus;
  MoonClass neptune;
  MoonClass pluto;

  factory MoonAspects.fromJson(Map<String, dynamic> json) => MoonAspects(
    sun: MoonClass.fromJson(json["sun"]),
    mercury: MoonClass.fromJson(json["mercury"]),
    venus: MoonClass.fromJson(json["venus"]),
    mars: MoonClass.fromJson(json["mars"]),
    jupiter: MoonClass.fromJson(json["jupiter"]),
    uranus: MoonClass.fromJson(json["uranus"]),
    neptune: MoonClass.fromJson(json["neptune"]),
    pluto: MoonClass.fromJson(json["pluto"]),
  );

  Map<String, dynamic> toJson() => {
    "sun": sun.toJson(),
    "mercury": mercury.toJson(),
    "venus": venus.toJson(),
    "mars": mars.toJson(),
    "jupiter": jupiter.toJson(),
    "uranus": uranus.toJson(),
    "neptune": neptune.toJson(),
    "pluto": pluto.toJson(),
  };
}

class Neptune {
  Neptune({
    this.planet,
    this.sign,
    this.chartAngle,
    this.signAngle,
    this.formattedChartAngle,
    this.formattedSignAngle,
    this.movement,
    this.aspects,
  });

  String planet;
  String sign;
  double chartAngle;
  double signAngle;
  FormattedAngle formattedChartAngle;
  FormattedAngle formattedSignAngle;
  String movement;
  NeptuneAspects aspects;

  factory Neptune.fromJson(Map<String, dynamic> json) => Neptune(
    planet: json["planet"],
    sign: json["sign"],
    chartAngle: json["chartAngle"].toDouble(),
    signAngle: json["signAngle"].toDouble(),
    formattedChartAngle: FormattedAngle.fromJson(json["formattedChartAngle"]),
    formattedSignAngle: FormattedAngle.fromJson(json["formattedSignAngle"]),
    movement: json["movement"],
    aspects: NeptuneAspects.fromJson(json["aspects"]),
  );

  Map<String, dynamic> toJson() => {
    "planet": planet,
    "sign": sign,
    "chartAngle": chartAngle,
    "signAngle": signAngle,
    "formattedChartAngle": formattedChartAngle.toJson(),
    "formattedSignAngle": formattedSignAngle.toJson(),
    "movement": movement,
    "aspects": aspects.toJson(),
  };
}

class NeptuneAspects {
  NeptuneAspects({
    this.sun,
    this.moon,
    this.mercury,
    this.venus,
    this.mars,
    this.pluto,
    this.chiron,
    this.saturn,
    this.neptune,
  });

  MoonClass sun;
  MoonClass moon;
  MoonClass mercury;
  MoonClass venus;
  MoonClass mars;
  MoonClass pluto;
  MoonClass chiron;
  MoonClass saturn;
  MoonClass neptune;

  factory NeptuneAspects.fromJson(Map<String, dynamic> json) => NeptuneAspects(
    sun: MoonClass.fromJson(json["sun"]),
    moon: MoonClass.fromJson(json["moon"]),
    mercury: MoonClass.fromJson(json["mercury"]),
    venus: MoonClass.fromJson(json["venus"]),
    mars: MoonClass.fromJson(json["mars"]),
    pluto: MoonClass.fromJson(json["pluto"]),
    chiron: MoonClass.fromJson(json["chiron"]),
    saturn: json["saturn"] == null ? null : MoonClass.fromJson(json["saturn"]),
    neptune: json["neptune"] == null ? null : MoonClass.fromJson(json["neptune"]),
  );

  Map<String, dynamic> toJson() => {
    "sun": sun.toJson(),
    "moon": moon.toJson(),
    "mercury": mercury.toJson(),
    "venus": venus.toJson(),
    "mars": mars.toJson(),
    "pluto": pluto.toJson(),
    "chiron": chiron.toJson(),
    "saturn": saturn == null ? null : saturn.toJson(),
    "neptune": neptune == null ? null : neptune.toJson(),
  };
}

class Pluto {
  Pluto({
    this.planet,
    this.sign,
    this.chartAngle,
    this.signAngle,
    this.formattedChartAngle,
    this.formattedSignAngle,
    this.movement,
    this.aspects,
  });

  String planet;
  String sign;
  double chartAngle;
  double signAngle;
  FormattedAngle formattedChartAngle;
  FormattedAngle formattedSignAngle;
  String movement;
  PlutoAspects aspects;

  factory Pluto.fromJson(Map<String, dynamic> json) => Pluto(
    planet: json["planet"],
    sign: json["sign"],
    chartAngle: json["chartAngle"].toDouble(),
    signAngle: json["signAngle"].toDouble(),
    formattedChartAngle: FormattedAngle.fromJson(json["formattedChartAngle"]),
    formattedSignAngle: FormattedAngle.fromJson(json["formattedSignAngle"]),
    movement: json["movement"],
    aspects: PlutoAspects.fromJson(json["aspects"]),
  );

  Map<String, dynamic> toJson() => {
    "planet": planet,
    "sign": sign,
    "chartAngle": chartAngle,
    "signAngle": signAngle,
    "formattedChartAngle": formattedChartAngle.toJson(),
    "formattedSignAngle": formattedSignAngle.toJson(),
    "movement": movement,
    "aspects": aspects.toJson(),
  };
}

class PlutoAspects {
  PlutoAspects({
    this.sun,
    this.moon,
    this.mercury,
    this.venus,
    this.uranus,
    this.neptune,
    this.chiron,
    this.mars,
    this.saturn,
  });

  MoonClass sun;
  MoonClass moon;
  MoonClass mercury;
  MoonClass venus;
  MoonClass uranus;
  MoonClass neptune;
  MoonClass chiron;
  MoonClass mars;
  MoonClass saturn;

  factory PlutoAspects.fromJson(Map<String, dynamic> json) => PlutoAspects(
    sun: MoonClass.fromJson(json["sun"]),
    moon: MoonClass.fromJson(json["moon"]),
    mercury: MoonClass.fromJson(json["mercury"]),
    venus: json["venus"] == null ? null : MoonClass.fromJson(json["venus"]),
    uranus: MoonClass.fromJson(json["uranus"]),
    neptune: MoonClass.fromJson(json["neptune"]),
    chiron: MoonClass.fromJson(json["chiron"]),
    mars: json["mars"] == null ? null : MoonClass.fromJson(json["mars"]),
    saturn: json["saturn"] == null ? null : MoonClass.fromJson(json["saturn"]),
  );

  Map<String, dynamic> toJson() => {
    "sun": sun.toJson(),
    "moon": moon.toJson(),
    "mercury": mercury.toJson(),
    "venus": venus == null ? null : venus.toJson(),
    "uranus": uranus.toJson(),
    "neptune": neptune.toJson(),
    "chiron": chiron.toJson(),
    "mars": mars == null ? null : mars.toJson(),
    "saturn": saturn == null ? null : saturn.toJson(),
  };
}

class Saturn {
  Saturn({
    this.planet,
    this.sign,
    this.chartAngle,
    this.signAngle,
    this.formattedChartAngle,
    this.formattedSignAngle,
    this.movement,
    this.aspects,
  });

  String planet;
  String sign;
  double chartAngle;
  double signAngle;
  FormattedAngle formattedChartAngle;
  FormattedAngle formattedSignAngle;
  String movement;
  SaturnAspects aspects;

  factory Saturn.fromJson(Map<String, dynamic> json) => Saturn(
    planet: json["planet"],
    sign: json["sign"],
    chartAngle: json["chartAngle"].toDouble(),
    signAngle: json["signAngle"].toDouble(),
    formattedChartAngle: FormattedAngle.fromJson(json["formattedChartAngle"]),
    formattedSignAngle: FormattedAngle.fromJson(json["formattedSignAngle"]),
    movement: json["movement"],
    aspects: SaturnAspects.fromJson(json["aspects"]),
  );

  Map<String, dynamic> toJson() => {
    "planet": planet,
    "sign": sign,
    "chartAngle": chartAngle,
    "signAngle": signAngle,
    "formattedChartAngle": formattedChartAngle.toJson(),
    "formattedSignAngle": formattedSignAngle.toJson(),
    "movement": movement,
    "aspects": aspects.toJson(),
  };
}

class SaturnAspects {
  SaturnAspects({
    this.sun,
    this.venus,
    this.mars,
    this.jupiter,
  });

  MoonClass sun;
  MoonClass venus;
  MoonClass mars;
  MoonClass jupiter;

  factory SaturnAspects.fromJson(Map<String, dynamic> json) => SaturnAspects(
    sun: MoonClass.fromJson(json["sun"]),
    venus: MoonClass.fromJson(json["venus"]),
    mars: MoonClass.fromJson(json["mars"]),
    jupiter: MoonClass.fromJson(json["jupiter"]),
  );

  Map<String, dynamic> toJson() => {
    "sun": sun.toJson(),
    "venus": venus.toJson(),
    "mars": mars.toJson(),
    "jupiter": jupiter.toJson(),
  };
}

class Sun {
  Sun({
    this.planet,
    this.sign,
    this.chartAngle,
    this.signAngle,
    this.formattedChartAngle,
    this.formattedSignAngle,
    this.movement,
    this.aspects,
  });

  String planet;
  String sign;
  double chartAngle;
  double signAngle;
  FormattedAngle formattedChartAngle;
  FormattedAngle formattedSignAngle;
  String movement;
  SunAspects aspects;

  factory Sun.fromJson(Map<String, dynamic> json) => Sun(
    planet: json["planet"],
    sign: json["sign"],
    chartAngle: json["chartAngle"].toDouble(),
    signAngle: json["signAngle"].toDouble(),
    formattedChartAngle: FormattedAngle.fromJson(json["formattedChartAngle"]),
    formattedSignAngle: FormattedAngle.fromJson(json["formattedSignAngle"]),
    movement: json["movement"],
    aspects: SunAspects.fromJson(json["aspects"]),
  );

  Map<String, dynamic> toJson() => {
    "planet": planet,
    "sign": sign,
    "chartAngle": chartAngle,
    "signAngle": signAngle,
    "formattedChartAngle": formattedChartAngle.toJson(),
    "formattedSignAngle": formattedSignAngle.toJson(),
    "movement": movement,
    "aspects": aspects.toJson(),
  };
}

class SunAspects {
  SunAspects({
    this.moon,
    this.mars,
    this.jupiter,
    this.saturn,
  });

  MoonClass moon;
  MoonClass mars;
  MoonClass jupiter;
  MoonClass saturn;

  factory SunAspects.fromJson(Map<String, dynamic> json) => SunAspects(
    moon: MoonClass.fromJson(json["moon"]),
    mars: MoonClass.fromJson(json["mars"]),
    jupiter: MoonClass.fromJson(json["jupiter"]),
    saturn: MoonClass.fromJson(json["saturn"]),
  );

  Map<String, dynamic> toJson() => {
    "moon": moon.toJson(),
    "mars": mars.toJson(),
    "jupiter": jupiter.toJson(),
    "saturn": saturn.toJson(),
  };
}

class Uranus {
  Uranus({
    this.planet,
    this.sign,
    this.chartAngle,
    this.signAngle,
    this.formattedChartAngle,
    this.formattedSignAngle,
    this.movement,
    this.aspects,
  });

  String planet;
  String sign;
  double chartAngle;
  double signAngle;
  FormattedAngle formattedChartAngle;
  FormattedAngle formattedSignAngle;
  String movement;
  UranusAspects aspects;

  factory Uranus.fromJson(Map<String, dynamic> json) => Uranus(
    planet: json["planet"],
    sign: json["sign"],
    chartAngle: json["chartAngle"].toDouble(),
    signAngle: json["signAngle"].toDouble(),
    formattedChartAngle: FormattedAngle.fromJson(json["formattedChartAngle"]),
    formattedSignAngle: FormattedAngle.fromJson(json["formattedSignAngle"]),
    movement: json["movement"],
    aspects: UranusAspects.fromJson(json["aspects"]),
  );

  Map<String, dynamic> toJson() => {
    "planet": planet,
    "sign": sign,
    "chartAngle": chartAngle,
    "signAngle": signAngle,
    "formattedChartAngle": formattedChartAngle.toJson(),
    "formattedSignAngle": formattedSignAngle.toJson(),
    "movement": movement,
    "aspects": aspects.toJson(),
  };
}

class UranusAspects {
  UranusAspects({
    this.sun,
    this.moon,
    this.venus,
    this.mars,
    this.saturn,
    this.pluto,
  });

  MoonClass sun;
  MoonClass moon;
  MoonClass venus;
  MoonClass mars;
  MoonClass saturn;
  MoonClass pluto;

  factory UranusAspects.fromJson(Map<String, dynamic> json) => UranusAspects(
    sun: MoonClass.fromJson(json["sun"]),
    moon: MoonClass.fromJson(json["moon"]),
    venus: MoonClass.fromJson(json["venus"]),
    mars: MoonClass.fromJson(json["mars"]),
    saturn: MoonClass.fromJson(json["saturn"]),
    pluto: MoonClass.fromJson(json["pluto"]),
  );

  Map<String, dynamic> toJson() => {
    "sun": sun.toJson(),
    "moon": moon.toJson(),
    "venus": venus.toJson(),
    "mars": mars.toJson(),
    "saturn": saturn.toJson(),
    "pluto": pluto.toJson(),
  };
}

class Points {
  Points({
    this.northNode,
    this.southNode,
    this.syzygy,
    this.parsFortuna,
  });

  ThNode northNode;
  ThNode southNode;
  Syzygy syzygy;
  Neptune parsFortuna;

  factory Points.fromJson(Map<String, dynamic> json) => Points(
    northNode: ThNode.fromJson(json["north node"]),
    southNode: ThNode.fromJson(json["south node"]),
    syzygy: Syzygy.fromJson(json["syzygy"]),
    parsFortuna: Neptune.fromJson(json["pars fortuna"]),
  );

  Map<String, dynamic> toJson() => {
    "north node": northNode.toJson(),
    "south node": southNode.toJson(),
    "syzygy": syzygy.toJson(),
    "pars fortuna": parsFortuna.toJson(),
  };
}

class ThNode {
  ThNode({
    this.planet,
    this.sign,
    this.chartAngle,
    this.signAngle,
    this.formattedChartAngle,
    this.formattedSignAngle,
    this.movement,
    this.aspects,
  });

  String planet;
  String sign;
  double chartAngle;
  double signAngle;
  FormattedAngle formattedChartAngle;
  FormattedAngle formattedSignAngle;
  String movement;
  NorthNodeAspects aspects;

  factory ThNode.fromJson(Map<String, dynamic> json) => ThNode(
    planet: json["planet"],
    sign: json["sign"],
    chartAngle: json["chartAngle"].toDouble(),
    signAngle: json["signAngle"].toDouble(),
    formattedChartAngle: FormattedAngle.fromJson(json["formattedChartAngle"]),
    formattedSignAngle: FormattedAngle.fromJson(json["formattedSignAngle"]),
    movement: json["movement"],
    aspects: NorthNodeAspects.fromJson(json["aspects"]),
  );

  Map<String, dynamic> toJson() => {
    "planet": planet,
    "sign": sign,
    "chartAngle": chartAngle,
    "signAngle": signAngle,
    "formattedChartAngle": formattedChartAngle.toJson(),
    "formattedSignAngle": formattedSignAngle.toJson(),
    "movement": movement,
    "aspects": aspects.toJson(),
  };
}

class NorthNodeAspects {
  NorthNodeAspects({
    this.sun,
    this.moon,
    this.mercury,
    this.venus,
    this.jupiter,
    this.chiron,
  });

  MoonClass sun;
  MoonClass moon;
  MoonClass mercury;
  MoonClass venus;
  MoonClass jupiter;
  MoonClass chiron;

  factory NorthNodeAspects.fromJson(Map<String, dynamic> json) => NorthNodeAspects(
    sun: MoonClass.fromJson(json["sun"]),
    moon: MoonClass.fromJson(json["moon"]),
    mercury: MoonClass.fromJson(json["mercury"]),
    venus: MoonClass.fromJson(json["venus"]),
    jupiter: MoonClass.fromJson(json["jupiter"]),
    chiron: MoonClass.fromJson(json["chiron"]),
  );

  Map<String, dynamic> toJson() => {
    "sun": sun.toJson(),
    "moon": moon.toJson(),
    "mercury": mercury.toJson(),
    "venus": venus.toJson(),
    "jupiter": jupiter.toJson(),
    "chiron": chiron.toJson(),
  };
}

class Syzygy {
  Syzygy({
    this.planet,
    this.sign,
    this.chartAngle,
    this.signAngle,
    this.formattedChartAngle,
    this.formattedSignAngle,
    this.movement,
    this.aspects,
  });

  String planet;
  String sign;
  double chartAngle;
  double signAngle;
  FormattedAngle formattedChartAngle;
  FormattedAngle formattedSignAngle;
  String movement;
  List<dynamic> aspects;

  factory Syzygy.fromJson(Map<String, dynamic> json) => Syzygy(
    planet: json["planet"],
    sign: json["sign"],
    chartAngle: json["chartAngle"].toDouble(),
    signAngle: json["signAngle"].toDouble(),
    formattedChartAngle: FormattedAngle.fromJson(json["formattedChartAngle"]),
    formattedSignAngle: FormattedAngle.fromJson(json["formattedSignAngle"]),
    movement: json["movement"],
    aspects: List<dynamic>.from(json["aspects"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "planet": planet,
    "sign": sign,
    "chartAngle": chartAngle,
    "signAngle": signAngle,
    "formattedChartAngle": formattedChartAngle.toJson(),
    "formattedSignAngle": formattedSignAngle.toJson(),
    "movement": movement,
    "aspects": List<dynamic>.from(aspects.map((x) => x)),
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
