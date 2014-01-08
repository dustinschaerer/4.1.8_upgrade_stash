class Item < ActiveRecord::Base
  belongs_to :quotecart
  belongs_to :itemable, :polymorphic => true
end
