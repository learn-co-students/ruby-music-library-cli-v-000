require 'pry'
require 'pathname'

class MusicImporter

    attr_accessor :path, :files

    def initialize(file_path)
        @path = file_path
    end

    def files
         dir_var = Dir.entries(@path).select {|f| !File.directory? f}
         dir_var

    end

    def import
        self.files.each do |file|
          Song.create_from_filename(file)
      end
    end

end
