ActiveAdmin.register Exhibition do
  menu priority: 1

  config.batch_actions = false

  permit_params :name, :place, :start, :end, :image, :description, :summary, :status

  index do
    selectable_column
    id_column
    column :image
    column :place
    column :name
    column :start
    column :end
    column :status
    actions
  end

	filter :name
	filter :place
	filter :start
	filter :end
	filter :status

	form do |f|
	  f.inputs do
	    f.input :name
	    f.input :place, as: :select, collection: ['東京が立てた美術館', '上野の木木木美術館','西洋がテーマの美術館','国が立てた科学の博物館','東京の国が立てた博物館']
	    f.input :start
	    f.input :end
	    f.input :image, :as => :file
      f.input :description
      f.input :summary
	    f.input :status, as: :select, collection: ['To Be','Now','Past']
	  end
	  f.actions
	end

	show do |item_image|
      attributes_table do
        row :name
        row :place
        row :start
        row :end
        # show画面で画像を表示するためのタグを追加
        row :image do
          image_tag(exhibition.image.to_s)
        end
        row :description
        row :summary
        row :status
      end
    end

end