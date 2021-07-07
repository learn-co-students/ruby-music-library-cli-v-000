require 'pry'
class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

def files
  Dir["#{path}/*.mp3"].collect do |file|
    array = file.split('mp3s/')
    array[1]
  end
end

def import
  filename = files
filename.each do |file|
Song.create_from_filename(file)
end
end

end
