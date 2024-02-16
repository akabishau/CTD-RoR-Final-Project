## Description

This project is the final assignment for my Ruby on Rails class with [Code the Dream](https://codethedream.org/about/), a non-profit organization that provides tech education to people from diverse backgrounds.

The goal of this project is to apply the concepts and skills learned throughout [Ruby on Rails course curriculum](https://learn.codethedream.org/firefish-ruby-rails/). Throughout the development process, I've incorporated a range of Ruby on Rails concepts and technologies, including MVC architecture, DRY priciple, database migrations, and unit testing.

### What's This App For?
Bookscape is a web-based application designed to help users discover, track, and interact with books they're interested in. Leveraging the Google Books API, it allows users to:

- **Search for Books**: Users can find books based on titles, authors, or genres, accessing a vast database of literary works.
- **View Book Details**: For each book, users can view comprehensive information, including title, author, description, and cover image, to make informed decisions about their reading choices.
- **Track Reading Progress**: Users can maintain a personal reading list, categorizing books into different statuses such as "Want to Read", "Currently Reading", and "Read".
- **Interact with Books** (currently under development): Upon marking a book as "Read", users can:
  - **Add Comments**: Users can share their thoughts and insights about the book, creating a community of discussions.
  - **Set Ratings**: Users can rate books on a predefined scale, contributing to a community-driven rating system.
  - **Answer Predefined Questions**: Users can respond to a set of questions about the book, designed to encourage deeper reflection and discussion on the content and themes.
- **Reading Goal**: Users can set the goal for a year and app will track and the progress

## Local Development Environment Setup
To get started, clone the repository to your local machine, and run `bundle install` to install dependencies. Then, create and migrate the database with `rails db:create` and `rails db:migrate`. Finally, start the project with `rails server`.

### Database Setup
Bookscape uses PostgreSQL as its database. Before running the application, ensure you have PostgreSQL installed and running on your local system. If it's not installed, download and install it from the official [PostgreSQL website](https://www.postgresql.org/download/) or use a package manager. Here are macOS instructions:
- Install PostgreSQL: `brew install postgresql`
- Start the PostgreSQL Service: `brew services start postgresql`
- Access PostgreSQL: `psql postgres`
- Create a User with CREATEDB Role: `CREATE USER your_username WITH PASSWORD 'your_secure_password' CREATEDB;` (`\q` for exit PostgreSQL)
- Set Environment Variables in .env file:
```
BOOKSCAPE_DATABASE_USERNAME=your_username
BOOKSCAPE_DATABASE_PASSWORD=your_secure_password
```
- Navigate to the root directory of your Rails project and run: `bin/rails db:create db:migrate`
- This will create your development and test databases based on the configuration specified in config/database.yml and then migrate the database schema.

### API Setup
This application uses Google Books API. To run the application locally, you'll need to obtain your Google Books API key. Once you have this, add it to the .env file in the root of the project: `GOOGLE_BOOKS_API_KEY=your_google_books_api_key`


## Technologies Used

The development of Bookscape involved a comprehensive stack of technologies, frameworks, and practices focused on delivering a robust and scalable web application:

| Category              | Technology                                                                                             | Description                                                                                                                                                            |
|-----------------------|--------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Backend Framework     | [Ruby on Rails](https://rubyonrails.org/)                                                              | A comprehensive web-application framework that follows the Model-View-Controller (MVC) architecture, facilitating database-backed applications with clean and maintainable code. |
| Frontend              | [HTML](https://developer.mozilla.org/en-US/docs/Web/HTML), [CSS](https://developer.mozilla.org/en-US/docs/Web/CSS), [Sass](https://sass-lang.com/), React (future update) | Technologies used for structuring and styling the application's user interface, with Sass enabling more complex styles with variables, mixins, and nested rules.        |
| API Integration       | [Google Books API](https://developers.google.com/books)                                                | Fetches book data to allow users to search for and view detailed information about books, integrating external data sources seamlessly into the application.             |
| Database              | [PostgreSQL](https://www.postgresql.org/)                                                              | An advanced open-source relational database, chosen for its performance, extensibility, and compliance with SQL standards, serving as the application's data store.     |
| Authentication        | [Devise](https://github.com/heartcombo/devise)                                                         | A versatile authentication solution for Rails applications, offering secure sign-in, user management, and more, based on Warden.                                         |
| Testing Framework     | [RSpec](https://rspec.info/)                                                                           | The preferred Behaviour-Driven Development (BDD) framework for Ruby, utilized for writing and executing tests to ensure application reliability and maintain code quality. |
| Code Quality Tools    | [RuboCop](https://rubocop.org/), [Solargraph](https://solargraph.org/)                                 | RuboCop for enforcing Ruby coding standards and best practices, alongside Solargraph for providing real-time code analysis and insights to maintain high code quality.   |

## Project Architecture

### Key Components

- `Book` and `UserBook` Models: The `Book` model represents books in the application, while the `UserBook` model represents the association between users and books. They are central to the application's functionality.

- Service Classes: The application uses several service classes to encapsulate complex business logic:
  - `GoogleApiService`: Interacts with the Google Books API to fetch book information.
  - `GoogleApiParserService`: Parses the data received from the Google Books API.
  - `CacheService`: Caches search results from the Google Books API to improve performance and reduce the number of API calls.
  - `BookService` and `UserBookService`: Handle business logic related to books and user-book associations, respectively.

## Data Flow

1. When a user searches for a book, the application makes a request to the Google Books API using the `GoogleApiService`.
2. The data received from the Google Books API is parsed by the `GoogleApiParserService` and then cached using the `CacheService`.
3. The parsed data is used to create or update `Book` and `UserBook` records in the database.
4. The `BookService` and `UserBookService` are used to interact with the `Book` and `UserBook` models, encapsulating the business logic related to these models.
This architecture allows the application to quickly provide book information to users while minimizing the number of calls to the Google Books API and the amount of data stored in the application's own database.
