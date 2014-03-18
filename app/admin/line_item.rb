ActiveAdmin.register LineItem do

  belongs_to :order
  navigation_menu :order
  
  permit_params :id, :series_id, :color_id, :quantity, :order_id

  form do |f|
    f.inputs 'Details' do
      f.input :order_id
      f.input :series
      f.input :color
      f.input :quantity
      f.input :active_admin_comments
    end
    f.actions
  end

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
