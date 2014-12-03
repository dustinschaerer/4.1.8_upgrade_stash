ActiveAdmin.register Color do

  menu :parent => "Content"

  controller do
    def permitted_params
      params.permit!
    end
  end

end
