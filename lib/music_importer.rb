require 'pry'

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).select {|file| file[/\.mp3$/]}
  end

  def import
    self.files.each do |file|
      song = Song.create_from_filename(file.chomp(".mp3"))
    end
  end


end
