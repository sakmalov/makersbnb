require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
# Active Record
require 'sinatra/activerecord'
require 'active_record'
require_relative './models/listing.rb'

class MakersBnB < Sinatra::Base
  register Sinatra::Reloader
  register Sinatra::Flash
  register Sinatra::ActiveRecordExtension
  enable :sessions
  set :public_folder, File.dirname(__FILE__) + '/public'

  get '/' do

    erb :index
  end

  # enable :method_override
end
