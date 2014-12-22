ActiveAdmin.register Product do

  menu :parent => "Content"
  permit_params :title, :description, :image_url, :thumbnail_url, :category

end
