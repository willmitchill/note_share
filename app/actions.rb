# Homepage (Root path)
require 'pry'
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
    redirect '/universities'

  else
    erb :signup
  end
end

get '/signup' do
  erb :signup
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
    redirect '/universities'
end


get '/universities' do
  @universities = University.all.order(:name)
  erb :universities
end




get '/universities/:id' do
  @universities = University.all.order(:school_name)
  @university = University.find(params[:id])
  @courses = Course.where(university_id: params[:id])
  erb :'/course/school_courses'
end


#### COURSE ROUTES #####

get '/course/:university_id' do
  @university_id = params[:university_id]
  erb :'/course/add_course'
end

# get '/proposal_form/:job_id' do
#   @job_id = params[:job_id]
#   erb :'/proposal_form'
# end

post '/course/:university_id' do

  Course.create(
    course_name: params[:course_name],
    department: params[:department],
    university_id: params[:university_id]

    # university_id: = @school_name
    # teacher: params[:teacher],
    # coursenum: params[:coursenum]
    )

    redirect "/universities/#{params[:university_id]}"
end

#### NOTE ROUTES #####

get '/universities/:id/:course_id' do

  @university_id = params[:id]
  @course_id = params[:course_id]
  @course = Course.find(@course_id)
  erb :'course/notes/course_notes'
end

post '/universities/:id/:course_id' do

    current_user.notes.create :file => params[:uploaded_file], :course_id => params[:course_id]

    redirect "/universities/#{params[:id]}"
end




#### SCHOOL ROUTE ####

##### UPLOADER ######

# get '/course' do
#   erb :'course/notes/course_notes'
# end
#
# post '/course' do
#   current_user.notes.create :uploaded_file => params[:upload], :uploaded_file => params[:]
#
#   u.save!
#
#   @uploaded_file.to_s
# end
