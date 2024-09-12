require_relative '../config/environment.rb'

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.entries(@path).select{|entries| entries.match(/.mp3$/)}
  end

  def import
    files.each do |file|
      song = Song.create_from_filename(file)
    end
  end
end
