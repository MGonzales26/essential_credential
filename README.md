# Essential Credential

Essential Credential is a Ruby on Rails document management application that tracks expiration dates of essential documents.

## Getting Started

### Schema

The relationships of the Locations, Clinicians and their documents.

<img width="1211" alt="db schema" src="https://user-images.githubusercontent.com/62969459/127913386-1069b43f-a66f-4f11-a04f-0443f885b032.png">

### Prerequisites

Essential Credential uses `ruby 2.5.3` and `rails 6.0.3` 

Fork this repo and clone it to your local machine.

### Installing

1. Run bundle.

```
bundle install
```

2. Setup the database.

```
rails db:{create,migrate}
```
Essential Credential also has database seed data. If you wish you can also run:

```
rails db:seed
```

3. Launch a Rails server.
```
rails s
```

4. In your local browser navigate to `localhost:3000`. The welcome page should be displayed. From the welcome page you can manage locations or clinicians.

<img width="1339" alt="Welcome page" src="https://user-images.githubusercontent.com/62969459/127915338-672fba86-6c3e-4506-82ac-a37d9a08eadf.png">

<img width="1433" alt="Locations page" src="https://user-images.githubusercontent.com/62969459/127915367-7d297142-6b79-4db7-bdd3-50bc987d78ab.png">

<img width="1438" alt="Clinicians page" src="https://user-images.githubusercontent.com/62969459/127915536-dfddddef-d3b3-4ad1-ad52-c6024c5fb485.png">

<img width="1428" alt="Documents page" src="https://user-images.githubusercontent.com/62969459/127915601-b9b20ad6-01c7-41cb-8567-82ae2b7d7540.png">

## Running the tests

Essential Credintial was developed entirely with TDD. Rspec is the testing suite and simplecov provides the test coverage.

To run the test suite simply run:

```
bundle exec rspec
```

All tests should pass and coverage should be 100%.

## Versioning

Future versions of Essential Credential will allow you create and delete all data, as well as list all documents that are expiring soon.

## Authors

* **Megan Gonzales** 
-[linkedin](https://www.linkedin.com/in/megan-e-gonzales/) 
-[github](https://github.com/MGonzales26)
