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

### Example
```ruby
1.) # Add a url based evidence to the user certificate
 params = {email: "user_email", achievement_id: "course_achievement_id", url: "www.google.com", description: "description of evidence"}
 Accredible::Evidence.add_url_evidence(params)
```

### Notes
Failed requests (such as the ones requesting non-existent entities) will throw `Accredible::AccredibleError`.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/accredible/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
