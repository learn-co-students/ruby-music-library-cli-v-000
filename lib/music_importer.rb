require 'pry'

class MusicImporter

attr_accessor :path

def initialize(path)
  @path = path
  @files = []
end

def files
  Dir.entries(path).select {|file| file.end_with?('.mp3')}.sort
end


def import
  files.each do |file|
  Song.new_from_filename(file)
  end
end

end
