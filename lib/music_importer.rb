require 'pry'
require 'pathname'

class MusicImporter

    attr_accessor :path

    def initialize(file_path)
        @path = file_path
    end

    def files
         dir_var = Dir.entries(@path).select {|f| !File.directory? f}
         #binding.pry
    end

end
