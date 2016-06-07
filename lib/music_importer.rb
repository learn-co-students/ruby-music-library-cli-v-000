require 'pry'

class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{@path}/*.mp3").collect {|file| file.split("/")[-1]}
  end

  def import
    self.files.each{|file| new_song_instance = Song.create_from_filename(file)}
  end

end

# binding.pry
