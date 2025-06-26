DROP DATABASE IF EXISTS SUBNAUTICA; -- <- Elimina la base de datos si esque ya existe.
CREATE DATABASE SUBNAUTICA; -- <- Crea la base de datos.
USE SUBNAUTICA; -- <- Se seleccionada la base de datos, permitiendonos el uso y acceso a ella.

-- Crea la tabla del objeto, es decir, la principal.
CREATE TABLE `Object` (
	`ID` INTEGER NOT NULL UNIQUE AUTO_INCREMENT, -- <- Se crea el atributo del identificador del object.
	`Name` VARCHAR(255) NOT NULL, -- <- Se crea el atributo del nombre del object.
	`Description` VARCHAR(255) NOT NULL, -- <- Se crea el atributo de la descripción del object.
	`Amount_Parts` INTEGER NOT NULL, -- <- Se crea el atributo de la cantidad de partes en las que estará fragmentado el object.
	`ID_Sprite` INTEGER NOT NULL, -- <- Se crea el atributo del ID de la imagen del object.
	`ID_Sound` INTEGER NOT NULL, -- <- Se crea el atributo del ID del sonido del object.
	`ID_PartObject` INTEGER NOT NULL, -- <- Se crea el atributo del ID de la parte del object.
	`ID_Type` INTEGER NOT NULL, -- <- Se crea el atributo del ID del tipo del object.
	`ID_Reward` INTEGER NOT NULL, -- <- Se crea el atributo del ID de la recompensa del object.
	PRIMARY KEY(`ID`) -- <- Se setea el atributo ID como clave primaria.
);

-- Crea la tabla del Sprite, esta se conectará con Object. 
CREATE TABLE `Sprite` (
	`ID` INTEGER NOT NULL UNIQUE AUTO_INCREMENT, -- <- Se crea el atributo del identificador del Sprite.
	`Path` VARCHAR(255) NOT NULL, -- <- Se crea el atributo de la ruta del Sprite.
	PRIMARY KEY(`ID`) -- <- ||.
);

-- Crea la tabla del Sound, esta se conectará con Object. 
CREATE TABLE `Sound` (
	`ID` INTEGER NOT NULL UNIQUE AUTO_INCREMENT, -- <- Se crea el atributo del identificador del Sound.
	`Path` VARCHAR(255) NOT NULL, -- <- Se crea el atributo de la ruta del Sound.
	PRIMARY KEY(`ID`) -- <- ||.
);

-- Crea la tabla del PartObject, este se conectará con Object. 
CREATE TABLE `PartObject` (
	`ID` INTEGER NOT NULL UNIQUE AUTO_INCREMENT, -- <- Se crea el atributo del identificador del PartObject.
	`ID_Sprite` INTEGER NOT NULL, -- <- Se crea el atributo del ID de la imagen que tendrá el PartObject.
	PRIMARY KEY(`ID`) -- <- ||.
);

-- Crea la tabla del Part Object Sprite (PO_Sprite), este se conectará con PartObject. 
CREATE TABLE `PO_Sprite` (
	`ID` INTEGER NOT NULL UNIQUE AUTO_INCREMENT, -- <- Se crea el atributo del identificador del PO_Sprite.
	`Path` VARCHAR(255) NOT NULL, -- <- Se crea el atributo de la ruta del PartObject.
	PRIMARY KEY(`ID`) -- <- ||.
);

-- Crea la tabla del Type, esta se conectará con Object. 
CREATE TABLE `Type` (
	`ID` INTEGER NOT NULL UNIQUE AUTO_INCREMENT, -- <- Se crea el atributo del identificador del tipo.
	`Name` VARCHAR(255) NOT NULL, -- <- Se crea el atributo del nombre del tipo.
	PRIMARY KEY(`ID`) -- <- ||.
);

-- Crea la tabla del Reward, esta se conectará con Object. 
CREATE TABLE `Reward` (
	`ID` INTEGER NOT NULL UNIQUE AUTO_INCREMENT, -- <- Se crea el atributo del identificador de la recompensa.
	`ID_Sound` INTEGER NOT NULL, -- <- Se crea el atributo del identificador del sonido de notificación de la recompensa.
	`Message` VARCHAR(255) NOT NULL, -- <- Se crea el atributo del mensaje de la recompensa.
	PRIMARY KEY(`ID`) -- <- ||.
);

-- Crea la tabla del Reward Sound (RW_Sound), esta se conectará con Reward. 
CREATE TABLE `RW_Sound` (
	`ID` INTEGER NOT NULL UNIQUE AUTO_INCREMENT, -- <- Se crea el atributo del identificador del sonido de la recompensa.
	`Path` VARCHAR(255) NOT NULL, -- <- Se crea el atributo de la ruta del sonido de la recompensa.
	PRIMARY KEY(`ID`) -- <- ||.
);


ALTER TABLE `Object` -- <- Entramos a modificar la tabla Object.
ADD FOREIGN KEY(`ID_Sprite`) REFERENCES `Sprite`(`ID`) -- <- Indicamos que el atrbibuto ID_Sprite sea una clave foránea que referencia al atributo ID de la tabla Sprite.
ON UPDATE NO ACTION ON DELETE NO ACTION; -- <- No está permitido modificar ni eliminar la clave foréanea si se está siendo referenciada por Object.

ALTER TABLE `Object` -- <- ||.
ADD FOREIGN KEY(`ID_Sound`) REFERENCES `Sound`(`ID`) -- <- Indicamos que el atrbibuto ID_Sound sea una clave foránea que referencia al atributo ID de la tabla Sound.
ON UPDATE NO ACTION ON DELETE NO ACTION; -- <- ||.

ALTER TABLE `Object` -- <- ||.
ADD FOREIGN KEY(`ID_PartObject`) REFERENCES `PartObject`(`ID`) -- <- Indicamos que el atrbibuto ID_PartObject sea una clave foránea que referencia al atributo ID de la tabla PartObject.
ON UPDATE NO ACTION ON DELETE NO ACTION; -- <- ||.

ALTER TABLE `PartObject` -- <- Entramos a modificar la tabla PartObject.
ADD FOREIGN KEY(`ID_Sprite`) REFERENCES `PO_Sprite`(`ID`) -- <- Indicamos que el atrbibuto ID_Sprite sea una clave foránea que referencia al atributo ID de la tabla PO_Sprite.
ON UPDATE NO ACTION ON DELETE NO ACTION; -- <- ||.

ALTER TABLE `Object` -- <- Entramos nuevamente a modificar la tabla Object.
ADD FOREIGN KEY(`ID_Type`) REFERENCES `Type`(`ID`) -- <- Indicamos que el atrbibuto ID_Type sea una clave foránea que referencia al atributo ID de la tabla Type.
ON UPDATE NO ACTION ON DELETE NO ACTION; -- <- ||.

ALTER TABLE `Object` -- <- ||.
ADD FOREIGN KEY(`ID_Reward`) REFERENCES `Reward`(`ID`) -- <- Indicamos que el atrbibuto ID_Reward sea una clave foránea que referencia al atributo ID de la tabla Reward.
ON UPDATE NO ACTION ON DELETE NO ACTION; -- <- ||.

ALTER TABLE `Reward` -- <- Entramos a modificar la tabla Reward.
ADD FOREIGN KEY(`ID_Sound`) REFERENCES `RW_Sound`(`ID`) -- <- Indicamos que el atrbibuto ID_Sound sea una clave foránea que referencia al atributo ID de la tabla RW_Sound.
ON UPDATE NO ACTION ON DELETE NO ACTION; -- <- ||.


-- -> Sprite Object
INSERT INTO Sprite (ID, Path) VALUES
(1, "Images/LaserCutter.png"),
(2, "Images/StasisRifle.png"),
(3, "Images/PropulsionCannon.png"),
(4, "Images/LightStick.png"),
(5, "Images/Beacon.png"),
(6, "Images/GravTrap.png"),
(7, "Images/MobileVehicleBay.png"),
(8, "Images/SeaGlide.png"),
(9, "Images/SeaMoth.png"),
(10, "Images/Cyclops.png"),
(11, "Images/PrawnSuit.png"),
(12, "Images/BioReactor.png"),
(13, "Images/NuclearReactor.png"),
(14, "Images/BatteryCharger.png"),
(15, "Images/ModificationStation.png"),
(16, "Images/PowerCellCharger.png"),
(17, "Images/PowerTransmitter.png"),
(18, "Images/ThermalPlant.png"),
(19, "Images/MoonPool.png"),
(20, "Images/ScannerRoom.png"),
(21, "Images/WaterFiltrationSuit.png");

-- -> Sound Object
INSERT INTO Sound (ID, Path) VALUES
(1, "lasercutter_sound.ogg"),
(2, "stasisrifle_sound.ogg"),
(3, "propulsioncannon_sound.ogg"),
(4, "lightstick_sound.ogg"),
(5, "beacon_sound.ogg"),
(6, "gravtrap_sound.ogg"),
(7, "mobilevehiclebay_sound.ogg"),
(8, "seaglide_sound.ogg"),
(9, "seamoth_sound.ogg"),
(10, "cyclops_sound.ogg"),
(11, "prawnsuit_sound.ogg"),
(12, "bioreactor_sound.ogg"),
(13, "nuclearreactor_sound.ogg"),
(14, "batterycharger_sound.ogg"),
(15, "modificationstation_sound.ogg"),
(16, "powercellcharger_sound.ogg"),
(17, "powertransmitter_sound.ogg"),
(18, "thermalplant_sound.ogg"),
(19, "moonpool_sound.ogg"),
(20, "scannerroom_sound.ogg"),
(21, "waterfiltrationsuit_sound.ogg");

-- -> Sprite Part Object
INSERT INTO PO_Sprite (ID, Path) VALUES
(1, "lasercutter_part1.png"),
(2, "stasisrifle_part1.png"),
(3, "propulsioncannon_part1.png"),
(4, "lightstick_part1.png"),
(5, "beacon_part1.png"),
(6, "gravtrap_part1.png"),
(7, "mobilevehiclebay_part1.png"),
(8, "seaglide_part1.png"),
(9, "seamoth_part1.png"),
(10, "cyclops_part1.png"),
(11, "prawnsuit_part1.png"),
(12, "bioreactor_part1.png"),
(13, "nuclearreactor_part1.png"),
(14, "batterycharger_part1.png"),
(15, "modificationstation_part1.png"),
(16, "powercellcharger_part1.png"),
(17, "powertransmitter_part1.png"),
(18, "thermalplant_part1.png"),
(19, "moonpool_part1.png"),
(20, "scannerroom_part1.png"),
(21, "waterfiltrationsuit_part1.png");

-- -> Part Object
INSERT INTO PartObject (ID, ID_Sprite) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21);

-- -> Type Object
INSERT INTO Type (ID, Name) VALUES
(1, "Tools"),
(2, "Deployables"),
(3, "Vehicles"),
(4, "Interior Pieces"),
(5, "Interior Modules"),
(6, "Exterior Modules"),
(7, "Base Pieces"),
(8, "Equipment");

-- -> Sound Reward
INSERT INTO RW_Sound (ID, Path) VALUES
(1, "lasercutter_rw_sound.ogg"),
(2, "stasisrifle_rw_sound.ogg"),
(3, "propulsioncannon_rw_sound.ogg"),
(4, "lightstick_rw_sound.ogg"),
(5, "beacon_rw_sound.ogg"),
(6, "gravtrap_rw_sound.ogg"),
(7, "mobilevehiclebay_rw_sound.ogg"),
(8, "seaglide_rw_sound.ogg"),
(9, "seamoth_rw_sound.ogg"),
(10, "cyclops_rw_sound.ogg"),
(11, "prawnsuit_rw_sound.ogg"),
(12, "bioreactor_rw_sound.ogg"),
(13, "nuclearreactor_rw_sound.ogg"),
(14, "batterycharger_rw_sound.ogg"),
(15, "modificationstation_rw_sound.ogg"),
(16, "powercellcharger_rw_sound.ogg"),
(17, "powertransmitter_rw_sound.ogg"),
(18, "thermalplant_rw_sound.ogg"),
(19, "moonpool_rw_sound.ogg"),
(20, "scannerroom_rw_sound.ogg"),
(21, "waterfiltrationsuit_rw_sound.ogg");

-- -> Reward Object
INSERT INTO Reward (ID, ID_Sound, Message) VALUES
(1, 1, "Laser Cutter available for fabrication."),
(2, 2, "Stasis Rifle available for fabrication."),
(3, 3, "Propulsion Cannon available for fabrication."),
(4, 4, "Light Stick available for fabrication."),
(5, 5, "Beacon available for fabrication."),
(6, 6, "Grav Trap available for fabrication."),
(7, 7, "Mobile Vehicle Bay available for fabrication."),
(8, 8, "Seaglide available for fabrication."),
(9, 9, "Seamoth available for fabrication."),
(10, 10, "Cyclops available for fabrication."),
(11, 11, "Prawn Suit available for fabrication."),
(12, 12, "Bioreactor available for fabrication."),
(13, 13, "Nuclear Reactor available for fabrication."),
(14, 14, "Battery Charger available for fabrication."),
(15, 15, "Modification Station available for fabrication."),
(16, 16, "Power Cell Charger available for fabrication."),
(17, 17, "Power Transmitter available for fabrication."),
(18, 18, "Thermal Plant available for fabrication."),
(19, 19, "Moonpool available for fabrication."),
(20, 20, "Scanner Room available for fabrication."),
(21, 21, "Water Filtration Suit available for fabrication.");

INSERT INTO Object ( Name, Description, Amount_Parts, ID_Sprite, ID_Sound, ID_PartObject, ID_Type, ID_Reward) VALUES
("Laser Cutter", "Cutting device suitable for penetrating standard titanium doors." , 3, 1, 1, 1, 1, 1),
("Stasis Rifle", "A tool that freezes physical objects." , 2, 2, 2, 2, 1, 2),
("Propulsion Cannon", "Warps gravity to pull and push objects." , 2, 3, 3, 3, 1, 3),
("Light Stick", "Deployable battery-powered lighting." , 2, 4, 4, 4, 1, 4),
("Beacon", "Navigation aid. Maintains and broadcasts its position." , 2, 5, 5, 5, 2, 5),
("Grav Trap", "Uses artificial gravity to attract light objects and small creatures." , 2, 6, 6, 6, 2, 6),
("Mobile Vehicle Bay", "Fabricates vehicles from raw materials." , 3, 7, 7, 7, 2, 7),
("Seaglide", "Converts torque into thrust underwater via propeller." , 2, 8, 8, 8, 2, 8),
("Seamoth", "One-person sea-and-space vehicle." , 3, 9, 9, 9, 3, 9),
("Cyclops", "Vast industrial-use submarine." , 3, 10, 10, 10, 3, 10),
("Prawn Suit", "Epic mech suit designed for navigating challenging environments on foot." , 4, 11, 11, 11, 3, 11),
("Bioreactor", "Composts organic matter into electrical energy." , 2, 12, 12, 12, 4, 12),
("Nuclear Reactor", "Processes nuclear reactor rods for huge power supply." , 3, 13, 13, 13, 4, 13),
("Battery Charger", "Can charge up to 4 batteries simultaneously." , 2, 14, 14, 14, 5, 14),
("Modification Station", "Advanced fabricator for modification of survival equipment." , 3, 15, 15, 15, 5, 15),
("Power Cell Charger", "Can charge up to 2 power cells simultaneously." , 2, 16, 16, 16, 5, 16),
("Power Transmitter", "Extends the range of a power source." , 1, 17, 17, 17, 6, 17),
("Thermal Plant", "Converts heat to energy at medium efficiency." , 2, 18, 18, 18, 6, 18),
("Moonpool", "Vehicle docking bay with high energy and structural requirements." , 2, 19, 19, 19, 7, 19),
("Scanner Room", "Locates resources and wrecks within range." , 3, 20, 20, 20, 7, 20),
("Water Filtration Suit", "Reclaims moisture from the body and provides clean, drinkable water." , 2, 21, 21, 21, 8, 21);