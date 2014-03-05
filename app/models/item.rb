class Item < ActiveRecord::Base
  belongs_to :itemable, :polymorphic => true
  belongs_to :quotecart
  belongs_to :quote
	
end
