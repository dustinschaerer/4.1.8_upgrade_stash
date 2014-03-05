class Message < ActiveRecord::Base
	validates :reason, :email, :name, :message, presence: true

	CONTACT_REASONS = ['General Product Question', 'Question about a Previous Order', 'Question about a Previous Quote', 'Billing Issues', 'Other reason']
end
