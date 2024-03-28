SET NAMES utf8mb4;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';
SET @old_autocommit=@@autocommit;

USE pokemon;

INSERT INTO ability (ability_id, name, description) VALUES
(1, 'Levitate', 'The Pokémon floats in the air, evading most ground-based moves.'),
(2, 'Intimidate', 'The Pokémon intimidates opposing Pokémon upon entering battle, lowering their Attack stat.'),
(3, 'Keen Eye', 'Opponents’ moves can’t lower the Pokémon’s accuracy.'),
(4, 'Static', 'The Pokémon is charged with static electricity, so contact with it may cause paralysis.'),
(5, 'Overgrow', 'Powers up Grass-type moves when the Pokémon’s HP is low.'),
(6, 'Blaze', 'Powers up Fire-type moves when the Pokémon’s HP is low.'),
(7, 'Torrent', 'Powers up Water-type moves when the Pokémon’s HP is low.'),
(8, 'Sand Veil', 'Boosts the Pokémon’s evasion in a sandstorm.'),
(9, 'Battle Armor', 'Hard armor protects the Pokémon from critical hits.'),
(10, 'Rough Skin', 'Contact with the Pokémon may cause the attacker to cringe.'),
(11, 'Water Absorb', 'Restores HP if hit by a Water-type move, instead of taking damage.'),
(12, 'Volt Absorb', 'Restores HP if hit by an Electric-type move, instead of taking damage.'),
(13, 'Flame Body', 'Contact with the Pokémon may burn the attacker.'),
(14, 'Rock Head', 'Protects the Pokémon from recoil damage.'),
(15, 'Sturdy', 'It cannot be knocked out with one hit.');

INSERT INTO card (card_id, name, description, hp, type, element_type, energy_type, energy_cost, ability_id) VALUES
(1, 'Pikachu', 'A cute and electrifying Pokemon.', 60, 'Pokemon', 'Electric', 'Electric', 1, 1),
(2, 'Charizard', 'A powerful fire-breathing dragon.', 120, 'Pokemon', 'Fire', 'Fire', 3, 2),
(3, 'Bulbasaur', 'A grass/poison-type Pokemon.', 45, 'Pokemon', 'Grass', 'Grass', 1, 3),
(4, 'Squirtle', 'A water-type turtle Pokemon.', 44, 'Pokemon', 'Water', 'Water', 1, 4),
(5, 'Trainer Red', 'Legendary trainer known for his powerful Pokemon.', 0, 'Trainer', NULL, NULL, 0, NULL),
(6, 'Trainer Green', 'A skilled trainer specializing in grass-type Pokemon.', 0, 'Trainer', NULL, NULL, 0, NULL),
(7, 'Trainer Blue', 'A strategic trainer with a diverse team of Pokemon.', 0, 'Trainer', NULL, NULL, 0, NULL),
(8, 'Energy: Electric', 'Provides electric energy for electric-type Pokemon.', 0, 'Energy', 'Electric', 'Electric', 0, NULL),
(9, 'Energy: Fire', 'Provides fire energy for fire-type Pokemon.', 0, 'Energy', 'Fire', 'Fire', 0, NULL),
(10, 'Energy: Grass', 'Provides grass energy for grass-type Pokemon.', 0, 'Energy', 'Grass', 'Grass', 0, NULL),
(11, 'Energy: Water', 'Provides water energy for water-type Pokemon.', 0, 'Energy', 'Water', 'Water', 0, NULL),
(12, 'Jolteon', 'A lightning-fast electric-type Pokemon.', 65, 'Pokemon', 'Electric', 'Electric', 1, 5),
(13, 'Blastoise', 'The evolved form of Squirtle, a powerful water-type Pokemon.', 79, 'Pokemon', 'Water', 'Water', 3, 6),
(14, 'Ivysaur', 'The evolved form of Bulbasaur, a dual grass/poison-type Pokemon.', 60, 'Pokemon', 'Grass', 'Grass', 2, 7),
(15, 'Charmander', 'A fire-type lizard Pokemon.', 39, 'Pokemon', 'Fire', 'Fire', 1, 8);

INSERT INTO player (player_id, username, email, password, wins, loses) VALUES
(1, 'AshKetchum', 'ash@example.com', 'Pikachu123', 25, 10),
(2, 'MistyWaterflower', 'misty@example.com', 'Starmie456', 20, 15),
(3, 'BrockRock', 'brock@example.com', 'Geodude789', 18, 20),
(4, 'GaryOak', 'gary@example.com', 'Eevee234', 30, 5),
(5, 'Serena', 'serena@example.com', 'Fennekin567', 22, 12),
(6, 'MayMaple', 'may@example.com', 'Torchic890', 28, 8),
(7, 'Dawn', 'dawn@example.com', 'Piplup123', 26, 10),
(8, 'Cynthia', 'cynthia@example.com', 'Garchomp456', 35, 2),
(9, 'Steven', 'steven@example.com', 'Metagross789', 40, 1),
(10, 'N', 'n@example.com', 'Reshiram123', 27, 9),
(11, 'Giovanni', 'giovanni@example.com', 'Persian456', 33, 6),
(12, 'Lance', 'lance@example.com', 'Dragonite789', 38, 3),
(13, 'Wallace', 'wallace@example.com', 'Milotic123', 29, 7),
(14, 'Alder', 'alder@example.com', 'Volcarona456', 31, 4),
(15, 'Diantha', 'diantha@example.com', 'Gardevoir789', 36, 2);

INSERT INTO deck (deck_id, name, description, player_id) VALUES
(1, 'Electric Shock', 'A deck full of powerful electric-type Pokemon.', 1),
(2, 'Fiery Inferno', 'A deck focused on burning opponents with fire-type Pokemon.', 2),
(3, 'Grassy Greens', 'A deck featuring grass-type Pokemon with strong defensive capabilities.', 3),
(4, 'Aquatic Assault', 'A deck comprising water-type Pokemon known for their versatility.', 4),
(5, 'Psychic Powers', 'A deck utilizing psychic-type Pokemon to control the battlefield.', 5),
(6, 'Rock Solid', 'A deck built around rock-type Pokemon known for their durability.', 6),
(7, 'Flying High', 'A deck filled with flying-type Pokemon capable of swift aerial attacks.', 7),
(8, 'Dragons Fury', 'A deck featuring powerful dragon-type Pokemon with devastating attacks.', 8),
(9, 'Dark Shadows', 'A deck comprising dark-type Pokemon adept at disrupting opponent strategies.', 9),
(10, 'Mystic Waters', 'A deck combining water and psychic-type Pokemon for mystical battles.', 10),
(11, 'Legendary Beasts', 'A deck showcasing legendary Pokemon with unmatched power.', 11),
(12, 'Eternal Flames', 'A deck burning with the power of fire-type Pokemon.', 12),
(13, 'Frostbite', 'A deck featuring ice-type Pokemon capable of freezing opponents solid.', 13),
(14, 'Natures Wrath', 'A deck harnessing the power of grass-type Pokemon to overwhelm opponents.', 14),
(15, 'Steel Defense', 'A deck built around steel-type Pokemon known for their resilience.', 15);

INSERT INTO inventory_card (inventory_card_id, card_id, player_id) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 2),
(6, 6, 2),
(7, 7, 2),
(8, 8, 2),
(9, 9, 3),
(10, 10, 3),
(11, 11, 3),
(12, 12, 3),
(13, 13, 4),
(14, 14, 4),
(15, 15, 4);

INSERT INTO deck_card (deck_card_id, quantity, card_id, deck_id) VALUES
(1, 2, 1, 1),
(2, 3, 2, 1),
(3, 4, 3, 1),
(4, 2, 4, 1),
(5, 2, 5, 2),
(6, 3, 6, 2),
(7, 4, 7, 2),
(8, 2, 8, 2),
(9, 2, 9, 3),
(10, 3, 10, 3),
(11, 4, 11, 3),
(12, 2, 12, 3),
(13, 2, 13, 4),
(14, 3, 14, 4),
(15, 4, 15, 4);

INSERT INTO game (game_id, duration, player1_id, player2_id, winner_id) VALUES
(1, 20, 1, 2, 1),
(2, 25, 3, 4, 4),
(3, 18, 5, 6, 6),
(4, 22, 7, 8, 7),
(5, 30, 9, 10, 10),
(6, 28, 11, 12, 11),
(7, 24, 13, 14, 14),
(8, 21, 15, 1, 15),
(9, 19, 2, 3, 2),
(10, 23, 4, 5, 4),
(11, 27, 6, 7, 6),
(12, 29, 8, 9, 8),
(13, 26, 10, 11, 11),
(14, 18, 12, 13, 12),
(15, 20, 14, 15, 14);

INSERT INTO turn (turn_id, game_id, player_id, turn_number, phase) VALUES
(1, 1, 1, 1, 'draw'),
(2, 1, 2, 1, 'draw'),
(3, 1, 1, 2, 'invoke'),
(4, 1, 2, 2, 'invoke'),
(5, 1, 1, 3, 'attack'),
(6, 1, 2, 3, 'attack'),
(7, 2, 3, 1, 'draw'),
(8, 2, 4, 1, 'draw'),
(9, 2, 3, 2, 'invoke'),
(10, 2, 4, 2, 'invoke'),
(11, 2, 3, 3, 'attack'),
(12, 2, 4, 3, 'attack'),
(13, 3, 5, 1, 'draw'),
(14, 3, 6, 1, 'draw'),
(15, 3, 5, 2, 'invoke');

INSERT INTO game_action (game_action_id, game_id, player_id, card_id, action_type, turn_id) VALUES
(1, 1, 1, 1, 'invoke', 1),
(2, 2, 3, 9, 'invoke', 7),
(3, 3, 5, 12, 'invoke', 13),
(4, 1, 2, 5, 'attack', 3),
(5, 2, 4, 2, 'attack', 9),
(6, 3, 6, 7, 'attack', 15),
(7, 1, 1, 1, 'use effect', 5),
(8, 2, 3, 11, 'use effect', 11),
(9, 3, 5, 11, 'use effect', 11);

INSERT INTO game_card (game_card_id, player_id, game_id, card_id, status, position, instance_count) VALUES
(1, 1, 1, 1, 'deck', 1, 1),
(2, 1, 1, 2, 'deck', 2, 1),
(3, 1, 1, 3, 'deck', 3, 1),
(4, 1, 1, 4, 'deck', 4, 1),
(5, 1, 1, 5, 'hand', 1, 1),
(6, 1, 1, 6, 'hand', 2, 1),
(7, 1, 1, 7, 'bench', 1, 1),
(8, 1, 1, 8, 'bench', 2, 1),
(9, 1, 1, 9, 'board', 1, 1),
(10, 1, 1, 10, 'discard_pile', 1, 1),
(11, 1, 1, 11, 'prize_pile', 1, 1),
(12, 2, 2, 1, 'deck', 1, 1),
(13, 2, 2, 2, 'deck', 2, 1),
(14, 2, 2, 3, 'deck', 3, 1),
(15, 2, 2, 4, 'deck', 4, 1);

INSERT INTO effect (effect_id, name, description, is_attack, damage) VALUES
(1, 'Thunderbolt', 'A powerful electric-type attack that can paralyze opponents.', TRUE, 90),
(2, 'Fire Blast', 'A devastating fire-type attack that can burn opponents.', TRUE, 110),
(3, 'Razor Leaf', 'A grass-type attack that slashes opponents with razor-sharp leaves.', TRUE, 55),
(4, 'Water Gun', 'A basic water-type attack that shoots high-pressure water at opponents.', TRUE, 40),
(5, 'Psychic', 'A psychic-type attack that uses telekinesis to damage opponents.', TRUE, 90),
(6, 'Earthquake', 'A ground-type attack that shakes the ground, damaging all opponents.', TRUE, 100),
(7, 'Dragon Claw', 'A dragon-type attack that slashes opponents with razor-sharp claws.', TRUE, 80),
(8, 'Ice Beam', 'A freezing ice-type attack that can freeze opponents solid.', TRUE, 95),
(9, 'Hyper Beam', 'A powerful normal-type attack that requires recharging after use.', TRUE, 150),
(10, 'Shadow Ball', 'A ghost-type attack that hurls a shadowy blob at opponents.', TRUE, 80),
(11, 'Giga Impact', 'A powerful normal-type attack that requires recharging after use.', TRUE, 150),
(12, 'Thunder Punch', 'An electric-type punch that has a chance to paralyze opponents.', TRUE, 75),
(13, 'Flamethrower', 'A fire-type attack that unleashes a stream of flames at opponents.', TRUE, 90),
(14, 'Solar Beam', 'A grass-type attack that harnesses solar energy to deal massive damage.', TRUE, 120),
(15, 'Hydro Pump', 'A powerful water-type attack that shoots a high-pressure stream of water.', TRUE, 110);

INSERT INTO card_effect (card_effect_id, card_id, effect_id) VALUES
(1, 1, 5),
(2, 2, 9),
(3, 3, 14),
(4, 4, 1),
(5, 5, 8),
(6, 6, 12),
(7, 7, 6),
(8, 8, 11),
(9, 9, 3),
(10, 10, 10),
(11, 11, 7),
(12, 12, 2),
(13, 13, 15),
(14, 14, 4),
(15, 15, 13);



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
SET autocommit=@old_autocommit;