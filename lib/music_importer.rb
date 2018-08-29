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

end
