class ChatroomController < ApplicationController

	before_action :require_user

    def index
    	#byebug
    	@message = Message.new
    	@messages = Message.all()
    end

end