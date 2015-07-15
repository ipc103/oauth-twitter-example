class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  # rescue LoadError
  use Rack::Session::Cookie
    use OmniAuth::Builder do
      provider :twitter, 'b8t1DOJ78u7ebHWMACbQXRBed', '1h76YnXJVBDVEZsTLdfKgPqXfphiPeNDZBVGWXxSSfGPo915o6'
    end

    get '/' do
      <<-HTML
      <a href='/auth/twitter'>Sign in with Twitter</a>

 
      HTML
    end

    post '/auth/:name/callback' do
      auth = request.env['omniauth.auth']
      binding.pry
      # do whatever you want with the information!
    end
end