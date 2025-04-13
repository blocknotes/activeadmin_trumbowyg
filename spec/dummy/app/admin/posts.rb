# frozen_string_literal: true

ActiveAdmin.register Post do
  permit_params :author_id, :title, :summary, :description, :category, :dt, :position, :published, tag_ids: []

  remove_filter :state, :summary

  index do
    selectable_column
    id_column
    column :title
    column :author
    column :published
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :author
      row :title
      row :summary
      row :description
      row :category
      row :dt
      row :position
      row :published
      row :tags
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    buttons = %w[bold italic underline link justifyRight]

    f.inputs 'Post' do
      f.input :author
      f.input :title
      f.input :summary, as: :trumbowyg, input_html: { data: { options: { btns: buttons } } }
      f.input :description, as: :trumbowyg # using default options
      f.input :category
      f.input :dt
      f.input :position
      f.input :published
    end

    f.inputs 'Tags' do
      f.input :tags
    end

    f.actions
  end
end
