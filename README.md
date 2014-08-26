# BetterStrongParams

Adds a DSL to ActionController that allows to add strong params filtering without adding a specific, dirty controller method.

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

BetterStrongParams allows you to use the `filter_parameters` method in your controllers:

```ruby
  class UsersController < ApplicationController
    filter_parameters create: {post: [:title, :body]}, ...
  end
```

`filter_parameters` accepts an option hash specifing a method name, a _required_ parameter and a permitted parameters list like this

```
  controller_action_name: {required_param_name: [permitted1, permitted2,...]}, controller_action_name2: ....
```

for every controller action you set using `filter_parameters`, a method named `#{controller_action}_params` will be created and will be ready to use when you want it.


### Full example
```ruby
  class UsersController < ApplicationController

    filter_parameters create: {post: [:title, :body]}

    def create
      @user = User.new(create_params) # => create_params is available via BetterStrongParams and the filter_parameters DSL.
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
