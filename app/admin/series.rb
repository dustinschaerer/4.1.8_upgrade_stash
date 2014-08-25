ActiveAdmin.register Series do
  
  belongs_to :style
  has_many :colors

  menu :parent => "Content"

  controller do
    def permitted_params
      params.permit!
    end
  end

  form do |f|
    f.inputs 'Attributes' do
      f.input :style_id
      f.input :name
      f.input :desc
      f.input :image_url
      f.input :slug
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
