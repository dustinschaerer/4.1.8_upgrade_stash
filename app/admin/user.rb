ActiveAdmin.register User do

  menu :priority => 8
  permit_params :id, :email, :created_at, :sign_in_count, :last_sign_in_at, :last_sign_in_ip, :admin

end
