require 'bundler'
Bundler.require
Dir[File.join(File.dirname(__FILE__), 'models', '*.rb')].each { |file| require file }
require_relative 'helpers/data_mapper'
require_relative 'helpers/warden'
require 'pry'






class SlowFood < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  register Sinatra::Warden
  set :session_secret, "supersecret"

  #binding.pry
  #Create a test User
  if User.count == 0
   @user = User.create(username: "admin")
   @user.password = "admin"
   @user.save
  end

  use Warden::Manager do |config|
    # Tell Warden how to save our User info into a session.
    # Sessions can only take strings, not Ruby code, we'll store
    # the User's `id`
    config.serialize_into_session { |user| user.id }
    # Now tell Warden how to take what we've stored in the session
    # and get a User from that information.
    config.serialize_from_session { |id| User.get(id) }

    config.scope_defaults :default,
                          # "strategies" is an array of named methods with which to
                          # attempt authentication. We have to define this later.
                          strategies: [:password],
                          # The action is a route to send the user to when
                          # warden.authenticate! returns a false answer. We'll show
                          # this route below.
                          action: 'auth/unauthenticated'
    # When a user tries to log in and cannot, this specifies the
    # app to send the user to.
    config.failure_app = self
  end

  Warden::Manager.before_failure do |env, opts|
    env['REQUEST_METHOD'] = 'POST'
  end

  get '/' do
    @dishes = Dish.all
    @restaurants = Restaurant.all
    erb :index
  end

  get '/auth/login' do
    #binding.pry
    erb :login
  end

  get '/auth/register' do
    erb :register
  end

  post '/' do
    sum = params[:order_item].count
    params[:order_item].each{
      |item|
      quantity = item['quantity'].nil? ? 0: item['quantity'].to_i
      if item['quantity'].to_i > 0 then
        dish_id = item['dish_id']
        dish = Dish.first(:id => dish_id)
        dish_name = dish.name
        order_item = Order_item.create(quantity: quantity, dish_id: dish_id)
        flash[:success] = "You have added #{quantity} #{dish_name}."
      end
    }
    redirect '/'
  end

  post '/auth/register' do
    if params[:user][:password].eql? "" then
      flash[:error] = "Password can not be empty"
    elsif params[:user][:username].eql? "" then
        flash[:error] = "User name can not be empty"
    elsif params[:user][:password].eql? params[:user][:confirm_password] then
      if user=User.first(:username => params[:user][:username]).nil? then
        user = User.create(username: params[:user][:username], password: params[:user][:password])
        env['warden'].authenticate!
        flash[:success] = "Successfully registered and logged in #{current_user.username}"
        redirect '/'
      else
        flash[:error] = "User name is taken"
      end
    else
      flash[:error] = "Password mismatch"
    end

  end

  post '/auth/login' do
    env['warden'].authenticate!
    flash[:success] = "Successfully logged in #{current_user.username}"
    if session[:return_to].nil?
      redirect '/'
    else
      redirect session[:return_to]
    end
  end

  get '/auth/logout' do
    env['warden'].raw_session.inspect
    env['warden'].logout
    flash[:success] = 'Successfully logged out'
    redirect '/'
  end

  post '/auth/unauthenticated' do
    session[:return_to] = env['warden.options'][:attempted_path] if session[:return_to].nil?

    # Set the error and use a fallback if the message is not defined
    flash[:error] = env['warden.options'][:message] || 'You must log in'
    redirect '/auth/login'
  end

  get '/protected' do
    env['warden'].authenticate!

    erb :protected
  end
end
