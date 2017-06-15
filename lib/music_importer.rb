class MusicImporter

  attr_accessor :path

def initialize(path)
  @path = path
end

def files
  Dir.glob("#{path}/*.mp3").collect {|file| file.gsub("#{path}/", "")}.sort
end

def import
files.each {|filename| Song.create_from_filename(filename)}
end

end
