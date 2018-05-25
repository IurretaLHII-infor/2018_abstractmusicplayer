/*genres*/

insert into genres(name) values
("Rock"),
("Hip-Hop"),
("Punk"),
("Pop"),
("Reggae"),
("Electronic"),
("Classical"),
("Metal");


/*subgenres*/

insert into subgenres(name) values
("Psychedelic Rock"),
("Hard rock"),
("Experimental Rock"),
("Rap"),
("Rap Rock"),
("Instrumental Rap"),
("Punk-Rock"),
("Grunge"),
("Nintendocore"),
("Pop Rock"),
("Pop"),
("Reggae fusion"),
("Ragga"),
("Dubstep"),
("House"),
("Disco"),
("Orchestral"),
("Opera"),
("Black Metal"),
("Death Metal"),
("Heavy Metal");

/*artists*/

insert into artists(name) values
("Buckethead"), /*Psychedelic rock*/ /*Hard rock*/ /*Experimental rock*/
("Pink Floyd"), /*Psychedelic rock*/
("The Doors"), /*Psychedelic rock*/
("The Jimi Hendrix Experience"), /*Psychedelic rock*/
("Led Zeppelin"), /*Hard rock*/
("Deep Purple"), /*Hard rock*/
("AC/DC"), /*Hard rock*/
("The Velvet Underground"), /*Experimental rock*/
("David Bowie"), /*Experimental rock*/
("Radiohead"), /*Experimental rock*/
("Rapsusklei"), /*Rap*/
("Sharif"), /*Rap*/
("Juaninnacka"), /*Rap*/
("Nach"), /*Rap*/
("Dangerkids"),
("Rage Against the Machine"), /*Rap rock*/
("311"), /*Rap rock*/
("Cypress Hill"), /*Rap rock*/
("Lex Luthordz"), /*Instrumental rap*/
("J Dilla"), /*Instrumental rap*/
("DJ Shadow"), /*Instrumental rap*/
("Madlib"), /*Instrumental rap*/
("Billy Talent"), /*Punk rock*/
("Dead Kennedys"), /*Punk rock*/
("The Clash"), /*Punk rock*/
("Operation Ivy"), /*Punk rock*/
("Nirvana"), /*Grunge*/
("Pearl Jam"), /*Grunge*/
("Mad Season"), /*Grunge*/
("Hole"), /*Grunge*/
("Minibosses"), /*Nintendocore*/  /*https://nintendocore.wordpress.com/*/
("Are You Afraid of the Dog"), /*Nintendocore*/
("ThePlasmas"), /*Nintendocore*/
("Dolphins Are Gay Sharks"), /*Nintendocore*/
("Daughtry"), /*Pop rock*/
("Van Morrison"), /*Pop rock*/
("Bob Dylan"), /*Pop rock*/
("The National"), /*Pop rock*/
("Michael Jackson"), /*Pop*/
("The Beatles"), /*Pop*/
("The Beach Boys"), /*Pop*/
("Kate Bush"), /*Pop*/
("Green Valley"), /*Reggae*/
("Bob Marley"), /*Reggae*/
("Augustus Pablos"), /*Reggae*/
("Various"), /*Reggae*/
("Nikone"), /*Ragga*/
("Damian Marley"), /*Ragga*/
("Vavamuffin"), /*Ragga*/
("The Bug"), /*Ragga*/
("Skrillex"), /*Dubstep*/
("Burial"), /*Dubstep*/
("Shackleton"), /*Dubstep*/
("Guido"), /*Dubstep*/
("Avicci"), /*House*/
("Booka Shade"), /*House*/
("Max D"), /*House*/
("Ben UFO"), /*House*/
("Daft Punk"), /*Disco*/
("Sparks"), /*Disco*/
("Chic"), /*Disco*/
("Giorgio Moroeder"), /*Disco*/
("Joe Hisaishi"), /*Orchestrall*/
("Yiruma"), /*Orchestrall*/
("Brian Crain"), /*Orchestrall*/
("Nobuo Uematsu"), /*Orchestrall*/
("Bizet"), /*Opera*/
("Mozart"), /*Opera*/
("Verdi"), /*Opera*/
("Wagner"), /*Opera*/
("Deafheaven"), /*Black metal*/
("Dodsferd"), /*Black metal*/
("Nefarium"), /*Black metal*/
("Countess"), /*Black metal*/
("Slipknot"), /*Death metal*/
("Morbid Angel"), /*Death metal*/
("Cryptopsy"), /*Death metal*/
("Entombed"), /*Death metal*/
("Black Sabbath"), /*Heavy Metal*/
("Thin Lizzy"), /*Heavy Metal*/
("Slayer"), /*Heavy Metal*/
("Motörhead"); /*Heavy Metal*/



/*albums*/

insert into albums(name,year) values
("Bucketheadland Pike 27-Halls of Dimension",2013), /*Psychedelic rock*/ /*1*/
("The Piper at the Gates of Dawn",1967), /*Psychedelic rock*/ /*2*/
("The Doors",1967), /*Psychedelic rock*/ /*3*/
("Electric Ladyland",1968), /*Psychedelic rock*/ /*4*/
("Bucketheadland Pike 2-Empty Space",2011), /*Hard rock*/ /*5*/
("Led Zeppelin IV",1971), /*Hard rock*/ /*6*/
("Machine Head",1971), /*Hard rock*/ /*7*/
("Back in Black",1980), /*Hard rock*/ /*8*/
("Bucketheadland Pike 1-Its Alive",2011), /*Experimental rock*/ /*9*/
("White Light/White Head",1968), /*Experimental rock*/ /*10*/
("Low",1977), /*Experimental rock*/ /*11*/
("Kid A",2000), /*Experimental rock*/ /*12*/
("Pandemia",2010), /*Rap*/ /*13*/
("Bajo el Rayo que no Cesa",2015), /*Rap*/ /*14*/
("Exodo",2015), /*Rap*/ /*15*/
("Mejor que el silencio",2011), /*Rap*/ /*16*/
("Collapse",2013), /*Rap rock*/ /*17*/
("Rage Against the Machine",1992), /*Rap rock*/ /*18*/
("Grassroots",1994), /*Rap rock*/ /*19*/
("Skull & Bones",2000), /*Rap rock*/ /*20*/
("PHL to ZGZ - The EP",2012), /*Instrumental rap*/ /*21*/
("Donuts",2006), /*Instrumental rap*/ /*22*/
("Entroducing",1996), /*Instrumental rap*/ /*23*/
("Shades of Blue",2003), /*Instrumental rap*/ /*24*/
("Dead Silence",2012), /*Punk rock*/ /*25*/
("Fresh Fruit for Rotting Vegetables",1980), /*Punk rock*/ /*26*/
("London Calling",1979), /*Punk rock*/ /*27*/
("Operation Ivy",1989), /*Punk rock*/ /*28*/
("Nevermind",1991), /*Grunge*/ /*29*/
("Vs",1993), /*Grunge*/ /*30*/
("Above",1995), /*Grunge*/ /*31*/
("Live Through This",1994), /*Grunge*/ /*32*/
("Brass 1",2005), /*Nintendocore*/ /*33*/
("The Cat Album",2012), /*Nintendocore*/ /*34*/
("Taste my Power",2011), /*Nintendocore*/ /*35*/
("Out of Here",2011), /*Nintendocore*/ /*36*/
("Leave This Town",2009), /*37*/
("Astral Weeks",1968), /*Pop rock*/ /*38*/
("Blood on the Tracks",1975), /*Pop rock*/ /*39*/
("Alligator",2005), /*Pop rock*/ /*40*/
("Thriller",1982), /*Pop*/ /*41*/
("Abbey Road",1969), /*Pop*/ /*42*/
("Pet Sounds",1966), /*Pop*/ /*43*/
("Hounds of Love",1985), /*Pop*/ /*44*/
("Hijos de la Tierra",2014), /*Reggae*/ /*45*/
("Catch a Fire",1973), /*Reggae*/ /*46*/
("King Tubbys Meets Rockers Updown",1976), /*Reggae*/ /*47*/
("The Harder they Come",1972), /*Reggae*/ /*48*/
("Pa Que",2013), /*Ragga*/ /*49*/
("Wellcome to Jamrock",2005), /*Ragga*/ /*50*/
("Vabang",2005), /*Ragga*/ /*51*/
("London Zoo",2008), /*Ragga*/ /*52*/
("Reccess",2014),/*Dubstep*/ /*53*/
("Untrue",2007), /*Dubstep*/ /*54*/
("Three EPs", 2009), /*Dubstep*/ /*55*/
("Anidea", 2010), /*Dubstep*/ /*56*/
("The Nights/Days",2014), /*House*/ /*57*/
("Movements",2006), /*House*/ /*58*/
("House of Woo",2013), /*House*/ /*59*/
("Fabriclive 67", 2013), /*House*/ /*60*/
("Random Access Memories",2014), /*Disco*/ /*61*/
("No. 1 in Heaven",1979), /*Disco*/ /*62*/
("C'est Chic",1978), /*Disco*/ /*63*/
("From Here To Eternity",1977), /*Disco*/ /*64*/
("Spirited Away",2001), /*Orchestrall*/ /*65*/
("Healing Piano",2013), /*Orchestrall*/ /*66*/
("Piano and Chello Duet",2006), /*Orchestrall*/ /*67*/
("Phantasmagoria",1994), /*Orchestrall*/ /*68*/
("Carmen",1875), /*Opera*/ /*69*/
("Don Giovani",1787), /*Opera*/ /*70*/
("La Traviata",1853), /*Opera*/ /*71*/
("Tristan and Isolde",1858), /*Opera*/ /*72*/
("Sunbather",2013), /*Black metal*/ /*73*/
("Fucking Your Creation",2007), /*Black metal*/ /*74*/
("Haeretichristus",2008), /*Black metal*/ /*75*/
("Heilig Vuur",2004), /*Black metal*/ /*76*/
("All Hope is Gone",1999), /*Death metal*/ /*77*/
("Altars of Madness",1989), /*Death metal*/ /*78*/
("None so Vile",1966), /*Death metal*/ /*79*/
("Left Hand Path",1990), /*Death metal*/ /*80*/
("Paranoid",1970), /*Heavy Metal*/ /*81*/
("Jailbreak",1976), /*Heavy Metal*/ /*82*/
("Reign In Blood",1986), /*Heavy Metal*/ /*83*/
("Ace of Spades",1980); /*Heavy Metal*/ /*84*/







/*Exodo*/ /*15*/
/*Mejor que el silencio*/ /*16*/
/*Collapse",2013), /*Rap rock*/ /*17*/
/*Rage Against the Machine*/ /*18*/
/*Grassroots*/ /*19*/
/*Skull & Bones*/ /*20*/
/*PHL to ZGZ - The EP*/ /*21*/
/*Donuts*/ /*22*/
/*Entroducing*/ /*23*/
/*Shades of Blue*/ /*24*/
/*Dead Silence*/ /*25*/
/*Fresh Fruit for Rotting Vegetables*/ /*26*/
/*London Calling*/ /*27*/
/*Operation Ivy*/ /*28*/
/*Nevermind*/ /*29*/
/*Vs*/ /*30*/
/*Above*/ /*31*/
/*Live Through This*/ /*32*/
/*Brass 1*/ /*33*/
/*The Cat Album*/ /*34*/
/*Taste my Power*/ /*35*/
/*Out of Here*/ /*36*/
/*Leave This Town*/ /*37*/
/*Astral Weeks*/ /*38*/
/*Blood on the Tracks*/ /*39*/
/*Alligator*/ /*40*/
/*Thriller*/ /*41*/
/*Abbey Road*/ /*42*/
/*Pet Sounds*/ /*43*/
/*Hounds of Love*/ /*44*/
/*Hijos de la Tierra*/ /*45*/
/*Catch a Fire*/ /*46*/
/*King Tubbys Meets Rockers Updown*/ /*47*/
/*The Harder they Come*/ /*48*/
/*Pa Que*/ /*49*/
/*Wellcome to Jamrock*/ /*50*/
/*Vabang*/ /*51*/
/*London Zoo*/ /*52*/
/*Reccess*/ /*53*/
/*Untrue*/ /*54*/
/*Three EPs*/ /*55*/
/*Anidea*/ /*56*/
/*The Nights/Days*/ /*57*/
/*Movements*/ /*58*/
/*House of Woo*/ /*59*/
/*Fabriclive 67*/ /*60*/
/*Random Access Memories*/ /*61*/
/*No. 1 in Heaven*/ /*62*/
/*C'est Chic*/ /*63*/
/*From Here To Eternity*/ /*64*/
/*Spirited Away*/ /*65*/
/*Healing Piano*/ /*66*/
/*Piano and Chello Duet*/ /*67*/
/*Phantasmagoria*/ /*68*/
/*Carmen*/ /*69*/
/*Don Giovani*/ /*70*/
/*La Traviata*/ /*71*/
/*Tristan and Isolde*/ /*72*/
/*Sunbather*/ /*73*/
/*Fucking Your Creation*/ /*74*/
/*Haeretichristus*/ /*75*/
/*Heilig Vuur*/ /*76*/
/*All Hope is Gone*/ /*77*/
/*Altars of Madness*/ /*78*/
/*None so Vile*/ /*79*/
/*Left Hand Path*/ /*80*/
/*Paranoid*/ /*81*/
/*Jailbreak*/ /*82*/
/*Reign In Blood*/ /*83*/
/*Ace of Spades*/ /*84*/






/*songs*/

/*Bucketheadland Pike 27-Halls of Dimension id=1 song 1-8*/ /*1*/

insert into songs(name) values
("McDougal Street"),
("Halls of Dimension Part One - Hall 1"),
("Hall 2"),
("Hall 3"),
("Hall 4"),
("Hall 5"),
("Part Two- Falling Through the Vacuum"),
("Suns Set");

insert into albums_songs values
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7),
(1,8);

/*The Piper at the Gates of Dawn*/ /*2*/

insert into songs(name) values
  ("Astronomy Domine");

insert into albums_songs values
(2,9);

/*The Doors*/ /*3*/

insert into songs(name) values
  ("Break on Through");

insert into albums_songs values
  (3,10);

/*Electric Ladyland*/ /*4*/

insert into songs(name) values
  ("Little Miss Strange");

insert into albums_songs values
  (4,11);

/*Bucketheadland Pike 2-Empty Space id=2 song 9-18*/ /*5*/

insert into songs(name) values
("Comb and Wattles"),
("Wormers"),
("Empty Space"),
("Dummy Egg"),
("Pullets"),
("Perched"),
("Hatched"),
("Portable Pen"),
("Leghorn"),
("Scrape the Dirt Off");

insert into albums_songs values
(5,12),
(5,13),
(5,14),
(5,15),
(5,16),
(5,17),
(5,18),
(5,19),
(5,20),
(5,21);

/*Led Zeppelin IV*/ /*6*/

insert into songs(name) values
  ("Black Dog");

insert into albums_songs values
  (6,22);

/*Machine Head*/ /*7*/

insert into songs(name) values
  ("Highway Star");

insert into albums_songs values
  (7,23);

/*Back in Black*/ /*8*/

insert into songs(name) values
  ("Back in Black");

insert into albums_songs values
  (8,24);

/*Bucketheadland Pike 1-Its Alive id=3 song 19-26*/ /*9*/

insert into songs(name) values
("Lebrontron"),
("Tonka"),
("Peeling Out"),
("Banyard Banties"),
("Crack the Sky"),
("The Hatch"),
("Brooding Peeps"),
("Picking the Feathers");

insert into albums_songs values
(9,25),
(9,26),
(9,27),
(9,28),
(9,29),
(9,30),
(9,31),
(9,32);

/*White Light/White Head*/ /*10*/

insert into songs(name) values
  ("White Light/White Heat");

insert into albums_songs values
  (10,33);

/*Low*/ /*11*/

insert into songs(name) values
  ("Speed of Life");

insert into albums_songs values
  (11,34);

/*Kid A*/ /*12*/

insert into songs(name) values
  ("Kid A");

insert into albums_songs values
  (12,35);

/*Pandemia id=4 songs songs 27-44*/ /*13*/

insert into songs(name) values
("Intrologia"),
("Hip Hop Kresia"),
("Dando y Perdiendo"),
("Click Click"),
("Dueña de mis..."),
("Boss"),
("Te Quiero"),
("Arkitekto"),
("Cuando Iras?"),
("Siempre"),
("Please Officer"),
("Tarareo"),
("Infanzia"),
("Nube Inerte"),
("Naci para..."),
("Soledad"),
("Player Hater"),
("Sangre");

insert into albums_songs values
(13,36),
(13,37),
(13,38),
(13,39),
(13,40),
(13,41),
(13,42),
(13,43),
(13,44),
(13,45),
(13,46),
(13,47),
(13,48),
(13,49),
(13,50),
(13,51),
(13,52),
(13,53);

/*Bajo el Rayo que no Cesa*/ /*14*/

insert into songs(name) values
  ("La Petite Mort");

insert into albums_songs values
  (14,54);

/*Exodo*/ /*15*/

insert into songs(name) values
  ("Exodo");

insert into albums_songs values
  (15,55);

/*Mejor que el silencio*/ /*16*/

insert into songs(name) values
  ("Hambre de Victoria");

insert into albums_songs values
  (16,56);

/*Collapse-Dangerkids id=5 songs 45-56*/ /*17*/

insert into songs(name) values
("Countdown"),
("Light Escapes"),
("Hostage"),
("We're All in Danger"),
("Waking Up"),
("Destroy Yourself"),
("Unmade"),
("Where the Sky Breaks"),
("Paper Thin"),
("Fractions"),
("Dust"),
("Cut Me Out");

insert into albums_songs values
(17,57),
(17,58),
(17,59),
(17,60),
(17,61),
(17,62),
(17,63),
(17,64),
(17,65),
(17,66),
(17,67),
(17,68);


/*Rage Against the Machine*/ /*18*/

insert into songs(name) values
  ("Bombtrack");

insert into albums_songs values
  (18,69);

/*Grassroots*/ /*19*/

insert into songs(name) values
  ("Homebrew");

insert into albums_songs values
  (19,70);

/*Skull & Bones*/ /*20*/

insert into songs(name) values
  ("Another Victory");

insert into albums_songs values
  (20,71);

/*PHL to ZGZ - The EP id=6 songs 57-61*/ /*21*/

insert into songs(name) values
("Intro"),
("Stuntin on da Wax"),
("Shawty got the Flow"),
("Mr Kev Turner"),
("Ghetto Gospel");

insert into albums_songs values
(21,72),
(21,73),
(21,74),
(21,75),
(21,76);

/*Donuts*/ /*22*/

insert into songs(name) values
  ("Donuts");

insert into albums_songs values
  (22,77);

/*Entroducing*/ /*23*/

insert into songs(name) values
  ("Best Foot Forward");

insert into albums_songs values
  (23,78);

/*Shades of Blue*/ /*24*/

insert into songs(name) values
  ("Slims Return");

insert into albums_songs values
  (24,79);

/*Dead Silence id=7 songs 62-75*/ /*25*/

insert into songs(name) values
("Lonely Road to Absolution"),
("Viking Death March"),
("Surprise Surpirse"),
("Running Across the Tracks"),
("Love Was Still Around"),
("Stand Up and Run"),
("Crooked Minds"),
("Man Alive"),
("Hanging by a Thread"),
("Cure for the Enemy"),
("Dont Count on the Wicked"),
("Show Me the Way"),
("Swallowed Up by the Ocean"),
("Dead Silence");

insert into albums_songs values
(25,80),
(25,81),
(25,82),
(25,83),
(25,84),
(25,85),
(25,86),
(25,87),
(25,88),
(25,89),
(25,90),
(25,91),
(25,92),
(25,93);

/*Fresh Fruit for Rotting Vegetables*/ /*26*/

insert into songs(name) values
  ("Kill the Poor");

insert into albums_songs values
  (26,94);

/*London Calling*/ /*27*/

insert into songs(name) values
  ("London Calling");

insert into albums_songs values
  (27,95);

/*Operation Ivy*/ /*28*/

insert into songs(name) values
  ("Knowledge");

insert into albums_songs values
  (28,96);

/*Nevermind id=8 songs 76-88*/ /*29*/

insert into songs(name) values
("Smells Like Teen Spirit"),
("In Bloom"),
("Come as You Are"),
("Breed"),
("Lithium"),
("Polly"),
("Torritorial Pissings"),
("Drain You"),
("Lounge Act"),
("Stay Away"),
("On a Plain"),
("Something in the Way"),
("Endless, Nameless");

insert into albums_songs values
(29,97),
(29,98),
(29,99),
(29,100),
(29,101),
(29,102),
(29,103),
(29,104),
(29,105),
(29,106),
(29,107),
(29,108),
(29,109);

/*Vs*/ /*30*/

insert into songs(name) values
  ("Go");

insert into albums_songs values
  (30,110);

/*Above*/ /*31*/

insert into songs(name) values
  ("Lifeless Dead");

insert into albums_songs values
  (31,111);

/*Live Through This*/ /*32*/

insert into songs(name) values
  ("Violet");

insert into albums_songs values
  (32,112);

/*Brass 1 id=9 songs 89-98*/ /*33*/

insert into songs(name) values
("Castlevania"),
("Ninja Gaiden"),
("Double Dragon"),
("Super Mario Brothers 2"),
("Ikari Warriors"),
("Blaster Master/Contra"),
("Mike Tysons Punchout"),
("Kid Ikarus"),
("Mega Man 2"),
("Metroid");

insert into albums_songs values
(33,113),
(33,114),
(33,115),
(33,116),
(33,117),
(33,118),
(33,119),
(33,120),
(33,121),
(33,122);

/*The Cat Album*/ /*34*/

insert into songs(name) values
  ("Aquatic");

insert into albums_songs values
  (34,123);

/*Taste my Power*/ /*35*/

insert into songs(name) values
  ("Metroidminator");

insert into albums_songs values
  (35,124);

/*Out of Here*/ /*36*/

insert into songs(name) values
  ("This Makes you so Fast Nobody After");

insert into albums_songs values
  (36,125);

/*Leave this town-daughtry id=10 songs 99-*/ /*37*/

insert into songs(name) values
("You Dont Belong"),
("No Surprise"),
("Every Time You Turn Around"),
("Life After You"),
("What I Meant to Say"),
("Open Up Your Eyes"),
("September"),
("Ghost of Me"),
("Learn My Lesson"),
("Supernatural"),
("Tennesse Line"),
("Call Your Name");

insert into albums_songs values
(37,126),
(37,127),
(37,128),
(37,129),
(37,130),
(37,131),
(37,132),
(37,133),
(37,134),
(37,135),
(37,136),
(37,137);

/*Astral Weeks*/ /*38*/

insert into songs(name) values
  ("Astral Weeks");

insert into albums_songs values
  (38,138);

/*Blood on the Tracks*/ /*39*/

insert into songs(name) values
  ("<tangled up in Blue");

insert into albums_songs values
  (39,139);

/*Alligator*/ /*40*/

insert into songs(name) values
  ("Secreet Meeting");

insert into albums_songs values
  (40,140);

/*Thriller-Michael Jackson id=11 songs 111-119*/ /*41*/

insert into songs(name) values
("Wanna Be Starting Something"),
("Baby Be Mine"),
("The Girl Is Mine"),
("Thriller"),
("Beat It"),
("Billie Jean"),
("Human Nature"),
("P.Y.T. (Pretty Young Thing)"),
("The Lady in My Life");

insert into albums_songs values
(41,141),
(41,142),
(41,143),
(41,144),
(41,145),
(41,146),
(41,147),
(41,148),
(41,149);

/*Abbey Road*/ /*42*/

insert into songs(name) values
  ("Come Together");

insert into albums_songs values
  (42,150);

/*Pet Sounds*/ /*43*/

insert into songs(name) values
  ("Wouldnt it be Nice");

insert into albums_songs values
  (43,151);

/*Hounds of Love*/ /*44*/

insert into songs(name) values
  ("Running up That Hill");

insert into albums_songs values
  (44,152);

/*Hijos de la tierra-green valley id=12 songs 120-133*/ /*45*/

insert into songs(name) values
("Love Love"),
("Corren Tiempos Dificiles"),
("Eso te Hace Mal"),
("Las Estrellas del Cielo"),
("El Mensaje de la Luz"),
("No Vengas al Barrio"),
("Hijos de la Tierra"),
("Si No te Tengo"),
("Una Bala Un Disparo"),
("Bailando al Son del Mar"),
("Cuentame"),
("Mi Tesoro"),
("Furia"),
("Una Noche Mas");

insert into albums_songs values
(45,153),
(45,154),
(45,155),
(45,156),
(45,157),
(45,158),
(45,159),
(45,160),
(45,161),
(45,162),
(45,163),
(45,164),
(45,165),
(45,166);

/*Catch a Fire*/ /*46*/

insert into songs(name) values
  ("Concrete Jungle");

insert into albums_songs values
  (46,167);

/*King Tubbys Meets Rockers Updown*/ /*47*/

insert into songs(name) values
  ("Keep on Dubbing");

insert into albums_songs values
  (47,168);

/*The Harder they Come*/ /*48*/

insert into songs(name) values
  ("Draw your Brakes");

insert into albums_songs values
  (48,169);


/*Pa Que-Nikone id=13 songs 134-142*/ /*49*/

insert into songs(name) values
("Intro de Jahas"),
("Boom Boom Clap"),
("Pa Que"),
("Pa tus Oidos Campeon"),
("Vuelves"),
("Rollito de Primavera"),
("Biribibahebahe"),
("Puntos Suspensivos"),
("Hey Wey");

insert into albums_songs values
(49,170),
(49,171),
(49,172),
(49,173),
(49,174),
(49,175),
(49,176),
(49,177),
(49,178);

/*Wellcome to Jamrock*/ /*50*/

insert into songs(name) values
  ("Confrontation");

insert into albums_songs values
  (50,179);

/*Vabang*/ /*51*/

insert into songs(name) values
  ("Bless");

insert into albums_songs values
  (51,180);

/*London Zoo*/ /*52*/

insert into songs(name) values
  ("Angry");

insert into albums_songs values
  (52,181);

/*Reccess-Skrillex id=14 songs 143-153*/ /*53*/

insert into songs(name) values
("All is Fair Love and Brostep"),
("Reccess"),
("Stranger"),
("Try it Out"),
("Coast is Clear"),
("Dirty Vibe"),
("Ragga Bomb"),
("Doompy Poomp"),
("Fuck That"),
("Ease My Mind"),
("Fire Away");

insert into albums_songs values
(53,182),
(53,183),
(53,184),
(53,185),
(53,186),
(53,187),
(53,188),
(53,189),
(53,190),
(53,191),
(53,192);

/*Untrue*/ /*54*/

insert into songs(name) values
("Archangel");

insert into albums_songs values
(54,193);

/*Three EPs*/ /*55*/

insert into songs(name) values
("Dry the Rain");

insert into albums_songs values
(55,194);

/*Anidea*/ /*56*/

insert into songs(name) values
("Anidea");

insert into albums_songs values
(56,195);

/*The Nights/Days-Avicii id=15 songs 154-155*/ /*57*/

insert into songs(name) values
("The Days"),
("The Nights");

insert into albums_songs values
(57,196),
(57,197);

/*Movements*/ /*58*/

insert into songs(name) values
("Night Falls");

insert into albums_songs values
(58,198);

/*House of Woo*/ /*59*/

insert into songs(name) values
("Slave to the Vibe");

insert into albums_songs values
(59,199);

/*Fabriclive 67*/ /*60*/

insert into songs(name) values
("Before");

insert into albums_songs values
(60,200);

/*Random Access Memories id=16 songs 156-167*/ /*61*/

insert into songs(name) values
("Give Live Back To Music"),
("The Game of Love"),
("Giorgio by Moroder"),
("Within"),
("Instant Crush"),
("Lose Yourself to Dance"),
("Touch"),
("Get Lucky"),
("Beyond"),
("Motherboard"),
("Fragments of Time"),
("Doing it Right"),
("Contact");

insert into albums_songs values
(61,201),
(61,202),
(61,203),
(61,204),
(61,205),
(61,206),
(61,207),
(61,208),
(61,209),
(61,210),
(61,211),
(61,212),
(61,213);

/*No. 1 in Heaven*/ /*62*/

insert into songs(name) values
("La Dolce Vita");

insert into albums_songs values
(62,214);

/*C'est Chic*/ /*63*/

insert into songs(name) values
("Chic Cheer");

insert into albums_songs values
(63,215);

/*From Here To Eternity*/ /*64*/

insert into songs(name) values
("From Here to Eternity");

insert into albums_songs values
(64,216);

/*Spirited Away id=17 songs 168-188*/ /*65*/

insert into songs(name) values
("One Summers Day"),
("A Road to Somewhere"),
("The Empty Restaurant"),
("Nighttime COming"),
("The Dragon Boy"),
("Sootballs"),
("Procession of the Gods"),
("Yubaba"),
("Bathhouse Morning"),
("Day of the River"),
("Its Hard Work"),
("The Stink God"),
("Sens Courage"),
("The Bottomless Pit"),
("Kaonashi"),
("The Sixth Station"),
("Yubabas Panic"),
("The House at Swamp Bottom"),
("Reprise"),
("The Return"),
("Always With Me");

insert into albums_songs values
(65,217),
(65,218),
(65,219),
(65,220),
(65,221),
(65,222),
(65,223),
(65,224),
(65,225),
(65,226),
(65,227),
(65,228),
(65,229),
(65,230),
(65,231),
(65,232),
(65,233),
(65,234),
(65,235),
(65,236),
(65,237);

/*Healing Piano*/ /*66*/

insert into songs(name) values
("Kiss the Rain");

insert into albums_songs values
(66,238);

/*Piano and Chello Duet*/ /*67*/

insert into songs(name) values
("Spring Waltz");

insert into albums_songs values
(67,239);

/*Phantasmagoria*/ /*68*/

insert into songs(name) values
("Rainy day. Children");

insert into albums_songs values
(68,240);

/*Carmen*/ /*69*/

insert into songs(name) values
("Prelude");

insert into albums_songs values
(69,241);

/*Don Giovani*/ /*70*/

insert into songs(name) values
("Overture. Andante");

insert into albums_songs values
(70,242);

/*La Traviata*/ /*71*/

insert into songs(name) values
("Un di Felice,eterea");

insert into albums_songs values
(71,243);

/*Tristan and Isolde*/ /*72*/

insert into songs(name) values
("Young Tristan");

insert into albums_songs values
(72,244);

/*Sunbather id=19 songw 196-202*/ /*73*/

insert into songs(name) values
("Dream House"),
("Irresistible"),
("Sunbather"),
("Please Remember"),
("Vertigo"),
("Windows"),
("The Pecan Tree");

insert into albums_songs values
(73,245),
(73,246),
(73,247),
(73,248),
(73,249),
(73,250),
(73,251);

/*Fucking Your Creation*/ /*74*/

insert into songs(name) values
("Die in Pain");

insert into albums_songs values
(74,252);

/*Haeretichristus*/ /*75*/

insert into songs(name) values
("Lucifers Betrayal");

insert into albums_songs values
(75,253);

/*Heilig Vuur*/ /*76*/

insert into songs(name) values
("Bloed Voor Wodan");

insert into albums_songs values
(76,254);

/*All Hope Is Gone-slipknot id=20 songs 203-214*/ /*77*/

insert into songs(name) values
(".execute."),
("Gematria(The Killing Name)"),
("Sulfur"),
("Psychosocial"),
("Dead Memories"),
("Vendetta"),
("Butchers Hook"),
("Gehenna"),
("This Cold Black"),
("Wherein Lies Continue"),
("Snuff"),
("All Hope Is Gone");

insert into albums_songs values
(77,255),
(77,256),
(77,257),
(77,258),
(77,259),
(77,260),
(77,261),
(77,262),
(77,263),
(77,264),
(77,265),
(77,266);

/*Altars of Madness*/ /*78*/

insert into songs(name) values
("Inmortal Rites");

insert into albums_songs values
(78,267);

/*None so Vile*/ /*79*/

insert into songs(name) values
("Crown of Horns");

insert into albums_songs values
(79,268);

/*Left Hand Path*/ /*80*/

insert into songs(name) values
("Left Hand Path");

insert into albums_songs values
(80,269);

/*Paranoid id=21 songs 215-222*/ /*81*/

insert into songs(name) values
("War Pigs"),
("Paranoid"),
("Planet Caravan"),
("Iron Man"),
("Electric Funeral"),
("Hand of Doom"),
("Rat Salad"),
("Fairies Wear Boots");

insert into albums_songs values
(81,270),
(81,271),
(81,272),
(81,273),
(81,274),
(81,275),
(81,276),
(81,277);

/*Jailbreak*/ /*82*/

insert into songs(name) values
("Jailbreak");

insert into albums_songs values
(82,278);

/*Reign In Blood*/ /*83*/

insert into songs(name) values
("Angel of Death");

insert into albums_songs values
(83,279);

/*Ace of Spades*/ /*84*/

insert into songs(name) values
("Ace of Spades");

insert into albums_songs values
(84,280);

/*albums_artists*/

insert into albums_artists values
  (1,1),
  (2,2),
  (3,3),
  (4,4),
  (5,1),
  (6,5),
  (7,6),
  (8,7),
  (9,1),
  (10,8),
  (11,9),
  (12,10),
  (13,11),
  (14,12),
  (15,13),
  (16,14),
  (17,15),
  (18,16),
  (19,17),
  (20,18),
  (21,19),
  (22,20),
  (23,21),
  (24,22),
  (25,23),
  (26,24),
  (27,25),
  (28,26),
  (29,27),
  (30,28),
  (31,29),
  (32,30),
  (33,31),
  (34,32),
  (35,33),
  (36,34),
  (37,35),
  (38,36),
  (39,37),
  (40,38),
  (41,39),
  (42,40),
  (43,41),
  (44,42),
  (45,43),
  (46,44),
  (47,45),
  (48,46),
  (49,47),
  (50,48),
  (51,49),
  (52,50),
  (53,51),
  (54,52),
  (55,53),
  (56,54),
  (57,55),
  (58,56),
  (59,57),
  (60,58),
  (61,59),
  (62,60),
  (63,61),
  (64,62),
  (65,63),
  (66,64),
  (67,65),
  (68,66),
  (69,67),
  (70,68),
  (71,69),
  (72,70),
  (73,71),
  (74,72),
  (75,73),
  (76,74),
  (77,75),
  (78,76),
  (79,77),
  (80,78),
  (81,79),
  (82,80),
  (83,81),
  (84,82);

  /*genres_subgenres*/


    
   insert into genres_subgenres values
      (1,1),
      (1,2),
      (1,3),
      (2,4),
      (2,5),
      (2,6),
      (2,7),
      (3,8),
      (3,9),
      (4,10),
      (4,11),
      (5,12),
      (5,13),
      (6,14),
      (6,15),
      (6,16),
      (7,17),
      (7,18),
      (8,19),
      (8,20),
      (8,21);

    /*genres_artists*/

    insert into genres_artists values
      (1,1),
      (1,2),
      (1,3),
      (1,4),
      (1,5),
      (1,6),
      (1,7),
      (1,8),
      (1,9),
      (1,10),
      (2,11),
      (2,12),
      (2,13),
      (2,14),
      (2,15),
      (2,16),
      (2,17),
      (2,18),
      (2,19),
      (2,20),
      (2,21),
      (2,22),
      (3,23),
      (3,24),
      (3,25),
      (3,26),
      (3,27),
      (3,28),
      (3,29),
      (3,30),
      (3,31),
      (3,32),
      (3,33),
      (3,34),
      (4,35),
      (4,36),
      (4,37),
      (4,38),
      (4,39),
      (4,40),
      (4,41),
      (4,42),
      (5,43),
      (5,44),
      (5,45),
      (5,46),
      (5,47),
      (5,48),
      (5,49),
      (5,50),
      (6,51),
      (6,52),
      (6,53),
      (6,54),
      (6,55),
      (6,56),
      (6,57),
      (6,58),
      (6,59),
      (6,60),
      (6,61),
      (6,62),
      (7,63),
      (7,64),
      (7,65),
      (7,66),
      (7,67),
      (7,68),
      (7,69),
      (7,70),
      (8,71),
      (8,72),
      (8,73),
      (8,74),
      (8,75),
      (8,76),
      (8,77),
      (8,78),
      (8,79),
      (8,80),
      (8,81),
      (8,82);



    insert into subgenres_albums values
      (1,1),
      (1,2),
      (1,3),
      (1,4),
      (2,5),
      (2,6),
      (2,7),
      (2,8),
      (3,9),
      (3,10),
      (3,11),
      (3,12),
      (4,13),
      (4,14),
      (4,15),
      (4,16),
      (5,17),
      (5,18),
      (5,19),
      (5,20),
      (6,21),
      (6,22),
      (6,23),
      (6,24),
      (7,25),
      (7,26),
      (7,27),
      (7,28),
      (8,29),
      (8,30),
      (8,31),
      (8,32),
      (9,33),
      (9,34),
      (9,35),
      (9,36),
      (10,37),
      (10,38),
      (10,39),
      (10,40),
      (11,41),
      (11,42),
      (11,43),
      (11,44),
      (12,45),
      (12,46),
      (12,47),
      (12,48),
      (13,49),
      (13,50),
      (13,51),
      (13,52),
      (14,53),
      (14,54),
      (14,55),
      (14,56),
      (15,57),
      (15,58),
      (15,59),
      (15,60),
      (16,61),
      (16,62),
      (16,63),
      (16,64),
      (17,65),
      (17,66),
      (17,67),
      (17,68),
      (18,69),
      (18,70),
      (18,71),
      (18,72),
      (19,73),
      (19,74),
      (19,75),
      (19,76),
      (20,77),
      (20,78),
      (20,79),
      (20,80),
      (21,81),
      (21,82),
      (21,83),
      (21,84);
      

