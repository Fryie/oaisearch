# OAI Search Interface
This is a simple proof-of-concept web interface for an [*elasticsearch*](http://www.elasticsearch.org) database of OAI (Open Archives Initiative) publication data.

It requires that elasticsearch be running on localhost and listening on port 9200.

## Running the app
Requirements: Ruby (1.9, probably) and Rubygems.

```bash
bundle #install gems
ruby app.rb
```

## TODO
* Improve design and usability
* Fix encoding problems
* Search for several fields at once
* Support phrasal queries
* Make app more flexible (allow other elasticsearch data sources)
* ...
