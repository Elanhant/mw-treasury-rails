class PluginImagesController < ApplicationController
  include Concerns::Upload

  def final_file_directory
    File.join Rails.root, "public", "images"
  end
end