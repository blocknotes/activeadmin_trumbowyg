# frozen_string_literal: true

ActiveAdmin.register Post do
  permit_params :title, :published, :description

  member_action :upload, method: [:post] do
    result = { success: resource.images.attach(params[:file_upload]) }
    result[:file] = url_for(resource.images.last) if result[:success]
    render json: result
  end

  index do
    selectable_column
    id_column
    column :title
    column :published
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :title
      row :published
      row :description
      row :images do |resurce|
        resurce.images.each do |image|
          div do
            link_to image.filename, image, target: '_blank', rel: 'noopener'
          end
        end
        nil
      end
    end
    active_admin_comments
  end

  form do |f|
    options = {
      btns: [['bold', 'italic'], ['link'], ['upload']],
      plugins: { upload: { serverPath: upload_admin_post_path(resource.id), fileFieldName: 'file_upload' } }
    }
    f.inputs 'Post' do
      f.input :title
      f.input :published
      unless resource.new_record?
        f.input :description, as: :trumbowyg, input_html: { data: { options: options } }
      end
    end
    f.actions
  end
end
