ActiveAdmin.register Line do

    belongs_to :quote
    belongs_to :purchase

    permit_params :id, :quote_product_id, :length, :width, :height, :cover_id, :series_id, :color_id,
    :shape_id, :umbrella, :velcro, :yards, :size_id, :quantity, :price, :quoteholder_id

end
