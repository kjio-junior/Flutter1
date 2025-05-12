class Aswang {
  final String name;
  final String description;
  final String lightImagePath;
  final String darkImagePath;
  final String lightNamePath;
  final String darkNamePath;
  final String lightPageCountPath;
  final String darkPageCountPath;
  final List<String> sources;

  Aswang({
    required this.name,
    required this.description,
    required this.lightImagePath,
    required this.darkImagePath,
    required this.lightNamePath,
    required this.darkNamePath,
    required this.lightPageCountPath,
    required this.darkPageCountPath,
    required this.sources,
  });
}

List<Aswang> aswangEntries = [
  Aswang(
    name: "Manananggal",
    description:
        "A manananggal is a vampire-like creature from Philippine folklore, often depicted as a woman who can separate her upper torso from her lower body and fly using bat-like wings to hunt at night. It preys on sleeping people, especially pregnant women, using a long tongue to suck blood or eat unborn children.\n\n"
        "The severed lower torso is left standing, and is the more vulnerable of the two halves. Sprinkling salt, smearing crushed garlic, lighting it on fire, or smearing ash on top of the standing torso is fatal to the creature. The upper torso would then be unable to rejoin itself and would perish by sunrise.\n\n"
        "Sunlight is deadly to the Manananggal when she is in her monstrous form. Should her two halves still be separated with the coming of dawn, she will be destroyed. \n\n"
        "The word manananggál comes from the Tagalog word tanggál, which means 'to remove' or 'to separate', which literally translates as 'remover' or 'separator'. In this case, 'one who separates itself'. \n\n"
        "A manananggal can also be a sorceress that visits villages and barrios. In some stories, the Wakwak and/or the Sigbin are kept by them as either pets or servants.",
    lightImagePath: "lib/assets/aswang/manananggal.png",
    darkImagePath: "lib/assets/aswang/manananggal.png",
    lightNamePath: "lib/assets/aswang/manananggalname_light.png",
    darkNamePath: "lib/assets/aswang/manananggalname_dark.png",
    lightPageCountPath: "lib/assets/aswang/Apagecount1_light.png",
    darkPageCountPath: "lib/assets/aswang/Apagecount1_dark.png",
    sources: [
      "https://mythus.fandom.com/wiki/Manananggal",
      "https://en.wikipedia.org/wiki/Manananggal",
      "https://forums.stanwinstonschool.com/discussion/7348/manananggal",
    ],
  ),

  Aswang(
    name: "Balbal",
    description:
        "Balbal is a creature from Filipino folklore, particularly in Visayan mythology. It's a type of aswang, which is a general term for various shape-shifting evil spirits in the Philippines.\n\n"
        "The balbal is described as a nocturnal, corpse-eating creature that prowls graveyards under the cover of night. Since it eats nothing but corpses, it has a foul breath. \n\n"
        "According to legend, it has an extraordinarily keen sense of smell, which allows it to locate freshly buried bodies from great distances.\n\n"
        "To avoid alerting the grieving family or cemetery caretakers, it allegedly replaces the stolen corpse with objects like banana trunks or decaying wood, which maintain the general weight and shape of a body.\n\n",
    lightImagePath: "lib/assets/aswang/balbal.png",
    darkImagePath: "lib/assets/aswang/balbal.png",
    lightNamePath: "lib/assets/aswang/balbalname_light.png",
    darkNamePath: "lib/assets/aswang/balbalname_dark.png",
    lightPageCountPath: "lib/assets/aswang/Apagecount2_light.png",
    darkPageCountPath: "lib/assets/aswang/Apagecount2_dark.png",
    sources: [
      "https://cryptidz.fandom.com/wiki/Balbal",
      "https://en.wikipedia.org/wiki/Bal-Bal",
    ],
  ),

  Aswang(
    name: "Tiktik",
    description:
        "The Tiktik is a mythical creature closely linked to the Aswang, often described as either a variant of it or as its companion.\n\n"
        "It gets its name from the distinctive “tik-tik” sound it makes while hunting at night—though in a chilling twist, the farther away the sound seems, the closer the creature actually is.\n\n"
        "The Tiktik is believed to have the ability to fly and transform into animals like birds or large bats, using its long, proboscis-like tongue to suck the blood or fetuses of sleeping pregnant women.\n\n"
        "To protect themselves, Filipinos traditionally use garlic, salt, ash, sharp objects, and traditional herbs like tanglad (lemongrass).\n\n"
        "The Tiktik reflects deep cultural anxieties about pregnancy, health, and safety, especially in rural communities.\n\n",
    lightImagePath: "lib/assets/aswang/tiktik.png",
    darkImagePath: "lib/assets/aswang/tiktik.png",
    lightNamePath: "lib/assets/aswang/tiktikname_light.png",
    darkNamePath: "lib/assets/aswang/tiktikname_dark.png",
    lightPageCountPath: "lib/assets/aswang/Apagecount3_light.png",
    darkPageCountPath: "lib/assets/aswang/Apagecount3_dark.png",
    sources: [
      "https://jsmarantz.artstation.com/projects/GaOGA1",
      "https://discover.hubpages.com/religion-philosophy/tiktik-the-filipino-supernatural-folklore",
      "",
    ],
  ),

  Aswang(
    name: "Yanggaw",
    description:
        "In Visayan folklore, Yanggaw refers to a person who becomes an aswang-like creature after being infected, often by eating food tainted or offered by aswangs. \n\n"
        "This form of transformation is not a natural condition but rather a curse or contagion, passed down through black magic, sorcery, or supernatural contamination.\n\n"
        "Once infected, the person gradually loses their humanity, becoming a nocturnal predator that feeds on flesh, blood, or internal organs.\n\n"
        "The yanggaw's transformation typically begins subtly, with physical changes and an uncontrollable craving for raw meat or blood. Over time, the person becomes fully monstrous, often against their will.\n\n",
    lightImagePath: "lib/assets/aswang/yanggaw.png",
    darkImagePath: "lib/assets/aswang/yanggaw.png",
    lightNamePath: "lib/assets/aswang/yanggawname_light.png",
    darkNamePath: "lib/assets/aswang/yanggawname_dark.png",
    lightPageCountPath: "lib/assets/aswang/Apagecount4_light.png",
    darkPageCountPath: "lib/assets/aswang/Apagecount4_dark.png",
    sources: ["https://phspirits.com/yanggaw-tagalog-translation/"],
  ),

  Aswang(
    name: "Tiyanak",
    description:
        "the Tiyanak is a supernatural being that is notorious for its deceptive nature. It is said to take the appearance of a helpless infant, crying in the forest or on the side of the road to attract unsuspecting individuals. \n\n"
        "Once it is picked up by an unfortunate passerby, it reverts to its true form and attacks the victim.\n\n"
        "When someone approaches to help the crying baby, the tiyanak reveals its true form—an evil, monstrous entity—and attacks, often with a sharp bite or claws. Some versions also depict the tiyanak as a revenant—the restless spirit of a child who died before being baptized or who was wronged in some way during their short life.\n\n"
        "The Mandaya people of Mindanao claim that the tiyanak is the spirit of a child whose mother died before giving birth. This caused it to be 'born in the ground', thus gaining its current state.\n\n"
        "In local belief, various countermeasures are supposedly effective against the tiyanak. Those that were led astray by the creature's cries are believed to be able to break the enchantment by turning their clothes inside out.\n\n"
        "The tiyanak finds the method humorous enough to let go of the traveler and go back to the jungles. Loud noises such as a New Year's celebration are also thought to be enough to drive the tiyanak away from the vicinity.\n\n"
        "Objects believed to repel Aswang (vampiric shape-shifters), like garlic and the rosary *rosemary* are also commonly believed to be effective against the tiyanak.\n\n"
        "It is also believed that giving a name to these lost souls will bring them peace, and offering a white candle will help guide its spirit to afterlife.",
    lightImagePath: "lib/assets/aswang/tiyanak.png",
    darkImagePath: "lib/assets/aswang/tiyanak.png",
    lightNamePath: "lib/assets/aswang/tiyanakname_light.png",
    darkNamePath: "lib/assets/aswang/tiyanakname_dark.png",
    lightPageCountPath: "lib/assets/aswang/Apagecount5_light.png",
    darkPageCountPath: "lib/assets/aswang/Apagecount5_dark.png",
    sources: [
      "https://mythus.fandom.com/wiki/Tiyanak",
      "https://en.wikipedia.org/wiki/Tiyanak",
      "https://www.youtube.com/watch?v=h5-gJ3fjMkw",
    ],
  ),
];
