require 'pry'
class MusicImporter
   attr_reader :path
   
def initialize(path) 
  @path = path
end
def files
  Dir.entries(@path).select {|file| file.include?(".mp3")}
end

def import 
    imported = []
    files.each do |song| imported << Song.create_from_filename(song)
end
end
end