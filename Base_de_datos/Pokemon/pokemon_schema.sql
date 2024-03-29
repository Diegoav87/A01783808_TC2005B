SET NAMES utf8mb4;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS pokemon;
CREATE SCHEMA pokemon;
USE pokemon;

CREATE TABLE card (
	card_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    hp INT UNSIGNED NOT NULL,
    type ENUM('Pokemon', 'Trainer', 'Energy') NOT NULL,
    element_type VARCHAR(50),
    energy_type VARCHAR(50),
    energy_cost INT UNSIGNED,
    ability_id SMALLINT UNSIGNED,
    
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (card_id),
    CONSTRAINT fk_card_ability FOREIGN KEY (ability_id) REFERENCES ability (ability_id) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE ability (
	ability_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
	
    
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (ability_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE player (
  player_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  wins INT UNSIGNED NOT NULL DEFAULT 0,
  loses INT UNSIGNED NOT NULL DEFAULT 0,
  
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (player_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE deck (
  deck_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  player_id SMALLINT UNSIGNED NOT NULL,
  
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (deck_id),
  CONSTRAINT fk_deck_player FOREIGN KEY (player_id) REFERENCES player (player_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE inventory_card (
  inventory_card_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  card_id SMALLINT UNSIGNED NOT NULL,
  player_id SMALLINT UNSIGNED NOT NULL,
  
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (inventory_card_id),
  CONSTRAINT fk_inventory_card_card FOREIGN KEY (card_id) REFERENCES card (card_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_inventory_card_player FOREIGN KEY (player_id) REFERENCES player (player_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE deck_card (
  deck_card_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  quantity SMALLINT UNSIGNED NOT NULL DEFAULT 1,
  card_id SMALLINT UNSIGNED NOT NULL,
  deck_id SMALLINT UNSIGNED NOT NULL,
  
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (deck_card_id),
  CONSTRAINT fk_deck_card_card FOREIGN KEY (card_id) REFERENCES card (card_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_deck_card_deck FOREIGN KEY (deck_id) REFERENCES deck (deck_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE game (
  game_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  duration INT UNSIGNED NOT NULL,
  player1_id SMALLINT UNSIGNED NOT NULL,
  player2_id SMALLINT UNSIGNED NOT NULL,
  winner_id SMALLINT UNSIGNED NOT NULL,
  
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (game_id),
  CONSTRAINT fk_game_player1 FOREIGN KEY (player1_id) REFERENCES player (player_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_game_player2 FOREIGN KEY (player2_id) REFERENCES player (player_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_game_winner FOREIGN KEY (winner_id) REFERENCES player (player_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE turn (
  turn_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  game_id SMALLINT UNSIGNED NOT NULL,
  player_id SMALLINT UNSIGNED NOT NULL,
  turn_number INT UNSIGNED NOT NULL,
  phase ENUM('draw', 'invoke', 'attack') DEFAULT 'draw' NOT NULL,
  
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  
  PRIMARY KEY (turn_id),
  CONSTRAINT fk_turn_game FOREIGN KEY (game_id) REFERENCES game (game_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_turn_player FOREIGN KEY (player_id) REFERENCES player (player_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE game_action (
  game_action_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  game_id SMALLINT UNSIGNED NOT NULL,
  player_id SMALLINT UNSIGNED NOT NULL,
  card_id SMALLINT UNSIGNED NOT NULL,
  action_type VARCHAR(255) NOT NULL,
  turn_id SMALLINT UNSIGNED NOT NULL,
  
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  
  PRIMARY KEY (game_action_id),
  CONSTRAINT fk_game_action_game FOREIGN KEY (game_id) REFERENCES game (game_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_game_action_player FOREIGN KEY (player_id) REFERENCES player (player_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_game_action_card FOREIGN KEY (card_id) REFERENCES card (card_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_game_action_turn FOREIGN KEY (turn_id) REFERENCES turn (turn_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE game_card (
  game_card_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  player_id SMALLINT UNSIGNED NOT NULL,
  game_id SMALLINT UNSIGNED NOT NULL,
  card_id SMALLINT UNSIGNED NOT NULL,
  status ENUM('deck', 'hand', 'bench', 'board', 'discard_pile', 'prize_pile') NOT NULL DEFAULT 'deck',
  position INT UNSIGNED NOT NULL,
  instance_count INT UNSIGNED NOT NULL DEFAULT 1,
  
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  
  PRIMARY KEY (game_card_id),
  CONSTRAINT fk_game_card_player FOREIGN KEY (player_id) REFERENCES player (player_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_game_card_game FOREIGN KEY (game_id) REFERENCES game (game_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_game_card_card FOREIGN KEY (card_id) REFERENCES card (card_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE effect (
  effect_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  description TEXT NOT NULL,
  is_attack BOOLEAN NOT NULL,
  damage INT UNSIGNED NOT NULL,
  
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  
  PRIMARY KEY (effect_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE card_effect (
  card_effect_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  card_id SMALLINT UNSIGNED NOT NULL,
  effect_id SMALLINT UNSIGNED NOT NULL,
  
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  
  PRIMARY KEY (card_effect_id),
  CONSTRAINT fk_card_effect_card FOREIGN KEY (card_id) REFERENCES card (card_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_card_effect_effect FOREIGN KEY (effect_id) REFERENCES effect (effect_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
