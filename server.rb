require 'sinatra'
require 'json'
require 'coffee-script'
require 'sass/plugin/rack'
require 'beautiful-css'

class App < Sinatra::Base

  Sass::Plugin.options[:template_location] = 'public/stylesheets'
  use Sass::Plugin::Rack

  before do
    headers "X-UA-Compatible" => "IE=edge,chrome=IE8"
  end

  get '/' do
    File.read(File.join('public', 'index.html'))
  end

  post '/' do
    begin
      BeautifulCss::Engine.new(params[:css]).render
    rescue
      nil
    end
  end

  get '/application.js' do
    coffee :application
  end

end
