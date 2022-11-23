DROP TABLE IF EXISTS weapons_materials;
DROP TABLE IF EXISTS armours_materials;

DROP TABLE IF EXISTS materials;
DROP TABLE IF EXISTS characters_weapons;
DROP TABLE IF EXISTS characters_armours;
DROP TABLE IF EXISTS characters_items;
DROP TABLE IF EXISTS weapons;

DROP TABLE IF EXISTS armours;

DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS weapons_types;
DROP TABLE IF EXISTS armours_types;
DROP TABLE IF EXISTS items_types;

DROP TABLE IF EXISTS stats;

DROP TABLE IF EXISTS characters;


CREATE TABLE characters (
    id_character INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(32),
    age INT,
    race VARCHAR(16),
    gender CHAR(1),
    class VARCHAR(16),
    height FLOAT,
    weight FLOAT,
    country CHAR(3),
    description TEXT

);

INSERT INTO characters (name, age, race,
                       gender, class, height,
                       weight, country, description)


VALUES
("Payoh",64 , "Cambiapieles", "L", "Dictador", 1.75, 80 , "RUM","Payoh es un cambiapieles" ),
("Yuca",27, "Sirenido", "F", "Criptolai", 0.7, 80 , "PUR","Una sirena de puertorrico que trafica con ezereum" ),
("Yulen",70, "Nomuerto", "D", "Minero", 0.8, 25 , "NDE","Era se una vez un pozo" ),
("Josema",3000, "Deidad", "T", "Procrastinador", 3.14, 0 , "PE","Es una deidad que deja las cosas pa' después" ),
("CayetanoMelendi",28, "Iberica", "M", "OrganScammer", 1.7, 70 , "ESP","Mi gran cantante i amor i cantante lo amo venderia mi organo por el siii ole" );

CREATE TABLE stats (
    id_stats INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    agility INT,
    hp FLOAT,
    hp_max INT,
    xp FLOAT,
    xp_max INT,
    mp FLOAT,
    mp_max INT,
    lvl INT,
    physic_attack FLOAT,
    magic_attack FLOAT,
    physic_defense FLOAT,
    magic_defense FLOAT,
    stamina INT,
    mana INT,
    intel INT,
    stealth INT,
    luck INT,
    faith INT,
    velocity INT,
    destrecity INT,
    strangth INT,
    carisma INT,
    vigor INT,
    tenacity INT,
    critical_rate float,
    id_character INT UNSIGNED,
    FOREIGN KEY (id_character) REFERENCES characters (id_character)
);

INSERT INTO stats (id_stats, agility, hp, hp_max, xp, xp_max, mp, mp_max, lvl, physic_attack , magic_attack, physic_defense, magic_defense, stamina, mana, intel, stealth,luck , faith, velocity, destrecity, strangth, carisma, vigor, tenacity, critical_rate, id_character)

VALUES
		(1, 950, 820, 0, 300, 0, 2, 0, 57, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
		(2, 75, 0, 0, 500, 0, 300, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
        (3, 250, 350, 0, 500, 0, 450, 0, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
        (4, 200, 600, 0, 150, 0, 750, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);



CREATE TABLE items_types (
	id_item_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	type VARCHAR(24),
    description TEXT,
    icon VARCHAR(16)
);
INSERT INTO items_types (type, description, icon)
VALUES ("Pocion", "Hacen cosas", "pocion.png"),
("comida", "Se puede consumir", "comida.png"),
("Tesoro", "tesoros en general", "tesoro.png");


CREATE TABLE armours_types (
	id_armour_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	type VARCHAR(24),
    description TEXT,
    icon VARCHAR(16)
);

INSERT INTO armours_types (type, description, icon)
VALUES ("Peto", "peto", "peto.png"),
("Traje", "UN bonito traje", "traje.png"),
("Casco", "Un casco que proteje xd", "casco.png");


CREATE TABLE weapons_types (
	id_weapon_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	type VARCHAR(24),
    description TEXT,
    icon VARCHAR(16)
);


INSERT INTO weapons_types (type, description, icon)
VALUES ("Melee", "Cuerpo a cuerpo", "melee.png"),
("Range", "Disparo a distancia", "range.png");





CREATE TABLE items (
    id_item INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    item VARCHAR(24),
    consumible BOOLEAN,
    cost FLOAT,
    `key` BOOLEAN,
    rarity INT,
    weight FLOAT,
    `usage` INT,
    fusionable BOOLEAN,
    width FLOAT,
    height FLOAT,
    durability INT,
    description TEXT,
    dissasamble BOOLEAN,
    id_item_type INT UNSIGNED,
    FOREIGN KEY (id_item_type) REFERENCES items_types (id_item_type)
);

INSERT INTO items ( item, consumible, cost,
                   `key`, rarity, weight,
                   `usage`, fusionable, width,
                   height, durability,
                   description, dissasamble, id_item_type)
VALUES
("Queso",1, 50,
 0 ,100, 2.5,
 1, 1, 0.1,
 0.1, 3,
 "Queso que sabe a beso", 0, 1),
("Carne de zombie",1, 20,
 0 , 2, 0.3,
 1, 1, 0.3,
 0.3, 1,
 "Huele muy mal" , 0, 1),
("Fragmento Escarlata",1, 500,
 0 , 10000, 45,
 1 , 1, 0.5,
 0.25, -1,
 "Piedra rara de un volcan" , 0, 2
);


CREATE TABLE armours (
    id_armour INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    armour VARCHAR(32),
    class VARCHAR(16),
    wight FLOAT,
    magic_defense FLOAT,
    physic_defense FLOAT,
    durability INT,
    lvl INT,
    lvl_max INT,
    cost FLOAT,
    rarity INT,
    id_armour_type INT UNSIGNED
);

INSERT INTO armours ( id_armour, armour, class,
                   wight, magic_defense,
                   physic_defense, durability, lvl,
                   lvl_max, rarity,
                   id_armour_type)
VALUES
	(1, "druid clothes", "NO", 2, 0, 0, 0, 0, 0, 0, 1),
    (2, "mine clothing", "WO", 10, 0, 0, 0, 0, 0, 0, 3),
    (3, "divine dress", "DR", 3, 0, 0, 0, 0, 0, 0, 4),
    (4, "atlantis clothes", "NO", 20, 0, 0, 0, 0, 0, 0, 2),
    (5, "ranger clothes", "NO", 5, 0, 0, 0, 0, 0, 0, 5);
 
 


CREATE TABLE weapons (
    id_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    weapon VARCHAR(24),
    grip INT,
    durability INT,
    distance FLOAT,
    quality INT,
    physic_attack FLOAT,
    physic_defense FLOAT,
    magic_attack FLOAT,
    magic_defense FLOAT,
    description TEXT,
    level INT,
    level_min INT,
    id_weapon_type INT UNSIGNED,
    FOREIGN KEY (id_weapon_type) REFERENCES weapons_types (id_weapon_type)
);

INSERT INTO weapons ( weapon, grip, durability,
                   distance, quality, physic_attack,
                   physic_defense, magic_attack, magic_defense,
                   description, level,
                   level_min, id_weapon_type)
VALUES
("Brazo de bebes",1, 100,
 0.5 ,0, 0,
 0, 0, 0,
 "Arrancaste un brazo de un bebe", 0,
 0, 1),
 
("Estelada",1, 1714,
 3 ,100, 1,
 1, 1, 1,
 "Una bandera con una estrella", 101,
 100, 1),
 
 ("Astrape",1, -1,
 1000 ,100, 100,
 10, 100, 30,
 "El rayo de zeus", 100,
 100, 1),
 
 ("Espada de Yerba",1, 900,
 3 ,100, 1,
 1, 1, 1,
 "La mítica espada de YERBA todo el mundo la conoce", 100,
 100, 1
 );



CREATE TABLE characters_items (

id_character_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_character INT UNSIGNED,
id_item INT UNSIGNED,
FOREIGN KEY (id_character) REFERENCES characters (id_character),
FOREIGN KEY (id_item) REFERENCES items (id_item)
);

INSERT INTO characters_items (id_character, id_item)
VALUES (1, 2), (2, 3), (4, 1);



CREATE TABLE characters_armours (

id_character_armour INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_character INT UNSIGNED,
id_armour INT UNSIGNED,
FOREIGN KEY (id_character) REFERENCES characters (id_character),
FOREIGN KEY (id_armour) REFERENCES armours (id_armour)
);

INSERT INTO characters_armours (id_character, id_armour)
VALUES (3, 1), (4, 2), (1, 2);



CREATE TABLE characters_weapons (

id_character_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_character INT UNSIGNED,
id_weapon INT UNSIGNED,
FOREIGN KEY (id_character) REFERENCES characters (id_character),
FOREIGN KEY (id_weapon) REFERENCES weapons (id_weapon)
);

INSERT INTO characters_weapons (id_character, id_weapon)
VALUES (1, 1), (4, 3), (4, 1);





CREATE TABLE materials (
	id_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	material VARCHAR(16),
    color CHAR(6),
    cost FLOAT
);

INSERT INTO materials (material, color, cost) VALUES
("Obsidiana","000000", 40),
("Madera", "ddeeaa", 10),
("Carne", "ffff00", 5),
("Pana", "ffdddd", 50),
("Goma sagrada", "ffffff", 1000),
("Piedra", "cccccc", 1),
("Cuero", "ddddaa", 20),
("Bandera ESPAÑA", "ESPAÑA", 2030),
("Plumas de angel", "ffffff", 10000),
("Materia oscura", "000000", 10000),
("Hueso", "dddddd", 10),
("Agua", "0000ff", 1),
("Lava", "ff0000", 500);





CREATE TABLE armours_materials (
id_armour_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_armour INT UNSIGNED,
id_material INT UNSIGNED,
FOREIGN KEY (id_armour) REFERENCES armours (id_armour),
FOREIGN KEY (id_material) REFERENCES materials (id_material)
    );



CREATE TABLE weapons_materials (
id_weapon_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_weapon INT UNSIGNED,
id_material INT UNSIGNED,
FOREIGN KEY (id_weapon) REFERENCES weapons (id_weapon),
FOREIGN KEY (id_material) REFERENCES materials (id_material)
    );
