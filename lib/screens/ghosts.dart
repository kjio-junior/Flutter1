class Ghost {
  final String name;
  final String description;
  final String lightImagePath;
  final String darkImagePath;
  final String lightNamePath;
  final String darkNamePath;
  final String lightPageCountPath;
  final String darkPageCountPath;
  final List<String> sources;

  Ghost({
    required this.name,
    required this.description,
    required this.lightImagePath,
    required this.darkImagePath,
    required this.lightNamePath,
    required this.darkNamePath,
    required this.lightPageCountPath,
    required this.darkPageCountPath,
    this.sources = const [],
  });
}

// List of ghost entries
List<Ghost> ghostEntries = [
  Ghost(
    name: "White Lady of Balete Drive",
    description:
        "The White Lady or Kaperosa of Balete Drive is a spectral figure said to be haunting the two-lane street of Balete Drive in New Manila, Quezon City, Philippines. \n\n"
        "Witnesses describe her to be a woman wearing a dirty white dress with long hair covering her face. \n\n"
        "Her origins are mostly debated; some say that she was a victim of a hit-and-run by a taxi driving on that street, while some say she was a UP Manila student who was raped, killed and (her body) dumped by a Balete tree on the same street. \n\n"
        "Witnesses have been urging drivers to avoid the street if they're alone, especially at night. When possible, the back seat should be fully occupied and that no one should ever look back or stare in any of the car's mirrors. \n\n"
        "Her restless spirit is believed to linger along the road, seeking justice — or revenge. \n\n",
    lightImagePath: "lib/assets/ghost/whitelady_light.png",
    darkImagePath: "lib/assets/ghost/whitelady_dark.png",
    lightNamePath: "lib/assets/ghost/whiteladyname_light.png",
    darkNamePath: "lib/assets/ghost/whiteladyname_dark.png",
    lightPageCountPath: "lib/assets/ghost/Gpagecount1_light.png",
    darkPageCountPath: "lib/assets/ghost/Gpagecount1_dark.png",
    sources: [
      "https://philstarlife.com/news-and-views/128777-white-lady-balete-drive-story-slow-news-day",
      "https://medium.com/@ragnarrrasmusson/the-weeping-woman-of-manila-the-balete-drive-ghost-ce19cc65b1e5",
      "https://nextshark.com/white-lady-ghost-filipino-culture",
      "https://en.wikipedia.org/wiki/Balete_Drive",
    ],
  ),
  Ghost(
    name: "Ghosts of Diplomat Hotel",
    description:
        "The Diplomat Hotel was a serene retreat built by the Dominican Order as a place for spiritual reflection back in 1913. Officially called the Dominican Hill Retreat  House, it was meant to provide peace and tranquility for its residents. \n\n"
        "During World War II, Japanese forces invaded the retreat house, turning it into a garrison. It was here that the Japanese secret police, the Kempeitai, committed terrible acts of  brutality, massacring, raping, and torturing many of the inhabitants,  and even decapitating nuns and priests.\n\n"
        "During the liberation of the Philippines in 1945, as the American forces inches closer, a batallion of Japanese soldiers committed hara-kiri in the building's right wing. \n\n"
        "In the 1970s, entrepreneur and faith healer Antonio Agapito “Tony” Agpaoa acquired the property and transformed it into the Diplomat Hotel. \n\n"
        "However, the building's eerie history seemed to cast a shadow over its operations. Guests and staff began reporting strange  occurrences, some of which include: \n\n"
        "Headless Apparitions: Visitors reported seeing headless figures wandering the halls. These apparitions are believed to be the spirits of people who were brutally executed during the war. \n\n"
        "Crying Babies: Guests report hearing the sound of  crying babies echoing through the empty corridors. The origin of these  ghostly cries remains a mystery. \n\n"
        "Unexplained Noises: Many visitors claim to hear whispers, footsteps, or loud banging even when the site is completely empty.",
    lightImagePath: "lib/assets/ghost/diplomat_light.png",
    darkImagePath: "lib/assets/ghost/diplomat_dark.png",
    lightNamePath: "lib/assets/ghost/diplomatname_light.png",
    darkNamePath: "lib/assets/ghost/diplomatname_dark.png",
    lightPageCountPath: "lib/assets/ghost/Gpagecount2_light.png",
    darkPageCountPath: "lib/assets/ghost/Gpagecount2_dark.png",
    sources: [
      "https://www.flickr.com/photos/28006802@N07/8644515537",
      "https://www.nomadicexperiences.com/2021/03/the-haunting-at-old-diplomat-hotel.html",
      "https://www.atlasobscura.com/places/haunted-diplomat-hotel",
      "https://baguiocityguide.com/history-of-diplomat-hotel/",
      "https://en.wikipedia.org/wiki/Diplomat_Hotel",
      "https://www.facebook.com/steveroninofficial",
    ],
  ),

  Ghost(
    name: "Spectres of Manila Film Center",
    description:
        "The Manila Film Center is a building located at the southwest end of the Cultural Center of the Philippines Complex in Pasay, Philippines. The structure was designed by architect Froilan Hong and served as the main theater for the First Manila International Film Festival[2] (MIFF) January 18-29, 1982. \n\n"
        "Then First Lady Imelda Marcos envisioned Manila as the cultural center of Asia. The Film Center's entire purpose was to facilitate her dream of hosting a brand new international film festival, one that would that would rival the famed Cannes Film Festival of France. \n\n"
        "Construction only started a mere three months before the film festival was supposed to be held. To make it work, some 4,000 workers were employed to work in three shifts across 24 hours. The lobby was finished in 72 hours by 1,000 workers—a job that was supposed to entail six weeks. \n\n"
        "On November 17, 1981, at around 3 a.m., scaffolding collapsed and workers fell from the sixth floor, entombing them in quick-drying cement, which was still wet. It turns out that the workers didn't have time to let each layer of the cement dry before moving on, so when they fell, the victims sunk into the wet cement, and were left for dead as it dried. \n\n"
        "Immediately, a blanket security and a media blackout were imposed for fear of creating a scandal. This meant emergency services couldn't enter the building to help the victims for nine hours after the incident. As a result, at least 168 workers were officially declared dead, either buried in the cement or impaled by steel bars from the scaffolding. \n\n"
        "Imelda was hell-bent on getting the film center built in time for the film festival, so instead of clearing away the bodies and fallen cement, she allegedly ordered the visible body parts of deceased workers to be cut off, and cement to be laid over the top, which Mila Llorin, Head of Marketing for Manila Film Festival at the time, has since confirmed. \n\n"
        "That very first Manila Film Festival did indeed go ahead in January 1982 with the Marcoses welcoming Hollywood stars like George Hamilton, Peter Ustinov and Priscilla Presley. Unbeknownst to these star-studded celebrities, they were walking and dancing on over 100 corpses."
        "Today, the building sits abandoned. Visitor accounts of unexplained noises, voices, and poltergeist activity are among the most commonly reported. Every so often, reports of full apparitions, visions of blood dripping down the walls, and the sight of arms or hands reaching desperately from underneath doorframes emerge, as well. \n\n"
        "It's said that most security guards don't last more than a week or so on shift here before asking to be reassigned. \n\n"
        "Whether or not these accounts are embellished, one thing stays true: the tragedy did occur. The ghost stories make sure the memory of those who lost their lives will never be forgotten. The stories grant these souls literal life after death, and ask that the past not be repeated again. \n\n",
    lightImagePath: "lib/assets/ghost/MNLfilm_light.png",
    darkImagePath: "lib/assets/ghost/MNLfilm_dark.png",
    lightNamePath: "lib/assets/ghost/MNLfilmname_light.png",
    darkNamePath: "lib/assets/ghost/MNLfilmname_dark.png",
    lightPageCountPath: "lib/assets/ghost/Gpagecount3_light.png",
    darkPageCountPath: "lib/assets/ghost/Gpagecount3_dark.png",
    sources: [
      "https://www.istockphoto.com/photos/manual-worker-back-lit-building-contractor-shadow?page=2",
      "https://en.wikipedia.org/wiki/Manila_Film_Center",
      "https://faroutmagazine.co.uk/tragedy-of-the-manila-film-center/",
      "https://www.atlasobscura.com/places/manila-film-center",
      "https://theghostinmymachine.com/2023/08/21/haunted-globetrotting-the-manila-film-centers-horrifying-history-philippines/",
    ],
  ),

  Ghost(
    name: "Hauntings in Clark Air Base Hospital",
    description:
        "Clark Air Base Hospital was a significant military hospital in Angeles, Pampanga, Philippines, serving American and Filipino soldiers during World War II, the Vietnam War, and beyond. It was originally a small dispensary for American soldiers and grew into a key medical facility. \n\n"
        "The Clark Air Base hospital played a critical part in military errands, filling in as a medical center for harmed warriors and pilots. \n\n"
        "During World War II, Clark Air Base fell under Japanese control. They used the hospital as a prison and execution site, with countless prisoners of war (POWs) executed within its walls. Various American and Filipino officials were brutally killed in the hospital's basement.\n\n"
        "During the Vietnam War, Clark Air Base hospital transformed into a major medical evacuation center for American officials. Numerous injured soldiers, were flown in from fight zones in Vietnam. \n\n"
        "In 1991, the eruption of Mount Pinatubo sparked the end of Clark Air Base. The center was abandoned as the U.S. military pulled out from the Philippines, leaving a creepy shell of what was once a clamoring hospital. \n\n"
        "The hospital bore witness to the brutal realities of war and the stories of survival etched into its walls. Some spirits remain, lingering in the silence, unable to cross beyond. Guests report sightings of the following: \n\n"
        "Apparitions of Soldiers and Nurses - Guests have reported seeing shadowy figures in military outfits meandering the hospital hall. Some have similarly seen medical personnel in dated white outfits, seemingly doting on unseen patients. \n\n"
        "Sounds and Whispering Voices - Visitors have reported hearing distant cries, mumbles (perceived to be spirits talking with one another) and unanticipated boisterous hollers seemingly coming from nowhere. \n\n"
        "Mysterious Footsteps and Door Slamming - Doors in the hospital have been seen and heard shutting by themselves. Visitors report hearing the sound of footsteps following them, turning around to see no one there. \n\n"
        "Cold Spots and Sudden Temperature Drops - Various paranormal enthusiasts have reported experiencing sudden temperature changes while inside the hospital, particularly in the memorial service home and tornado shelter — places with allegedly the highest death count.\n\n"
        "The remnants of the hospital serves as a reminder of its violent history. The ruins are unofficially dubbed as one of the most haunted places in the country, attracting many curious visitors and paranormal enthusiasts alike to explore its eerie halls.",
    lightImagePath: "lib/assets/ghost/clarkhosp_light.png",
    darkImagePath: "lib/assets/ghost/clarkhosp_dark.png",
    lightNamePath: "lib/assets/ghost/clarkhospname_light.png",
    darkNamePath: "lib/assets/ghost/clarkhospname_dark.png",
    lightPageCountPath: "lib/assets/ghost/Gpagecount4_light.png",
    darkPageCountPath: "lib/assets/ghost/Gpagecount4_dark.png",
    sources: [
      "https://www.flickr.com/photos/28006802@N07/8644515537",
      "https://www.atthefront.com/WWII-Infantryman-Package-p/uspkginfi.htm",
      "https://vocal.media/horror/clark-air-base-hospital-the-most-haunted-military-ruin-in-the-philippines",
      "https://en.wikipedia.org/wiki/History_of_Clark_Air_Base",
    ],
  ),

  Ghost(
    name: "Wandering Souls of Paco Cemetery",
    description:
        "The Paco Park (originally named as Cementerio General de Dilao) is a recreational garden and was once Manila's municipal cemetery built by the Dominicans during the Spanish colonial period. \n\n"
        "Built in 1807, Paco Park was originally designed to be a final resting place for the colonial elite; the inner walls of the circular garden still houses the marble crypt markers that bear their family names. \n\n"
        "The cemetery was later expanded in 1822 to accommodate victims of the city's devastating cholera outbreak, with a second wall built to enclose the newer graves. Yet the cemetery's most famous residents were buried inconspicuously in unmarked graves, their names never immortalized on either of the cemetery walls. \n\n"
        "On February 17, 1872, the Spanish executed three Filipino priests: Mariano Gomez, Jose Burgos, and Jacinto Zamora, known collectively as Gomburza, for allegedly inciting a mutiny against the colonial government. The three priests, branded as traitors and killed, were buried together in an unmarked grave in Paco Park.\n\n"
        "In 1896, Philippine national hero Jose P. Rizal was executed by the Spanish for his presumed involvement in the Philippine Revolution. Like the three martyred priests, Rizal's body was buried in an unmarked grave between the two walls of Paco Park cemetery. Though Rizal's body has since been moved, the coded grave marker, 'RPJ' (his initials in reverse) remains at Paco Park. \n\n"
        "Today, it remains a popular choice among park-goers due to its architecture and history. Visitors often report playful souls slamming doors in the women's bathroom, appearing and running past video recording devices, whispers, partial and full body apparitions, among others. One guard allegedly was woken up from his nap by a voice whispering to him '1907 Margarita Miguel' "
        "to which a ghostly bride appeared before him. Searching through the names carved onto lapidas in the area revealed one that matched what the voice told him. The reason for the spirit's appearance is unknown.",
    lightImagePath: "lib/assets/ghost/pacocem_light.png",
    darkImagePath: "lib/assets/ghost/pacocem_dark.png",
    lightNamePath: "lib/assets/ghost/pacocemname_light.png",
    darkNamePath: "lib/assets/ghost/pacocemname_dark.png",
    lightPageCountPath: "lib/assets/ghost/Gpagecount5_light.png",
    darkPageCountPath: "lib/assets/ghost/Gpagecount5_dark.png",
    sources: [
      "https://en.wikipedia.org/wiki/Paco_Park",
      "https://recoletos.ph/2024/02/22/gomburza-and-the-recoletos-uncovering-historical-facts/",
      "https://www.atlasobscura.com/places/paco-park-cemetery",
      "https://www.facebook.com/share/p/1AL69CCTqa/",
    ],
  ),
];
