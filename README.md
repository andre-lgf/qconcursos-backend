# README

- **Ruby** 2.7.1

### PROJECT DESCRIPTION
- This project implements a Ruby on Rails API that returns information about most accessed questions and disciplines.

### Installing and Using
- This project uses docker and docker-compose to unify all dependencies. To set up, run:
```bash
  docker-compose up --build
```

- Commands in general can be run inside containers with ```docker-compose run --rm api [COMMAND]``` or via a local terminal where the containers are running.


### Testing
- The test suite uses RSpec for testing. To run tests, use ```docker-compose run --rm api rspec```

### Dependencies
- This project uses Redis for caching and PostgreSQL as Database.
