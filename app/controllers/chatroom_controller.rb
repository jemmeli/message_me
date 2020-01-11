class ChatroomController < ApplicationController

    def index
    	#byebug
    	@messages = Message.all()
    end

end