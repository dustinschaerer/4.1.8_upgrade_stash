class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable
  
  has_one :shipping_profile, dependent: :destroy
  accepts_nested_attributes_for :shipping_profile, allow_destroy: true
  has_many :orders



end
