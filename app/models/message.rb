class Message < ActiveRecord::Base
	validates :reason, :email, :name, :message, presence: true
end
