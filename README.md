# The Gossip Project - Sinatra

A lightweight, RESTful web application for managing and sharing gossips/rumors. Built with Sinatra, this project demonstrates core web development concepts including MVC architecture, form handling, and persistent data storage.

## Features

- Create new gossips with author name and content
- View all gossips in a list format
- View individual gossip details
- Edit existing gossips
- Persistent storage using CSV database
- Clean, intuitive web interface

## Technology Stack

- **Framework**: Sinatra (lightweight Ruby web framework)
- **Language**: Ruby 3.4.2
- **Database**: CSV (simple file-based storage)
- **Server**: Puma
- **Testing**: RSpec
- **Development Tools**: Pry, Rubocop, Rerun

## Project Structure

```
the-gossip-project-sinatra-THP/
├── config.ru                 # Rack configuration file
├── Gemfile                   # Ruby dependencies
├── README.md                 # This file
├── db/
│   └── gossip.csv           # CSV database file storing gossips
├── lib/
│   └── app/
│       ├── controller.rb     # Application routes and request handlers
│       ├── gossip.rb         # Gossip model with CRUD operations
│       └── views/
│           ├── index.erb     # Gossips list page
│           ├── new_gossip.erb # Create new gossip form
│           ├── show.erb      # Individual gossip view
│           └── edit.erb      # Edit gossip form
└── spec/
    └── spec_helper.rb        # RSpec configuration
```

## Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd the-gossip-project-sinatra-THP
   ```

2. Install Ruby dependencies:
   ```bash
   bundle install
   ```

3. Create the database file (if it doesn't exist):
   ```bash
   touch db/gossip.csv
   ```

## Usage

1. Start the development server:
   ```bash
   bundle exec rackup
   ```

2. Open your browser and navigate to:
   ```
   http://localhost:9292
   ```

3. Use the web interface to:
   - View all gossips on the homepage
   - Click "New Gossip" to create a new entry
   - Click on a gossip to view full details
   - Click "Edit" to modify an existing gossip

## Application Routes

| Method | Route | Description |
|--------|-------|-------------|
| GET | `/` | Display all gossips |
| GET | `/gossips/new/` | Show create gossip form |
| POST | `/gossips/new/` | Save new gossip to database |
| GET | `/gossips/:id/` | Display single gossip details |
| GET | `/gossips/:id/edit/` | Show edit form for gossip |
| POST | `/gossips/:id/edit/` | Update gossip in database |

## Data Model

### Gossip

The Gossip model handles all data operations with the following attributes:

- **author** (string): Name of the person sharing the gossip
- **content** (string): The gossip message

### Available Methods

- `Gossip.new(author, content)` - Create a new gossip instance
- `#save` - Persist gossip to CSV database
- `Gossip.all` - Retrieve all gossips
- `Gossip.find(id)` - Retrieve a specific gossip by index
- `Gossip.update(id, author, content)` - Update an existing gossip

## Development

Run the application with auto-reload on file changes:
```bash
bundle exec rerun 'bundle exec rackup'
```

Run tests:
```bash
bundle exec rspec
```

Lint code with Rubocop:
```bash
bundle exec rubocop
```

Debug with Pry:
```ruby
binding.pry  # Add this line in your code to set a breakpoint
```

## Dependencies

See [Gemfile](Gemfile) for complete list:

- **sinatra**: Web framework
- **puma**: Application server
- **rackup**: Rack server runner
- **csv**: CSV file parsing and writing
- **rspec**: Testing framework
- **rubocop**: Ruby linter and code formatter
- **pry**: Interactive debugger
- **rerun**: Auto-restart server on file changes

## Notes

- This project uses CSV for simple data persistence. For production applications, consider using a proper database (PostgreSQL, SQLite, etc.)
- Gossip IDs are determined by their position in the CSV file (0-indexed)
- The application stores gossips in the order they are created

## License

This project is part of The Hacking Project curriculum.