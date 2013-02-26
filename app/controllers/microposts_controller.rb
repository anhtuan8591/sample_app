class MicropostsController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy]
	before_filter :correct_user, only: [:destroy]

	def index
	end

	def create
		@micropost = current_user.microposts.build(params[:micropost])
		if @micropost.save
			flash[:success] = "Micropost is created" 
			redirect_to root_path
		else
			flash[:error] = "Please enter post content!"
			redirect_to root_path
		end 
	end

	def destroy 
		@micropost = current_user.microposts.find_by_id(params[:id])
		@micropost.destroy
		redirect_to root_path
	end

	private 
	def correct_user
		@micropost = current_user.microposts.find_by_id(params[:id])
	    redirect_to root_url if @micropost.nil?
	end

end
