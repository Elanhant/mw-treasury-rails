# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application
use Rack::Cors do
  allow do
    origins 'localhost:3000', '127.0.0.1:3000', '127.0.0.2:8000'

    resource '/plugins/', :headers => 'x-domain-token'
    resource '/plugins/*',
        :methods => [:get, :post, :put, :delete, :options],
        :headers => 'x-domain-token',
        :max_age => 600
  end

  allow do
    origins '*'
    resource '/public/*', :headers => :any, :methods => :get
  end
end