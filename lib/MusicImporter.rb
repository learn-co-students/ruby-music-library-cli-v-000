require 'pry'

class MusicImporter

def initialize(path)
  @path = path
end

def path
  @path
end

def files
  Dir.entries(@path).select { |file| file.include?("mp3")}
end

def size
end

def import
  files.each{ |filename|
  Song.create_from_filename(filename)}
end

end
