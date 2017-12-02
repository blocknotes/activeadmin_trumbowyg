require 'fileutils'

namespace :trumbowyg do
  desc 'Create nondigest versions of all trumbowyg digest assets'
  task nondigest: :environment do
    # include ActionView::Helpers::AssetUrlHelper
    # p font_path( 'active_admin-trumbowyg.svg' )

    fingerprint = /\-[0-9a-f]{32,64}\./
    path = Rails.root.join( 'public/assets/active_admin-trumbowyg*' )

    Dir[path].each do |file|
      next unless file =~ fingerprint
      nondigest = file.sub fingerprint, '.'

      if !File.exist?(nondigest) || File.mtime(file) > File.mtime(nondigest)
        FileUtils.cp file, nondigest, verbose: true, preserve: true
      end
    end
  end
end
