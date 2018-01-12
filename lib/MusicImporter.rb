require 'pry'
require_relative './Song.rb'

class MusicImporter

    attr_accessor :path, :files

    def initialize(path)
        @path = path
        @files = self.files
    end

    def files
        files = Dir["#{@path}/*.mp3"]
        files.each do |x|
            x.slice!("#{@path}/")
        end
    end

    def import
        @files.each do |filename|
            Song.create_from_filename(filename)
        end
    end

end

#m = MusicImporter.new("./db/mp3s/")
