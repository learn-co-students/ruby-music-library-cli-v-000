require_relative "../models/music_library_controller.rb"
require_relative "../models/song.rb"
class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.chdir(@path) do |path|
      Dir.glob("*.mp3")
    end
  end

  def import
    files.each{ |f| Song.create_from_filename(f) }
  end
end
