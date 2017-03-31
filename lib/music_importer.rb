require 'pry'
class MusicImporter

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files

    @files = Dir.entries(@path).reject{|entry| entry == "." || entry == ".."}
  end

  def import
    files.each do |file|
      song = Song.create_from_filename(file)
      song.save
    end

  end

end
