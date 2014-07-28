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
    erb :home_page

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
    redirect '/home_page'
end


get '/home_page' do
  @universities = University.all.order(:school_name)
  erb :home_page
end



get '/home_page/:id' do
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

    redirect "/home_page"
end

#### SCHOOL ROUTE ####


# post '/proposal_form/:job_id' do
#   @proposal = Proposal.new(
#     photo: params[:photo],
#     description: params[:description],
#     preview: params[:preview],
#     user_id: session[:user_id].to_i,
#     job_id: params[:job_id].to_i
#   )
#   if @proposal.save
#     redirect '/'
#   else
#     erb :'/job'
#   end
# end




#
# get '/admin/jobs/user/:id' do
#
#   @user = User.find(params[:id])
#   erb :'/job_edit'
#
# end
