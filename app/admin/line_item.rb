ActiveAdmin.register LineItem do

  belongs_to :order

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
end
