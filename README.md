# SniffSpot

SniffSpot is a Ruby on Rails application that allows users to discover and review various spots. These spots could be anything from dog-friendly parks to cozy cafes. Users can leave reviews, rate spots, and provide descriptions, making it a valuable platform for sharing and exploring different places.

## Table of Contents

- [Ruby and Rails Versions](#ruby-and-rails-versions)
- [Getting Started](#getting-started)
- - [Prerequisites](#prerequisites)
- - [Installation](#installation)
- - [Setup](#setup)
- - [Running the Server](#running-the-server)
- [Database Schema](#database-schema)
- [Features](#features)
- - [Spots](#spots)
- - [Reviews](#reviews)

## Ruby and Rails Versions

- Rails Version: 7.0.4.2
- Ruby Version: 3.2.1

## Getting Started

### Prerequisites

Before you begin, make sure you have the following installed:

- Ruby 3.2.1
- Ruby on Rails 7.0.4.2
- Bundler (install using `gem install bundler` if not already installed)

### Installation

1. Clone the repository:

git clone https://github.com/zumair12/sniff_spot.git


2. Navigate to the project directory:

cd sniffspot

### Setup

To get started with SniffSpot, follow these steps:

1. Install all the required gems by running:

bundle install

2. Setup the database:

bin/rails db:setup

### Running the Server

bin/rails s


## Database Schema

The application's database schema consists of two main tables: `spots` and `reviews`.

### Spots Table

- `title`: The title of the spot.
- `description`: A description of the spot.
- `price`: The price of the spot.
- `created_at`: The creation date of the spot.
- `updated_at`: The last update date of the spot.

### Reviews Table

- `spot_id`: Foreign key linking the review to a specific spot.
- `rating`: The rating given to the spot.
- `comment`: A comment or review text.
- `created_at`: The creation date of the review.
- `updated_at`: The last update date of the review.

## Features

### Spots

Spots represent various places that users can review and rate. Each spot includes a title, description, and price information.

### Reviews

Users can leave reviews for spots, providing ratings and comments based on their experiences. These reviews help other users make informed decisions.
