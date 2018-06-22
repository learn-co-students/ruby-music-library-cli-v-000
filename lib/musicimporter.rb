require 'pry'
class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
        filenames = Dir.chdir(@path) do | path |
            Dir.glob("*.mp3")
        end
        filenames
    end

end
