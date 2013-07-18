class UsersController < ApplicationController

	def create
		@user = User.new params[:user]
		if @user.save
			flash[:notice] = "Thank your for signing up!  We will keep you up to date on our progress."
		else
			flash[:notice] = @user.errors.full_messages.to_sentence
		end
		redirect_to root_path
	end

end
