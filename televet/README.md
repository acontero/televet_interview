# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* System dependencies
Must have the following installed:
- ruby `\curl -L https://get.rvm.io | bash -s stable --ruby`
- rails `gem install rails`
- mysql `brew install mysql`

* Configuration
To install the gems: `bundle`

* Database creation & initialization
  `rails db:migrate`

  For local mysql db console:
  `mysql -u root televet_development`

  If televet_development db doesn't exist, create it.
  `create database televet_development`

  Run the SQL script given for the interview assignment, slightly modified, in seeds.rb.

* To startup the server:
  `rails server` from within the televet_interview/televet dir
  Then you can go to http://localhost:3000 in your browser.

* To enter the rails console:
  `rails console` from within the televet_interview/televet dir

* Open Source Libraries Used:
  I used the gem kaminari for pagination.

* These are the available API calls:
  http://localhost:3000/pets (this will default to page 1 since this is a paginated route)
  http://localhost:3000/pets?page=1
  http://localhost:3000/pets?page=2

  The response for these will look something like this, as specified by the instructions (and not the given sample pets.json file which showed a different format):
  ```
  {
    "pets":[
      {"id":21,"name":"Aladdin","weight":"13.6","age":"02.2"},
      {"id":22,"name":"Ivor","weight":"15.8","age":"11.0"}
      ...
    ],
    "meta":{
      "last_page":false,
      "num_pages":10,
      "current_page":3,
      "page_size":10,
      "total_count":100
    }
  }
  ```

  http://localhost:3000/pets/1 (or whatever index you choose, up to 100)
  The response for this will look something like this. Since no sample payload was given, I assumed a standard json object would suffice:

  ```
  {
    "id":100,
    "name":"Xena",
    "weight":"10.0",
    "age":"04.5"
  }
  ```

  And when no record is found for a pet with the given id, this is the response, with status code 404:
  ```
  {
    "error_message":"No pet with that id was found."
  }
  ```

* How to run the test suite

* Caching
  Normally I would implement caching using the serializers but that would normally be based on a timestamp and the sql insert commands provided did not allow for timestamps.
