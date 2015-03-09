# Accredible

Accredible Ruby gem. 

[![Build Status](https://travis-ci.org/Integralist/Sinderella.png?.png?branch=master)](http://travis-ci.org/deependersingla/accredible_ruby)  

[![Coverage Status](https://coveralls.io/repos/deependersingla/accredible_ruby/badge.png)](https://coveralls.io/r/deependersingla/accredible_ruby)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'accredible'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install accredible

## Usage

This is Gem for generating Accredible Certificate: https://www.accredible.com/example and adding evidence also to the project.

You will need a Accredible API key. You can get one by [signing up here](https://accredible.com/issuer/sign_up).

```ruby
require 'accredible'
Accredible.api_key = 'YOUR_API_KEY'
```


```rails
#Add api key to config/application.rb
Accredible.api_key = 'YOUR_API_KEY'
```

### Example
```ruby
1.) # Add a url based evidence to the user certificate
 params = {email: "user_email", achievement_id: "course_achievement_id", url: "url of evidence", description: "description of evidence"}
 #find course achievement_id from your Accredible dashboard.
 #url can be anything which is available on cloud including files stored on #s3. 
 example params= {email: "deepender281190@gmail.com", achievement_id: "examplecourse1", url: "www.accredible.com", description: "example description"}
 
 Accredible::Evidence.add_url_evidence(params)

2.) # Add a local file as evidence
params = {email: "user_email", achievement_id: "course_achievement_id", file: "location_of_file", description: "description of evidence"}
#location of file for ex: /user/var/example_pdf.pdf
example: params= {email: "deepender281190@gmail.com", achievement_id: "examplecourse1", file: "localfile.pdf", description: "example description"}

Accredible::Evidence.add_local_file(params)
```

### Notes
1) Failed requests (such as the ones requesting non-existent entities) will throw `Accredible::AccredibleError`.

2) We recommened to run actions as backgroung jobs, so that user don't have to wait. 

## Contributing

1. Fork it ( https://github.com/[my-github-username]/accredible/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
