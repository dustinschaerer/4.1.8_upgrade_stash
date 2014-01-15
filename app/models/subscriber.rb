class Subscriber < ActiveRecord::Base
  belongs_to :user_id

  validates :email, presence: true
  validates :email,  uniqueness: true

end
