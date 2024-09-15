require 'pry'
class MusicImporter

  attr_accessor :path

  def initialize(file_path)
    @path = file_path
  end

  def files
    Dir.entries(@path).select {|file| file.include?('.mp3')}
  end

  def import
    self.files.collect {|filename| Song.create_from_filename(filename)}
  end

end
