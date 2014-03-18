ActiveAdmin.register Vinyl do

  
  permit_params :id, :cover_id, :shape_id, :width, :length, :diameter, :height, :drop, :series_id, :color_id, :umbrella, :velcro, :quantity, :price

  form do |f|
    f.actions
    f.inputs 'Details' do
 
      f.input :cover_id, :as => :select, :collection => Cover.all,  :wrapper_html => { :class => 'fl' }
      f.input :shape_id, :as => :select, :collection => Shape.all,  :wrapper_html => { :class => 'fl' }
      f.input :drop, :as => :select,  :collection => ['6 inch', '8 inch (We Recommend this length for the Regular Drape Cover)', '10 inch', '4 inch', '6 inch (We Recommend this length for the Fitted (Hat Box) Cover)', '8 inch'],  :wrapper_html => { :class => 'fl clearfix' }
      f.inputs "Table Measurements" do
        "<div id=\"element-name\">&nbsp;</div>".html_safe
      end
      f.input :width,  :wrapper_html => { :class => ' fl' }
      f.input :length,  :wrapper_html => { :class => 'fl' }
      f.input :diameter,  :wrapper_html => { :class => 'fl' } 
      f.input :height,  :wrapper_html => { :class => 'fl' }
      f.inputs "Table Cover Options" do
        "<div id=\"element-name\">&nbsp;</div>".html_safe
      end
      f.input :series_id, :as => :select, :collection => Series.where("style_id = 1 OR style_id = 2").order("name"), :wrapper_html => { :class => 'fl' }
      #f.input :color_id, :as => :select, :collection => Color.order(:name), :wrapper_html => { :class => 'fl' }

      f.input :color_id, :as => :select, :collection => option_groups_from_collection_for_select(Series.order(:name), :colors, :name, :id, :name, :selected => (vinyl.color.id if !vinyl.color.nil?) ), :wrapper_html => { :class => 'fl' } 
      
      f.input :umbrella,  :wrapper_html => { :class => 'fl' }
      f.input :velcro,  :wrapper_html => { :class => 'fl' }
      f.input :quantity,  :wrapper_html => { :class => 'fl' }
      f.input :price
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
