#  Adding Stripe Payments to your Ruby on Rails Application

For each chapter, any links mentioned or notes will be included below in the appropriate sections.

## 1.1 What we'll be covering

* Stripe - https://stripe.com
* Stripe Subscriptions - https://stripe.com/subscriptions
* Stripe.js - https://stripe.com/docs/custom-form
* Stripe Ruby - https://stripe.com/docs/libraries#ruby-library

## 1.2 Requirements

We're using Ruby 2.3.1 and Rails 5.0.0.1 in this course. If you don't have a recent version of Ruby (2.2+) or Rails (4.2+), you can follow the guides here:

* macOS / OS X - https://gorails.com/setup/osx
* Ubuntu Linux - https://gorails.com/setup/ubuntu
* Windows - https://gorails.com/setup/windows or http://railsinstaller.org

We're also using Bootstrap v3.3.7 which you can find documentation for at http://getbootstrap.com


## 2.1 Adding products

```
# Generate a new Rails application named store
rails new store

# Create the database model named Product and all the views associated with it
rails g scaffold Product name description:text secret:text

# Remove the default scaffold stylesheet
rm app/assets/styles/scaffolds.scss
```

## 2.2 Creating Users

* Devise - https://github.com/plataformatec/devise

```
# Install the devise gem
bundle

# Install devise into our app
rails g devise:install

# Install the devise views
rails g devise:views

# Create a User model with Devise with Stripe details
rails g devise User stripe_id stripe_subscription_id card_brand card_last4 card_exp_month card_exp_year expires_at:datetime
```

## 2.3 Adding Bootstrap

To grab specific versions of gems, go to [Rubygems.org](https://rubygems.org). It's always good to use specific versions of gems so that major updates don't break your Rails app.

* bootstrap-sass gem - https://github.com/twbs/bootstrap-sass

```
# Install the bootstrap-sass gem after adding it to the Gemfile
bundle install

# Change the extension of our application.css file to support the scss format
mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss
```

Bootstrap example navigation:
**app/views/layouts/application.html.erb**

```
    <nav class="navbar navbar-default">
      <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Store</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav">
            <li><%= link_to "Products", products_path %></li>
          </ul>

          <ul class="nav navbar-nav navbar-right">
            <% if user_signed_in? %>
              <li><%= link_to "Account", edit_user_registration_path %></li>
              <li><%= link_to "Log out", destroy_user_session_path, method: :delete %></li>
            <% else %>
              <li><%= link_to "Sign up", new_user_registration_path %></li>
              <li><%= link_to "Login", new_user_session_path %></li>
            <% end %>
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>
```

## 3.1 Signing up for Stripe

You can find both your test and live keys for Stripe here: https://dashboard.stripe.com/account/apikeys

Copy the test keys into your config/secrets.yml file.

**Note:** Use your own keys for this part. The keys you see in the video will no longer work because they have been changed.

## 3.2 Adding a new subscription page