require 'pry'

class MusicImporter
attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    filenames = []
    Dir[File.join(self.path, "*.mp3")].each {|file| filenames << file.split('mp3s/')[1]}
    filenames
  end

  def import
    self.files.each {|filename| Song.create_from_filename(filename)}
  end
end
