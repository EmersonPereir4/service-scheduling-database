# Service Scheduling Database

This project is a relational database designed for a service scheduling system.

## Description

The system allows service providers to offer services and clients to schedule appointments, ensuring data integrity and business rules enforcement.

## Technologies

- PostgreSQL
- SQL

## 📂 Project Structure

- schema/ → database structure (tables, types, indexes)
- seeds/ → sample data
- docs/ → documentation

## How to Run

1. Run `01_types.sql`
2. Run `02_tables.sql`
3. Run `03_indexes.sql`
4. Run `seed_data.sql`

## Features

- Data integrity with foreign keys
- Business rules enforcement (no duplicate scheduling)
- Use of ENUM types
- Optimized queries with indexes

## 📚 Purpose

This project was developed for learning and portfolio purposes.
