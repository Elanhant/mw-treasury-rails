class PluginFile < ActiveRecord::Base
  require 'dropbox_sdk'
  belongs_to :plugin
  after_create :upload
  after_destroy :remove

  protected
    def upload
      client = authorize
      file = open("public/files/#{self.name}")
      dropbox_path = "#{self.plugin.id}/#{self.plugin.id}-#{self.name}"
      response = client.put_file(dropbox_path, file)
      self.path = dropbox_path
      puts response
    end

    def remove
      client = authorize
      dropbox_path = "#{self.plugin.id}/#{self.plugin.id}-#{self.name}"
      begin
        response = client.file_delete(dropbox_path)
      rescue DropboxError
        puts 'Error occured!'
      end
      puts response
    end

    def authorize
      DropboxClient.new('mUAU7BrImfoAAAAAAAAKnR6edpjunpH1soMBPgQO3XizI1iXL28NtWvwUeKQtyaj')
    end
end
