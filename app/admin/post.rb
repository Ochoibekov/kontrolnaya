ActiveAdmin.register Post do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :image,:description,:user_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
form do |f|
    f.inputs do
    	f.input :user_id
      f.input :description
      f.input :image, :as => :file, :hint => image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end


end
