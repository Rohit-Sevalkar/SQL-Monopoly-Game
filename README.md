# SQL-Monopoly-Game

## Project Overview
This project involves modeling a simplified version of Monopoly using a relational database managed through SQLite. The objective is to simulate the gameplay dynamics through structured SQL queries, capturing various game states and player interactions. The deliverables include SQL code to create and manage the database, a video explaining the design and functionality, and multiple SQL scripts simulating specific gameplay scenarios.

## Project Details
- **Deliverables**:
  - `create.sql`: SQL script for creating the database schema.
  - `populate.sql`: SQL script for populating the database with initial game state.
  - `q1.sql` to `q8.sql`: SQL scripts for simulating gameplay rounds.
  - `view.sql`: SQL view script for displaying current game status.

## Project Requirements
1. **Database Compatibility**: Must be compatible with SQLite.
2. **Game Entities**:
   - Up to six players with unique tokens (dog, car, battleship, top hat, thimble, boot).
   - Properties, bonuses, and other game locations such as Chance, Community Chest, and corners.
3. **Functionality**:
   - Tracking player positions, properties owned, and bank balances.
   - Simulating transactions like rent payments and bonuses.
   - Maintaining an audit trail for gameplay analysis.
4. **Special Considerations**:
   - SQLite's limitations regarding stored procedures must be considered in the database design.
   - Creative and efficient SQL querying is encouraged to simulate complex game dynamics.

## Scenario and Initial State
Players begin with predefined tokens and locations. The properties and their respective costs, along with initial bonuses, are pre-set in the database. The game progresses with specific rules where players interact with properties, other players, and game triggers like 'Go to Jail'.

## Gameplay Rules
- Property transactions, rent calculations, jail mechanics, passing 'GO', and more.
- Special game conditions for dice rolls and player movements.

## Schema and ER Diagram
Details of the relational schema and ER diagram are included in the attached files, explaining the design choices and database structure tailored for simulating Monopoly.

## Installation & Usage

### Requirements:
- SQLite
- Any SQL-compatible IDE or command-line tool to run SQL scripts.
