require 'pry'

class MusicImporter
  attr_accessor :path, :files

  def initialize(filepath)
    self.path = filepath
  end

  def files
    filenames = []
    Dir.chdir(self.path) do
      filenames = Dir.glob("*.mp3")
    end

    filenames
  end

  def import
    self.files.each do |filename|
      Song.create_from_filename(filename)
    end
  end

end
