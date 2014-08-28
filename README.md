# BetterStrongParams

Adds a DSL to ActionController that allows to add strong params filtering without adding a specific, dirty controller method.

# DSL Changes in 0.0.3

- `whitelist_parameters` replaces `filter_parameters`
- No more `create_params` or such, filtered and whitelisted attributes are now available via the regular `params` hash.

## Why?

[Rails's Strong Parameters](http://edgeapi.rubyonrails.org/classes/ActionController/StrongParameters.html) is obviously a better approach than having the model decide which attributes are protected or not. The only problem I have with this is the need to add an ugly method (at least one) to the controller to filter and whitelist the parameters.

BetterStrongParams is simply a way to create those methods via DSL instead of a manually typing them, seems like it is a more naturally looking interface for a good idea.

## Installation

Add this line to your application's Gemfile:

    gem 'better_strong_params'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install better_strong_params

## Setting up

BetterStrongParams is automatically included in ActionController::Base, so you don't actually need to do anything to set this one up.

## Usage

BetterStrongParams allows you to use the `whitelist_parameters` method in your controllers:

```ruby
  class UsersController < ApplicationController
    whitelist_parameters post: [:title, :body], user: [:name, :age], ....
  end
```

`whitelist_parameters` a representation of a hash as you would enter in normal Strong Parameters method:

```
  top_level_key: [attribute, attribute], another_top_level: [...], ...
```

Unlike many other Strong Parameters implementations in which you would have to define a sanitizing method (`user_params`), BetterStrongParams lets you keep on using the regular `params` hash


## Full example
```ruby
  class UsersController < ApplicationController

    whitelist_parameters user: [:name, :age]

    def create
      @user = User.new(params[:user]) # => params[:user] is being whitelisted without the need to define / create the extra method.
      if @user.save
        redirect_to treasure_url
      else
        redirect_to jail_url
      end
    end
  end
```


## Contributing

1. Fork it ( http://github.com/<my-github-username>/better_strong_params/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
