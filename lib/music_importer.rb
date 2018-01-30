require 'pry'


class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir["#{self.path}/*.mp3"].each do |string|
    string.slice!("#{self.path}/")
    end
    
  end

  def import 
    self.files.each do |song_file|
      Song.create_from_filename(song_file)
    end
  end

end
