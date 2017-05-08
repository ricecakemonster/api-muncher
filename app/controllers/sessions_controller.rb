class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end


# class SessionsController < ApplicationController
#   def login_form
#   end
#
#   def login
#     auth_hash = request.env['omniauth.auth']
#     user = User.find_by(oauth_provider: params[:provider],
#                       oauth_uid: auth_hash["uid"])
#
#
#     if user.nil?
#       #Don't know this user - build a new one
#
#        user = User.from_omniauth(auth_hash)
#
#         if user.save
#           session[:user_id] = user.id
#           flash[:message] = "Successfully logged in as user #{user.username}"
#         else
#
#           flash[:message] = "Could not log in"
#           user.errors.messages.each do |field, problem|
#             flash[:field] = problem.join(', ')
#           end
#         end
#     else
#       session[:user_id] = user.id
#       flash[:message] = "Successfully logged in as user #{user.username}"
#     end
#
#
#     # if username and user = User.find_by(username: username)
#     #   session[:user_id] = user.id
#     #   flash[:status] = :success
#     #   flash[:result_text] = "Successfully logged in as existing user #{user.username}"
#     # else
#     #   user = User.new(username: username)
#     #   if user.save
#     #     session[:user_id] = user.id
#     #     flash[:status] = :success
#     #     flash[:result_text] = "Successfully created new user #{user.username} with ID #{user.id}"
#     #   else
#     #     flash.now[:status] = :failure
#     #     flash.now[:result_text] = "Could not log in"
#     #     flash.now[:messages] = user.errors.messages
#     #     render "login_form", status: :bad_request
#     #     return
#     #   end
#     # end
#     redirect_to root_path
#   end
#
#
#
#   def logout
#     session[:user_id] = nil
#     flash[:status] = :success
#     flash[:result_text] = "Successfully logged out"
#     redirect_to root_path
#   end
# end
