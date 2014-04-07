ActiveAdmin.register Line do
   
    belongs_to :quote
    belongs_to :purchase

    permit_params :id, :quote_product_id, :length, :width, :height, :cover_id, :series_id, :color_id, 
    :shape_id, :umbrella, :velcro, :yards, :size_id, :quantity, :price, :quoteholder_id

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
