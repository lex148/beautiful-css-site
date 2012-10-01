require 'sinatra'
require 'json'
require 'coffee-script'
require 'sass/plugin/rack'

class App < Sinatra::Base

  Sass::Plugin.options[:template_location] = 'public/stylesheets'
  use Sass::Plugin::Rack

  before do
    headers "X-UA-Compatible" => "IE=edge,chrome=IE8"
  end

  get '/' do
    File.read(File.join('public', 'index.html'))
  end

end
