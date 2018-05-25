use abstract;

/*genres*/

insert into genres(name) values
("Rock"),           #1
("Pop"),            #2
("Hip-Hop"),        #3
("Instrumental"),   #4
("Electronic"),     #5
("Jazz"),           #6
("Metal"),          #7 
("Indie"),          #8
("Punk"),           #9
("Blues");          #10


/*subgenres*/

insert into subgenres(name) values
("Classical Rock"),     #1
("Alternative Rock"),   #2
("Experimental Rock"),  #3
("Instrumental Rock"),  #4
("Pop"),                #5
("Electric Pop"),       #6
("Pop Rock"),           #7
("Rap"),                #8
("Soul Rap"),           #9
("Instrumental Rap"),   #10           
("Classical"),          #11
("Orchestral"),         #12
("Dance"),              #13
("House"),              #14
("Swing"),              #15
("Smooth"),             #16
("Jazzfunk"),           #17
("Powermetal"),         #18
("Heavy Metal"),        #19
("Metalcore"),          #20
("Indie Rock"),         #21
("Indie Pop"),          #22
("Punk"),               #23
("Punk Rock"),          #24
("Grunge"),             #25
("Blues"),              #26
("Blues Rock");         #27


/*artists*/

insert into artists(name, description) values
("The Wavers", "http://www.thewavers.com"),                                         #Rock(1), Classical Rock(1) - 1
("Keith Heimericks", "https://www.blackhillsaudiovideo.com"),                       #Rock(1), Classical Rock(1) - 2
("Forget The Whale", " https://soundcloud.com/forget-the-whale"),                   #Rock(1), Alternative Rock(2) - 3
("Kalerie","https://kalerie.bandcamp.com"),                                         #Rock(1), Alternative Rock(2) - 4
("Yvalain", "http://fandalism.com/yvalain1"),                                       #Rock(1), Experimental Rock(3) - 5
("PeerGynt Lobogris", "http://lobogrispeergynt.blogspot.com"),                      #Rock(1), Experimental Rock(3) - 6
("Sergey Sopko", "http://www.pond5.com/ru/artist/djsapa"),                          #Rock(1), Instrumental Rock(4) - 7
("Serge Ozeryan", " https://sergeozeryan.bandcamp.com"),                            #Rock(1), Intrumental Rock(4) - 8
("Icarus Crash", "http://www.icaruscrash.net"),                                     #Pop(2), Pop(5) - 9
("Martinez", "https://www.facebook.com/martinezoddity"),                            #Pop(2), Pop(5) - 10
("Jekk", " http://www.jekkmusic.com"),                                              #Pop(2), Electric Pop(6) - 11
("Shocky", "http://soo.su"),                                                        #Pop(2), Electric Pop(6) - 12
("Techtonical Illuminations", "https://vk.com/techtonation"),                       #Pop(2), Pop Rock(7) - 13
("Mistery", " http://mrc.project.free.fr"),                                         #Pop(2), Pop Rock(7) - 14
("El J", " http://www.dopefiends.co.uk"),                                           #Hip-Hop(3), Rap(8) - 15
("Idayam", " http://idayam.lesite.free.fr"),                                        #Hip-Hop(3), Rap(8) - 16
("Mickey Blue", " http://mickeyblueofficial.com"),                                  #Hip-Hop(3), Soul Rap(9) - 17
("Plex", "http://Youtube.com/Rockaway77"),                                          #Hip-Hop(3), Soul Rap(9) - 18
("Depressive Motive", " https://vk.com/depressive_motive"),                         #Hip-Hop(3), Instrumental Rap(10) - 19
("Marcellus Marshall", "No Official Page Available"),                               #Hip-Hop(3), Instrumental Rap(10) - 20
("Marcel Pequel", "No Official Page Available"),                                    #Instrumental(4), Classical(11) - 21
("Borrtex", "https://itunes.apple.com/us/artist/borrtex/id1215842951"),             #Instrumental(4), Classical(11) - 22
("RenoB.", "    http://www.marievamusic.com"),                                      #Instrumental(4), Classical(11) - 23
("Pablo Samonta", "http://www.pablosamonta.com"),                                   #Instrumental(4), Orchestral(12) - 24
("Epic Senses", " http://epicsenses.bandcamp.com"),                                 #Instrumental(4), Orchestral(12) - 25
("SinGLe MatE", "https://twitter.com/single_mate_96"),                              #Instrumental(4), Orchestral(12) - 26
("Lunablind", " https://www.facebook.com/lunablindofficial"),                       #Electronic(5), Dance(13) - 27
("Toni Almighty", "http://www.tonyalmighty.com"),                                   #Electronic(5), Dance(13) - 28
("Spacewolf Project", "No Official Page Available"),                                #Electronic(5), Dance(13) - 29
("Alexiaction", "https://soundcloud.com/alexi-zaikov"),                             #Electronic(5), House(14) - 30
("Gera Zim Zum", "https://www.facebook.com/DJGeraZimZum"),                          #Electronic(5), House(14) - 31
("Dazie Mae", "http://www.daziemae.com"),                                           #Jazz(6), Swing(15) - 32
("Gustavo Crochenci", "https://www.facebook.com/tavocrochenci"),                    #Jazz(6), Swing(15) - 33
("Guy Berrier", "https://www.facebook.com/guy.berrier.9"),                          #Jazz(6), Smooth(16) - 34
("Antonio Diez", " https://antoniodiez.bandcamp.com"),                              #Jazz(6), Smooth(16) - 35
("Corporatemusic", "No Official Page Available"),                                   #Jazz(6), Jazzfunk(17) - 37
("The Rinn", "https://therinn.ru"),                                                 #Metal(7), Powermetal(18) - 38
("UnderBlow", "No Official Page Available"),                                        #Metal(7), Powermetal(18) - 39
("Unicorn Rodeo", "http://www.unicornrodeo.de"),                                    #Metal(7), Heavy Metal(19) - 40
("Scream Inc.", "http://www.screaminc.net"),                                        #Metal(7), Heavy Metal(19) - 41
("Hide & Dream", " https://www.youtube.com/user/HideAndDream"),                     #Metal(7), Metalcore(20) - 42
("Got No Choice", " https://soundcloud.com/user-741859385"),                        #Metal(7), Metalcore(20) - 43
("Kinematic", " http://www.kinematic.info"),                                        #Indie(8), Indie Rock(21) - 44
("Heifervescent", "http://www.heifervescent.com"),                                  #Indie(8), Indie Rock(21) - 45
("Seastock", "http://seastockaudio.com"),                                           #Indie(8), Indie Rock(21) - 46
("Colaars", "http://colaars.com"),                                                  #Indie(8), Indie Pop(22) - 47
("Stasshurins", "http://www.stasshurins.info"),                                     #Indie(8), Indie Pop(22) - 48
("Audio Da Vinci And The High Streets", " https://www.patreon.com/audiodavinci"),   #Indie(8), Indie Pop(22) - 49
("Phil Harmonic", "http://fr-fr.facebook.com/pages/Phil-Harmonic/131438413558226"), #Punk(9), Punk(23) - 50
("Radio K Oso", "http://radiokoso.tk"),                                             #Punk(9), Punk(23) - 51
("Intento Fallido", "No Official Page Available"),                                  #Punk(9), Punk Rock(24) - 52
("Vollrauschbeatz", " https://vollrauschbeatz-musik.bandcamp.com/music"),           #Punk(9), Punk Rock(24) - 53
("The Bourgeois", " http://www.thebourgeoisband.com"),                              #Punk(9), Grunge(25) - 54
("Surlife", "https://www.facebook.com/surlifeband"),                                #Punk(9), Grunge(25) - 55
("Christian Petermann", " http://arsmysteria.jimdo.com"),                           #Blues(10), Blues(26) - 56
("Kathy Shortt And Yvalain", " https://fandalism.com/yvalain1"),                    #Blues(10), Blues(26) - 57
("Michael Ellis", "http://www.michaelellis.de"),                                    #Blues(10), Blues(26) - 58
("Normandia", "http://vk.com/normandia31"),                                         #Blues(10), Blues Rock(27) - 59
("Vinyl Blast", "http://facebook.com/vinylblast"),                                  #Blues(10), Blues Rock(27) - 60
("ccMixter", " http://ccmixter.org");                                               #Blues(10), Blues Rock(27) - 61


/*albums*/

insert into albums(name, year) values
("Calavera", 2017),                                           #Rock(1), Classical Rock(1) - 1
("Small Town USA", 2017),                                     #Rock(1), Classical Rock(1) - 2
("What I Tell Myself", 2017),                                 #Rock(1), Alternative Rock(2) - 3
("Jones", 2018),                                              #Rock(1), Alternative Rock(2) - 4
("To Infinity", 2018),                                        #Rock(1), Experimental Rock(3) - 5
("BlueMoon Rising", 2018),                                    #Rock(1), Experimental Rock(3) - 6
("Instrumental Rock", 2017),                                  #Rock(1), Instrumental Rock(4) - 7
("The Movie Screen", 2014),                                   #Rock(1), Instrumental Rock(4) - 8
("Atasco En Saturno", 2017),                                  #Pop(2), Pop(5) - 9
("So Far...", 2017),                                          #Pop(2), Pop(5) - 10
("Strong", 2018),                                             #Pop(2), Electric Pop(6) - 11
("Moaner", 2017),                                             #Pop(2), Electric Pop(6) - 12
("Time Of Happiness And Sadness", 2017),                      #Pop(2), Pop Rock(7) - 13
("Without You", 2012),                                        #Pop(2), Pop Rock(7) - 14
("The Consciousness", 2014),                                  #Hip-hop(3), Rap(8) - 15
("Black Anthology", 2016),                                    #Hip-hop(3), Rap(8) - 16
("What I Wouldn't Do", 2017),                                 #Hip-hop(3), Soul Rap(9) - 17
("Divergent", 2017),                                          #Hip-hop(3), Soul Rap(9) - 18
("Chakras", 2016),                                            #Hip-hop(3), Instrumental Rap(10) - 19
("The Wild Side Of...", 2017),                                #Hip-hop(3), Instrumental Rap(10) - 20
("The 12 Months", 2011),                                      #Instrumental(4), Classical(11) - 21
("Ability", 2017),                                            #Instrumental(4), Classical(11) - 22
("Les Neiges D'Orcival", 2014),                               #Instrumental(4), Classical(11) - 23
("Dark Fate Of Atlantis", 2017),                              #Instrumental(4), Orchestral(12) - 24
("The Golden Army", 2017),                                    #Instrumental(4), Orchestral(12) - 25
("Symphony Of Soul And Mind", 2018),                          #Instrumental(4), Orchestral(12) - 26
("Vision", 2017),                                             #Electronic(5), Dance(13) - 27
("What About", 2018),                                         #Electronic(5), Dance(13) - 28
("Return Of The Wolf", 2016),                                 #Electronic(5), Dance(13) - 29
("City Rythm", 2018),                                         #Electronic(5), House(14) - 30
("Rock It", 2017),                                            #Electronic(5), House(14) - 31
("Hot And Wet", 2018),                                        #Electronic(5), House(14) - 32
("Last Jazz In Paris", 2018),                                 #Jazz(6), Swing(15) - 33
("JazzBar", 2009),                                            #Jazz(6), Swing(15) - 34
("Around", 2018),                                             #Jazz(6), Smooth(16) - 35
("Sombras", 2014),                                            #Jazz(6), Smooth(16) - 36
("Marcellus Instrumentals", 2017),                            #Jazz(6), Jazzfunk(17) - 37
("Funk", 2018),                                               #Jazz(6), Jazzfunk(17) - 38
("Stories Of The Green Fairy", 2017),                         #Metal(7), Powermetal(18) - 39
("Corazon De Hielo", 2017),                                   #Metal(7), Powermetal(18) - 40
("Uniporn", 2017),                                            #Metal(7), Heavy Metal(19) - 41
("Inception", 2017),                                          #Metal(7), Heavy Metal(19) - 42
("The Arsonist", 2017),                                       #Metal(7), Metalcore(20) - 43
("Neon EP", 2018),                                            #Metal(7), Metalcore(20) - 44
("Kites", 2017),                                              #Indie(8), Indie Rock(21) - 45
("Evolution Gains Again", 2015),                              #Indie(8), Indie Rock(21) - 46
("Uplifting Innovation", 2017),                               #Indie(8), Indie Rock(21) - 47
("Underheart", 2017),                                         #Indie(8), Indie Pop(22) - 48
("Natural Selection", 2013),                                  #Indie(8), Indie Pop(22) - 49
("Theater Without Style", 2017),                              #Indie(8), Indie Pop(22) - 50
("So Horny", 2014),                                           #Punk(9), Punk(23) - 51
("110 FM", 2016),                                             #Punk(9), Punk(23) - 52    
("Invisible", 2008),                                          #Punk(9), Punk Rock(24) - 53
("Sturm Und Drang", 2018),                                    #Punk(9), Punk Rock(24) - 54
("From The Darkest Corners Of The Brightest Rooms", 2018),    #Punk(9), Grunge(25) - 55
("Ambivalent", 2017),                                         #Punk(9), Grunge(25) - 56
("Blues", 2017),                                              #Blues(10), Blues(26) - 57
("Just Turn The Light On!", 2017),                            #Blues(10), Blues(26) - 58
("The Complexity Of Things", 2014),                           #Blues(10), Blues(26) - 59
("Hogan Alley", 2018),                                        #Blues(10), Blues Rock(27) - 60
("Secret", 2018),                                             #Blues(10), Blues Rock(27) - 61
("Codex Tempore", 2018);                                      #Blues(10), Blues Rock(27) - 62

/*albums_artists*/

insert into albums_artists values
  (1,1),
  (2,2),
  (3,3),
  (4,4),
  (5,5),
  (6,6),
  (7,7),
  (8,8),
  (9,19),
  (10,10),
  (11,11),
  (12,12),
  (13,13),
  (14,14),
  (15,15),
  (16,16),
  (17,17),
  (18,18),
  (19,19),
  (20,20),
  (21,21),
  (22,22),
  (23,23),
  (24,24),
  (25,25),
  (26,26),
  (27,27),
  (28,28),
  (29,29),
  (30,30),
  (31,31),
  (32,28),
  (33,32),
  (34,33),
  (35,34),
  (36,35),
  (37,20),
  (38,36),
  (39,38),
  (40,39),
  (41,40),
  (42,41),
  (43,42),
  (44,43),
  (45,44),
  (46,45),
  (47,46),
  (48,47),
  (49,48),
  (50,49),
  (51,50),
  (52,51),
  (53,52),
  (54,52),
  (55,53),
  (56,54),
  (57,55),
  (58,56),
  (59,57),
  (60,58),
  (61,59),
  (62,60);

/*songs*/

#The Wavers - Calavera - 1 - 1, Songs 1-10

insert into songs(name) values
("Once Uppon A Time In Waverland"),     #1
("King Of San Felipe"),                 #2
("Surf Me Baby"),                       #3
("Ding O Stomp"),                       #4
("Just A Party"),                       #5
("Coconut"),                            #6
("Calavera"),                           #7
("Twist Of The Beast"),                 #8
("Vanilla Caos"),                       #9
("Leaving San Felipe");                 #10

insert into albums_songs values
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7),
(1,8),
(1,9),
(1,10);

#Keith Heimericks - Small Town USA - 2 - 2, Songs 11-14

insert into songs(name) values
("Small Town USA"),         #11
("Those Summer Days"),      #12
("Simple Man"),             #13
("Reflection");             #14

insert into albums_songs values
(2,11),
(2,12),
(2,13),
(2,14);

#Forget The Whale - What I Tell Myself - 3 - 3, Songs 15-23

insert into songs(name) values
("Suburban Owtlaw"),                #15
("I Know Where You've Been"),       #16
("10 Days"),                        #17
("Giants"),                         #18
("Hex"),                            #19
("Another Trick Up My Sleeve"),     #20
("The Little Robot"),               #21
("Sails"),                          #22
("Carry Your Own Weight");          #23

insert into albums_songs values
(3,15),
(3,16),
(3,17),
(3,18),
(3,19),
(3,20),
(3,21),
(3,22),
(3,23);

#Kalerie - Jones - 4 - 4, Songs 24-28

insert into songs(name) values
("Abstract Land"),  #24
("Town Of Birds"),  #25
("Harmony"),        #26
("Blind Doll"),     #27
("SMBIF");          #28

insert into albums_songs values
(4,24),
(4,25),
(4,26),
(4,27),
(4,28);

#Yvalain - To Infinity - 5 - 5, Songs 29-42

insert into songs(name) values
("To Misery"),                          #29
("A Gentle Knock"),                     #30
("Isabella"),                           #31
("The Quest"),                          #32
("Baroque Mood"),                       #33
("Give A Meaning To Everything"),       #34
("Arrival Of The Mad King"),            #35
("Child Of The Light Of Love"),         #36
("Village Festival"),                   #37
("Isabella In The Magical Forest"),     #38
("New Heaven"),                         #39
("Wooden Soldiers"),                    #40
("Walking In The Hills"),               #41
("Je Vous Suis");                       #42

insert into albums_songs values
(5,29),
(5,30),
(5,31),
(5,32),
(5,33),
(5,34),
(5,35),
(5,36),
(5,37),
(5,38),
(5,39),
(5,40),
(5,41),
(5,42);

#PeeGynt Lobogris - BlueMoon Rising - 6 - 6, Songs 43-50

insert into songs(name) values
("At The Bluemoon Shadows"),            #43
("Falling Down"),                       #44
("Run To Your Dreams"),                 #45
("Sea Of Stars"),                       #46
("Burn The Highway"),                   #47
("Flying On My Telescope"),             #48
("Legend Of The Fireflys Forest"),      #49
("About Yesterdays");                   #50

insert into albums_songs values
(6,43),
(6,44),
(6,45),
(6,46),
(6,48),
(6,49),
(6,50);

#Sergey Sopko - Instrumental Rock - 7 - 7, Songs 51-54

insert into songs(name) values
("Inspiration"),                        #51
("You Can"),                            #52
("Background Instrumental Rock"),       #53
("Intriguing Instrumental Rock");       #54

insert into albums_songs values
(7,51),
(7,52),
(7,53),
(7,54);

#Serge Ozeryan - The Movie Screen - 8 - 8, Songs 55-67

insert into songs(name) values
("Intro"),                          #55
("Formula X"),                      #56
("Excursion"),                      #57
("Tyrol"),                          #58
("The Movie Screen. Anxiety"),      #59
("The Movie Screen. Danger"),       #60
("The Movie Screen, Movement"),     #61
("The Movie Screen. Ramble"),       #62
("The Movie Screen. Tension"),      #63
("Extreme Strategy(30 Sec)"),       #64
("Fire Dance In The Moonlight"),    #65
("Tough Competition"),              #66
("Ukraine National Anthem");        #67

insert into albums_songs values
(8,55),
(8,56),
(8,57),
(8,58),
(8,59),
(8,60),
(8,61),
(8,62),
(8,63),
(8,64),
(8,65),
(8,66),
(8,67);

#Icarus Crash - Atasco En Saturno - 9 - 9, Songs 68-77

insert into songs(name) values
("Atila Kasac"),                #68
("Vida Cartesiana"),            #69
("El Viaje"),                   #70
("Yamya Y Kenke"),              #71
("Infinitos"),                  #72
("Juzga La Reina"),             #73
("Esperanza"),                  #74
("Puzzle"),                     #75
("Psicoeloy"),                  #76
("Chocoplanet Del Melfior");    #77

insert into albums_songs values
(9,68),
(9,69),
(9,70),
(9,71),
(9,72),
(9,73),
(9,74),
(9,75),
(9,76),
(9,77);

#Martinez - So Far... - 10 - 10, Songs 78-81

insert into songs(name) values
("Off The Shore"),
("Maryam"),
("Open Wild"),
("Oddity");

insert into albums_songs values
(10,78),
(10,79),
(10,80),
(10,81);

#JekK - Strong - 11 - 11, Songs 82-87

insert into songs(name) values
("Strong"),             #82
("By Your Side"),       #83
("Big Boy"),            #84
("Disobey"),            #85
("So Strong"),          #86
("Beautiful Day");      #87

insert into albums_songs values
(11,82),
(11,83),
(11,84),
(11,85),
(11,86),
(11,87);

#Shocky - Moaner - 12 - 12, Songs 88-93

insert into songs(name) values
("Dispute"),        #88
("Bakemaker"),      #89
("Farbellow"),      #90
("Strangeous"),     #91
("Stage"),          #92
("Check");          #93

insert into albums_songs values
(12,88),
(12,89),
(12,90),
(12,91),
(12,92),
(12,93);

#Techtonical Illuminations - Time Of Happiness And Sadness - 13 - 13, Songs 94-98

insert into songs(name) values
("Intro"),                      #94
("Give Me Another Chance"),     #95
("Loneliness"),                 #96
("Lovers Tragedy"),             #97
("Your Face");                  #98

insert into albums_songs values
(13,94),
(13,95),
(13,96),
(13,97),
(13,98);

#Mistery - Without You - 14 - 14, Songs 99-107

insert into songs(name) values
("Without You"),            #99
("Way Out Of Here"),        #100
("This Night"),             #101
("The Sting"),              #102
("Supergirl"),              #103
("September"),              #104
("Never Do"),               #105
("I Belong To You"),        #106
("Freak");                  #107

insert into albums_songs values
(14,99),
(14,100),
(14,101),
(14,102),
(14,103),
(14,104),
(14,105),
(14,106),
(14,107);

#El J - The Conciousness - 15 - 15, Songs 108-125

insert into songs(name) values
("My Introduction"),                    #108
("Meditate"),                           #109
("The Truth Can't Be Disguised"),       #110
("Searching Within"),                   #111
("Never Loose Faith"),                  #112
("Interlude For The People"),           #113
("Educated"),                           #114
("Money Effort Time"),                  #115
("The Struggle"),                       #116
("Late Night Drifters"),                #117
("When It Rains, It Pours"),            #118
("Life's More Than Strange"),           #119
("Situations Change"),                  #120
("Who's To Blame"),                     #121
("Behind Closed Doors"),                #122
("Ill Feeling"),                        #123
("Dark Days"),                          #124
("Reminisce");                          #125

insert into albums_songs values
(15,108),
(15,109),
(15,110),
(15,111),
(15,112),
(15,113),
(15,114),
(15,115),
(15,116),
(15,117),
(15,118),
(15,119),
(15,120),
(15,121),
(15,122),
(15,123),
(15,124),
(15,125);

#Idayam - Black Antology - 16 - 16, Songs 126-137

insert into songs(name) values
("Priya"),                              #126
("Style Libre"),                        #127
("Tel Père Tel Fils"),                  #128
("Gare Du Nord Remix"),                 #129
("GEO-DEmain"),                         #130
("Un Poème Pour Kavidah"),              #131
("Jeu De Rôle"),                        #132
("Cauchemar"),                          #133
("Con Trop Laid"),                      #134
("Elefant De La Frontière Remix"),      #135
("La Nuit Des Mots Vivants"),           #136
("Le Loup Des Steppes");                #137

insert into albums_songs values
(16,126),
(16,127),
(16,128),
(16,129),
(16,130),
(16,131),
(16,132),
(16,133),
(16,134),
(16,135),
(16,136),
(16,137);

#Mickey Blue - What I Wouldnt Do - 17 - 17, Songs 138-142

insert into songs(name) values
("Kill A Man"),     #138
("Anything"),       #139
("Someday Soon"),   #140
("Breathe"),        #141
("Adore You");      #142

insert into albums_songs values
(17,138),
(17,139),
(17,140),
(17,141),
(17,142);


#Plex - Divergent - 18 - 18, Songs 143-155

insert into songs(name) values
("Bethrotal"),              #143
("Blandish"),               #144
("Chicken Florentine"),     #145
("Fantasy"),                #146
("7089"),                   #147
("So In Love"),             #148
("Basic"),                  #149
("Man Of God"),             #150
("On The Go"),              #151
("Problems"),               #152
("Low"),                    #153
("Understand"),             #154
("Stereo");                 #155

insert into albums_songs values
(18,143),
(18,144),
(18,145),
(18,146),
(18,147),
(18,148),
(18,149),
(18,150),
(18,151),
(18,152),
(18,153),
(18,154),
(18,155);

#Depresive Motive - Chakras - 19 - 19, Songs 156-160

insert into songs(name) values
("Mystic"),         #156
("Muladhara"),      #157
("Labyrinth"),      #158
("Impulse"),        #159
("Dollars");        #160

insert into albums_songs values
(19,156),
(19,157),
(19,158),
(19,160);

#Marcellus Marshall - The Wild Side Of... - 20 - 20, Songs 161-170

insert into songs(name) values
("Emotional Crisis"),               #161
("Incipit Vita Nova"),              #162
("We Are The Virus(Part I)"),       #163
("It's My Time"),                   #164
("Little Bird"),                    #165
("Gimme What I Want"),              #166
("Dual Society"),                   #167
("So Manny Things To Tell You"),    #168
("We Are The Virus(Part II)"),      #169
("When Dreams Collide");            #170

insert into albums_songs values
(20,161),
(20,162),
(20,163),
(20,164),
(20,165),
(20,166),
(20,167),
(20,168),
(20,169),
(20,170);

#Marcel Pequel - The 12 Monts - 21 - 21, Songs 171-182

insert into songs(name) values
("January"),        #171
("February"),       #172
("March"),          #173
("April"),          #174
("May"),            #175
("June"),           #176
("July"),           #177
("August"),         #178
("September"),      #179
("October"),        #180
("November"),       #181
("December");       #182

insert into albums_songs values
(21,171),
(21,172),
(21,173),
(21,174),
(21,175),
(21,176),
(21,177),
(21,178),
(21,179),
(21,180),
(21,181),
(21,182);

#Borrtex - Ability - 22 - 22, Songs 183-187

insert into songs(name) values
("Ability"),            #183
("Choice"),             #184
("Walking"),            #185
("Determination"),      #186
("Attainment");         #187

insert into albums_songs values
(22,183),
(22,184),
(22,185),
(22,186),
(22,187);

#RenoB. - "Les Neiges D'Orcival" - 23 - 23, Songs 188-197

insert into songs(name) values
("Au Commencement Du Monde"),       #188
("Destroy Blues"),                  #189
("Aislinn"),                        #190
("Womens Garden"),                  #191
("Lumière"),                        #192
("Then And Now"),                   #193
("Erin's Waltz"),                   #194
("The Revelation"),                 #195
("La Fuite"),                       #196
("Les Neiges D'Orcival");           #197

insert into albums_songs values
(23,188),
(23,189),
(23,190),
(23,191),
(23,192),
(23,193),
(23,194),
(23,195),
(23,196),
(23,197);

#Pablo Samonta - Dark Fate Of Atlantis - 24 - 24, Songs 198-202

insert into songs(name) values
("Dark Fate Of Atlantis 131bpm"),       #198
("Dark Fate Of Atlantis pad"),          #199
("Dark Fate Of Atlantis perc"),         #200
("Dark Fate Of Atlantis no perc"),      #201
("Dark Fate Of Atlantis");              #202

insert into albums_songs values
(24,198),
(24,199),
(24,200),
(24,201),
(24,202);

#Epic Senses - The Golden Army - 25 - 25, Songs 203-213

insert into songs(name) values
("The Blue Planet"),        #203
("Disengage"),              #204
("Oracle"),                 #205
("The Golden Army V1"),     #206
("Outer Space"),            #207
("Glorious Road"),          #208
("The Golden Army V2"),     #209
("Gods Of Heaven"),         #210
("Understand"),             #211
("The Real One"),           #212
("Life");                   #213

insert into albums_songs values
(25,203),
(25,204),
(25,205),
(25,206),
(25,207),
(25,208),
(25,209),
(25,210),
(25,211),
(25,212),
(25,213);

#SinGle MatE - Symphony Of Soul And Mind - 26 - 26, Songs 214-216

insert into songs(name) values
("Symphony Of Soul And Mind, Act I"),       #214
("Symphony Of Soul And Mind, Act II"),      #215
("Symphony Of Soul And Mind, Act III");     #216

insert into albums_songs values
(26,214),
(26,215),
(26,216);

#Lunablind - Vision - 27 - 27, Songs 217-219

insert into songs(name) values
("Vision"),                         #217
("Vision [Radio Edit]"),            #218
("Vision [Instrumental Edit]");     #219

insert into albums_songs values
(27,217),
(27,218),
(27,219);

#Tony Almighty - What About - 28 - 28, Songs 220-227

insert into songs(name) values
("So Sorry [Sanna Hartfield]"),                     #220
("Not 100 Percent Right [Sanna Hartfield]"),        #221
("Happy [Sanna Hartfield]"),                        #222
("Don't Ask [Sanna Hartfield]"),                    #223
("Whose Talking About [Cristina Soto]"),            #224
("How About It [Sanna Hartfield]"),                 #225
("Not 100 Percent Right 2 [Sanna Hartfield]"),      #226
("What About [Sanna Hartfield]");                   #227

insert into albums_songs values
(28,220),
(28,221),
(28,222),
(28,223),
(28,224),
(28,225),
(28,226),
(28,227);

#Spacewolf Project - Return Of The Wolf - 29 - 29, Songs 228-243

insert into songs(name) values
("Intro"),                      #228
("Techflower"),                 #229
("Werewolf"),                   #230
("Opteron"),                    #231
("Return Of The Wolf"),         #232
("Freaky DJ"),                  #233
("Software Failure"),           #234
("Anthracite"),                 #235
("Solar System"),               #236
("Glitch"),                     #236
("Scratch"),                    #237
("Undersound"),                 #238
("Tribal"),                     #239
("All We Need Is Rave"),        #240
("Dynamic Breakz"),             #241
("Observe Learn Program");      #242

insert into albums_songs values
(29,228),
(29,229),
(29,230),
(29,231),
(29,232),
(29,233),
(29,234),
(29,235),
(29,236),
(29,237),
(29,238),
(29,239),
(29,240),
(29,241),
(29,242);

#Alexiaction - City Rythm - 30 - 30, Songs 244-248

insert into songs(name) values
("Dance"),                  #244
("Speed"),                  #245
("City Rythm"),             #246
("Fasion Invasion"),        #247
("Megapolis");              #248

insert into albums_songs values
(30,244),
(30,245),
(30,246),
(30,247),
(30,248);

#Gera Zim Zum - Rock It - 31 - 31, Songs 249-250

insert into songs(name) values
("Rock It"),    #249
("Simple");     #250

insert into albums_songs values
(31,249),
(31,250);

#Tony Almighty - Hot And Wet - 28 - 32, Songs 251-264   #Repeated Artist

insert into songs(name) values
("Short Dick Man"),         #251
("True"),                   #252
("Lick It"),                #253
("Rainy Day"),              #254
("Im Loosing It"),          #255
("Im Getting Money"),       #256
("Hold Me"),                #257
("Dance With Me"),          #258
("If I Can Hit You"),       #259
("Only You"),               #260
("Sexy Boy"),               #261
("Hot And Wet"),            #262
("Komradz"),                #263
("Let Em Have It");         #264

insert into albums_songs values
(32,251),
(32,252),
(32,253),
(32,254),
(32,255),
(32,256),
(32,257),
(32,258),
(32,259),
(32,260),
(32,261),
(32,262),
(32,263),
(32,264);

#Dazie Mae - Last Jazz In Paris - 32 - 33, Songs 265-268

insert into songs(name) values
("When Paris Is Singing"),      #265
("A New Love Affair"),          #266
("Sum Of My Fears"),            #267
("The Goodby Song");            #268

insert into albums_songs values
(33,265),
(33,266),
(33,267),
(33,268);

#Gustavo Crochenci - JazzBar - 33 - 34, Songs 269-270

insert into songs(name) values
("Valley Hill"),    #269
("JazzBar");        #270

insert into albums_songs values
(34,269),
(34,270);

#Guy Berrier - Around - 34 - 35, Songs 271-274

insert into songs(name) values
("Around You Freely"),          #271
("Around The Moon"),            #272
("Around The Melancholy"),      #273
("Around Cactus");              #274

insert into albums_songs values
(35,271),
(35,272),
(35,273),
(35,274);

#Antonio Diez - Sombras - 35 - 36, Songs 275-284

insert into songs(name) values
("Cruce De Caminos"),           #275
("Siguelo!"),                   #276
("Si Fuera Facil"),             #277
("Veinticinco"),                #278
("Pisando Charcos"),            #279
("Paseando De Tu Mano"),        #280
("Cancion De Paso"),            #281
("Sombras"),                    #282
("Verde Sobre Azul"),           #283
("Hechos Relevantes");          #284

insert into albums_songs values
(36,275),
(36,276),
(36,277),
(36,278),
(36,279),
(36,280),
(36,281),
(36,282),
(36,283),
(36,284);

#Marcelus Marshall - Marcellus Instrumentals - 20 - 37, Songs 285-287

insert into songs(name) values
("Do As You Like"),             #285
("Bring Me A Sunny Day"),       #286
("Song To Wake Up Slowly");     #287

insert into albums_songs values
(37,285),
(37,286),
(37,287);

#Corporatemusic - Funk - 36 - 38

insert into songs(name) values
("70s Afro Music"),     #288
("Funk"),               #289
("Funky");              #290

insert into albums_songs values
(38,288),
(38,289),
(38,290);

#The Rinn - Stories Of The Green Fairy - 37 - 39, Songs 291-300

insert into songs(name) values
("Symphony Of Light"),              #291
("Forgotten Dream"),                #292
("Mirror"),                         #293
("Green Fairy"),                    #294
("Voices"),                         #295
("Into The Dark"),                  #296
("Sleep"),                          #297
("Winter Night"),                   #298
("Secrets Of The Universe"),        #299
("The Way");                        #300

insert into albums_songs values
(39,291),
(39,292),
(39,293),
(39,294),
(39,295),
(39,296),
(39,297),
(39,298),
(39,299),
(39,300);

#UnderBlow - Corazon De Hielo - 38 - 40, Songs 301-311

insert into songs(name) values
("Corazon De Hielo"),           #301
("Brutal Love In Heaven"),      #302
("Iracundo"),                   #303
("Kimitra"),                    #304
("Altamente cabreado"),         #305
("Sigue Mi Luz Nena"),          #306
("En Nuestra Memoria"),         #307
("Vencedor"),                   #308
("El Ultimo Arcoiris"),         #309
("La Lluvia"),                  #310
("Robot");                      #311

insert into albums_songs values
(38,301),
(38,302),
(38,303),
(38,304),
(38,305),
(38,306),
(38,307),
(38,308),
(38,309),
(38,310),
(38,311);

#Unicorn Rodeo - Uniporn - 39 - 41, Songs 312-320

insert into songs(name) values
("Head In The Sand"),       #312
("I Wanna Know"),           #313
("Maybe"),                  #314
("Now Or Never"),           #315
("I Am"),                   #316
("Head In The Sand"),       #317
("I Wanna Know"),           #318
("Maybe"),                  #319
("Now Or Never");           #320

insert into albums_songs values
(39,312),
(39,313),
(39,314),
(39,315),
(39,316),
(39,317),
(39,318),
(39,319),
(39,320);

#Scream Inc. - Inception - 40 - 42, Songs 321-326

insert into songs(name) values
("Higher And Higher"),      #321
("Lyrics Of Life"),         #322
("Openfire"),               #323
("Machinegun"),             #324
("I'll Be The One"),        #325
("Soul Apart");             #326

insert into albums_songs values
(40,321),
(40,322),
(40,323),
(40,324),
(40,325);

#Hide & Dream - The Arsonist - 41 - 43, Songs 327-337

insert into songs(name) values
("Brothers"),                       #327
("Nothing To Fear"),                #328
("Time A Boundary"),                #329
("Tall Tales"),                     #330
("Crowds"),                         #331
("All I Know"),                     #332
("Her Hero"),                       #333
("Dream On, Dreamer"),              #334
("Don't Forget, Never Regret"),     #335
("Somebody Told Me"),               #336
("The Arsonist");                   #337

insert into albums_songs values
(41,327),
(41,328),
(41,329),
(41,330),
(41,331),
(41,332),
(41,333),
(41,334),
(41,335),
(41,336),
(41,337);

#Got No Choice - Neon EP - 42 - 44, Songs 338-340

insert into songs(name) values
("Neon"),           #338
("Rat Lurks"),      #339
("Rat King");       #340

insert into albums_songs values
(42,338),
(42,339),
(42,340);

#Kinematic - Kites - 43 - 45, Songs 341-354

insert into songs(name) values
("Already Here"),           #341
("Whirlwind"),              #342
("5 O Clock High"),         #343
("Jefferson High"),         #344
("Peyote"),                 #345
("Pinpoints"),              #346
("Pretty, Ugly"),           #347
("Weak And Splendid"),      #348
("Jika Jika"),              #349
("Mizuki"),                 #350
("The Punters Club"),       #351
("Beat Poetry"),            #352
("XRays And Traffic"),      #353
("Winter Son");             #354

insert into albums_songs values
(43,341),
(43,342),
(43,343),
(43,344),
(43,345),
(43,346),
(43,347),
(43,348),
(43,349),
(43,350),
(43,351),
(43,352),
(43,353),
(43,354);

#Heifervescent - Evolution Gains Again - 44 - 46, Songs 355-366

insert into songs(name) values
("Fountains Of Souls"),                     #355
("Colder Than The Edge Of Space"),          #356
("Falling"),                                #357
("Standing High"),                          #358
("Between The Cradle And The Grave"),       #359
("Unfamiliar Skies"),                       #360
("Fiamella"),                               #361
("Joyride The Hearse"),                     #362
("Monomaniacs"),                            #363
("She Buys Souls"),                         #364
("Poisonous Frogs"),                        #365
("Exit Plan");                              #366

insert into albums_songs values
(44,355),
(44,356),
(44,357),
(44,358),
(44,359),
(44,360),
(44,361),
(44,362),
(44,363),
(44,364),
(44,365),
(44,366);

#Seastock - Uplifting Innovation - 45 - 47, Songs 367-370

insert into songs(name) values
("Cutting Edge"),       #367
("Floating"),           #368
("Flux"),               #369
("Transformation");     #370

insert into albums_songs values
(45,367),
(45,368),
(45,369),
(45,370);

#Colaars - Underneath - 46 - 48, Songs 371-375

insert into songs(name) values
("To The Roofs"),       #371
("In Love"),            #372
("Underheart"),         #373
("You Lead Me"),        #374
("Haze");               #375

insert into albums_songs values
(46,371),
(46,372),
(46,373),
(46,374),
(46,375);


#Stasshurins - Natural Selection - 47 - 49, Songs 376-387

insert into songs(name) values
("You Are My"),                     #376
("Beach"),                          #377
("Waterfall Time"),                 #378
("Take"),                           #379
("Brake"),                          #380
("I Don't Care"),                   #381
("Sky-blood"),                      #382
("I'll Be Back"),                   #383
("Why"),                            #384
("As Long As You're With Me"),      #385
("Maniak"),                         #386
("I.P.O.D");                        #387

insert into albums_songs values
(47,376),
(47,377),
(47,378),
(47,379),
(47,380),
(47,381),
(47,382),
(47,383),
(47,384),
(47,385),
(47,386),
(47,387);

#Audio Da Vinci And The High Streets - Theater Without Style - 48 - 50, Songs 388-399

insert into songs(name) values
("Beach Girls"),            #388
("Date Night"),             #389
("Party Royale"),           #390
("Happy Valley"),           #391
("Internet People"),        #392
("Binary Ocean"),           #393
("Ivory Ship"),             #394
("Knighthood"),             #395
("Street Tough"),           #396
("Giant"),                  #397
("Flash Opera"),            #398
("Twilight Waltz");         #399

insert into albums_songs values
(48,388),
(48,389),
(48,390),
(48,391),
(48,392),
(48,393),
(48,394),
(48,395),
(48,396),
(48,397),
(48,398),
(48,399);

#Phil Harmonic - So Horny - 49 - 51, Songs 400-409

insert into songs(name) values
("I Will Always Be Free"),                  #400
("Let's Dance Under Your Dark Light"),      #401
("Ego War"),                                #402
("So Horny"),                               #403
("Cut The Crap, Disconected"),              #404
("All By Myself"),                          #405
("Eggheads"),                               #406
("Bored At The 100 Club"),                  #407
("What Love Is"),                           #408
("Like An Animal Farm");                    #409

insert into albums_songs values
(49,400),
(49,401),
(49,402),
(49,403),
(49,404),
(49,405),
(49,406),
(49,407),
(49,408),
(49,409);

#Radio K Oso - 110 FM - 50 - 52, Songs 410-416

insert into songs(name) values
("Oso Come Ricos"),                 #410
("Kema La Makina"),                 #411
("Ars Nostrum"),                    #412
("Sua Pizturik Dirau"),             #413
("Ahora Tienes Un Mercedes"),       #414
("Radio K Oso"),                    #415
("Ondorioa Gara");                  #416

insert into albums_songs values
(50,410),
(50,411),
(50,412),
(50,413),
(50,414),
(50,415),
(50,416);

#Intento Fallido - Invisible - 51 - 53, Songs 417-422

insert into songs(name) values
("Creo Que Tienes Rabia"),      #417
("Invisible"),                  #418
("Egoista"),                    #419
("Frente En Alto"),             #420
("Nunca Mas"),                  #421
("Parto Prematuro");            #422

insert into albums_songs values
(51,417),
(51,418),
(51,419),
(51,420),
(51,421),
(51,422);

#Vollrauschbeatz - Sturm Und Drang - 52 - 54, Songs 423-432

insert into songs(name) values
("Sturm Und Drang"),                #423
("Der Himmel Muss Warten"),         #424
("Scheiss Drauf!"),                 #425
("Freheit"),                        #426
("Saufen Ficken Feiern"),           #427
("Deine Liebe"),                    #428
("Zeiten Ändern Sich"),             #429
("Kranke Welt"),                    #430 
("Zurück And Meer"),                #431
("Donars Hammer");                  #432

insert into albums_songs values
(52,423),
(52,424),
(52,425),
(52,426),
(52,427),
(52,428),
(52,429),
(52,430),
(52,431),
(52,432);

#The Burgeois - From The Darkest Corners Of The Brightest Rooms - 53 - 55, Songs 433-442

insert into songs(name) values
("You Spiked The Puch With Apaty"),                         #433
("Bootstraps"),                                             #434
("Everything Is Beautiful, And Nothing Hurts"),             #435
("Weekend At Bernie's Mac"),                                #436
("Designer Genes"),                                         #437
("Anthem To The Huddled Masses"),                           #438
("Make A Wish"),                                            #439
("Your Personal Ashtray"),                                  #440
("Route 666"),                                              #441
("Sentenced To Death In The Court Of Public Opinion");      #442

insert into albums_songs values
(53,433),
(53,434),
(53,435),
(53,436),
(53,437),
(53,438),
(53,439),
(53,440),
(53,441),
(53,442);

#Surlife - Ambivalent - 54 - 56, Songs 443-446

insert into songs(name) values
("How Together"),       #443
("What You Want"),      #444
("Brainbow"),           #445
("Trust");              #446

insert into albums_songs values
(54,443),
(54,444),
(54,445),
(54,446);

#Christian Petermann - Blues - 55 - 57, Songs 447-460

insert into songs(name) values
("Beach Blues"),            #447
("Brandy Blues"),           #448
("Candelight Blues"),       #449
("Daydream Blues"),         #450
("Elegant Blues"),          #451
("Happy Blues"),            #452
("Lonely Blues"),           #453
("Misterious Blues"),       #454
("Purple Blues"),           #455
("Redlight Blues"),         #456
("Second Blues"),           #457
("Spell Blues"),            #458
("Winter Blues"),           #459
("Atomic Blues");           #460

insert into albums_songs values
(55,447),
(55,448),
(55,449),
(55,450),
(55,451),
(55,452),
(55,453),
(55,454),
(55,455),
(55,456),
(55,457),
(55,458),
(55,459),
(55,460);

#Kathy Shortt And Yvalain - Just Turn The Light On! - 56 - 58, Songs 461-469

insert into songs(name) values
("Here I Am On Bended Knees"),          #461
("Dreams That We Ponder"),              #462
("You Promised Me Roses"),              #463
("Mister"),                             #464
("A New Day"),                          #465
("I Want To Feel Better"),              #466
("My Head Is In A Cloud"),              #467
("Show Me Your Way"),                   #468
("Fading");                             #469

insert into albums_songs values
(56,461),
(56,462),
(56,463),
(56,464),
(56,465),
(56,466),
(56,467),
(56,468),
(56,469);

#Michael Ellis - The Complexity Of Things - 57 - 59, Songs 470-484

insert into songs(name) values
("Merry Christmas, Mr Woffatt"),            #470
("Align"),                                  #471
("Rock Star"),                              #472
("Lighthouse"),                             #473
("Fairytale Syndrome"),                     #474
("Deep Down"),                              #475
("Easy On The Radio"),                      #476
("Bruises"),                                #477
("The Complexity Of Things"),               #478
("Dusty Boots And Flashy Rust"),            #479
("Long Enough"),                            #480
("See Me When I Shine"),                    #481
("Just The One"),                           #482
("Nothing To See Here"),                    #483
("Ever");                                   #484

insert into albums_songs values
(57,470),
(57,471),
(57,472),
(57,473),
(57,474),
(57,475),
(57,476),
(57,477),
(57,478),
(57,479),
(57,480),
(57,481),
(57,482),
(57,483),
(57,484);

#Normandia - Hogan Alley - 58 - 60, Songs 485-494

insert into songs(name) values
("Plohije Parni"),                  #485
("Chornyje Kvatarly"),              #486
("Veter"),                          #487
("Ja Znal"),                        #488
("Ne Hodi Za Ney"),                 #489
("Moneta"),                         #490
("Dver"),                           #491
("Muzchiny Ne Plachut"),            #492
("Sol Na Ruke"),                    #493
("Secret");                         #494

insert into albums_songs values
(58,485),
(58,486),
(58,487),
(58,488),
(58,489),
(58,490),
(58,491),
(58,492),
(58,493),
(58,494);

#Vinyl Blast - Secret - 59 - 61, Songs 495-496

insert into songs(name) values
("Secret"),                 #495
("Fire In My Hands");       #496

insert into albums_songs values
(59,495),
(59,496);

#ccMixter - Codex Tempore - 60 - 62, Songs 497-510

insert into songs(name) values
("Growing"),                        #497
("Cold Fusion"),                    #498
("You're The Change"),              #499
("The Chillout Experiment"),        #500
("Blessed Are The Greedy"),         #501
("Free Music And Free Beer"),       #502
("Groovy King Of Song"),            #503
("Human Race"),                     #504
("Chances"),                        #505
("Endless"),                        #506
("The Freakout Experiment"),        #507
("Thousand Songs Away"),            #508
("Hanging Eleven"),                 #509
("Two-Minute Warning");             #510

insert into albums_songs values
(60,497),
(60,498),
(60,499),
(60,500),
(60,501),
(60,502),
(60,503),
(60,504),
(60,505),
(60,506),
(60,507),
(60,508),
(60,509),
(60,510);



  /*genres_subgenres*/
    
insert into genres_subgenres values
(1,1),
(1,2),
(1,3),
(1,4),
(2,5),
(2,6),
(2,7),
(3,3),
(3,8),
(3,9),
(3,10),
(4,11),
(4,12),
(5,13),
(5,14),
(6,15),
(6,16),
(6,17),
(7,18),
(7,19),
(7,20),
(8,21),
(8,22),
(9,23),
(9,24),
(9,25),
(10,26),
(10,27);

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
(2,9),
(2,10),
(2,11),
(2,12),
(2,13),
(2,14),
(3,15),
(3,16),
(3,17),
(3,18),
(3,19),
(3,20),
(4,21),
(4,22),
(4,23),
(4,24),
(4,25),
(4,26),
(5,27),
(5,28),
(5,29),
(5,30),
(5,31),
(6,32),
(6,33),
(6,34),
(6,35),
(6,20),
(6,36),
(7,37),
(7,38),
(7,39),
(7,40),
(7,41),
(7,42),
(8,43),
(8,44),
(8,45),
(8,46),
(8,47),
(8,48),
(9,49),
(9,50),
(9,51),
(9,52),
(9,53),
(9,54),
(10,55),
(10,56),
(10,57),
(10,58),
(10,59),
(10,60);

/*subgenres_albums*/

insert into subgenres_albums values
(1,1),
(1,2),
(2,3),
(2,4),
(3,5),
(3,6),
(4,7),
(4,8),
(5,9),
(5,10),
(6,11),
(6,12),
(7,13),
(7,14),
(8,15),
(8,16),
(9,17),
(9,18),
(10,19),
(10,20),
(11,21),
(11,22),
(11,23),
(12,24),
(12,25),
(12,26),
(13,27),
(13,28),
(13,29),
(14,30),
(14,31),
(14,32),
(15,33),
(15,34),
(16,35),
(16,36),
(17,37),
(17,38),
(18,39),
(18,40),
(19,41),
(19,42),
(20,43),
(20,44),
(21,45),
(21,46),
(21,47),
(22,48),
(22,49),
(22,50),
(23,51),
(23,52),
(24,53),
(24,54),
(25,55),
(25,56),
(26,57),
(26,58),
(26,59),
(27,60),
(27,61),
(27,62);
