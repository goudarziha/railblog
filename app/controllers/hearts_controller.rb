class HeartsController < ApplicationController
	def create
		@heart = Heart.new(heart_params)

		if @heart.save
			redirect_to @heart.post, notice: "hearted that post!"
		else
			redirect_to root_url, notice: "error creating heart"
		end
	end
	private
		def heart_params
	    	params.require(:heart).permit(:post_id)
	    end
end