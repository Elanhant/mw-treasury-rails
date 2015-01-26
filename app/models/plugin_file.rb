class PluginFile < ActiveRecord::Base
  require 'dropbox_sdk'
  belongs_to :plugin, touch: true
  after_create :upload
  after_destroy :remove

  protected
    def upload
      client = authorize
      file_path = "public/files/#{self.name}"
      file = open(file_path)
      dropbox_path = "#{self.plugin.id}/#{self.plugin.id}-#{self.name}"
      response = client.put_file(dropbox_path, file)
      self.path = dropbox_path
      File.delete(file_path) if File.exist?(file_path)
      puts response
    end

    def remove
      client = authorize
      file_path = "public/files/#{self.name}"
      dropbox_path = "#{self.plugin.id}/#{self.plugin.id}-#{self.name}"
      begin
        response = client.file_delete(dropbox_path)
        File.delete(file_path) if File.exist?(file_path)
      rescue DropboxError
        puts 'Error occured!'
      end
      puts response
    end

    def authorize
      DropboxClient.new('mUAU7BrImfoAAAAAAAAKnR6edpjunpH1soMBPgQO3XizI1iXL28NtWvwUeKQtyaj')
    end
end
