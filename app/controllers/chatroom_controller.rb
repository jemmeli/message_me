class ChatroomController < ApplicationController

	before_action :require_user

    def index
    	#byebug
    	@messages = Message.all()
    end

end