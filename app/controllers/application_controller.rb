class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  # rescue LoadError
  use Rack::Session::Cookie
    use OmniAuth::Builder do
      provider :twitter, '', ''
    end

    get '/' do
      <<-HTML
      <a href='/auth/twitter'>Sign in with Twitter</a>

 
      HTML
    end

    get '/auth/:name/callback' do
      auth = request.env['omniauth.auth']
      # do whatever you want with the information!
      @user = User.find_or_create_by(uid: auth[:uid])
      
    end
end