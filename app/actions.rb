# Homepage (Root path)

####HELPERS#####

helpers do
  def current_user
    @current_user ||= User.find(session[:user_id]) if
    session[:user_id]
  end
end

##### GET MAIN PAGE/ SIGNUP / LOGIN ######

get '/' do
  erb :index
end


post '/' do
 @user = User.find_by(
    username: params[:username],
    password: params[:password]

    )
   if @user
    session[:user_id] = @user.id
    redirect '/home_page'
  else
    erb :'/signup'
  end
end

get '/signup' do
  erb :'signup/signup'
end

post '/signup' do

  @user = User.new(
    first_name: params[:first_name],
    last_name: params[:last_name],
    username: params[:username],
    password: params[:password],
    email: params[:email],
    image: params[:image]
    )
    @user.save
    redirect '/home_page'
end


get '/home_page' do
  @universities = University.all.order(:school_name)
  erb :home_page
end



get '/home_page/params[:school_name]' do
  erb :home_page/[:school_name]
end
