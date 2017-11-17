require('pry')
class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).map{|file| file if file.end_with?(".mp3")}.compact
    # binding.pry
  end

  def import
    library = Dir.entries(@path).map{|file| file if file.end_with?(".mp3")}.compact
    library.each do |song|
      Song.create_from_filename(song)
    end
  end
end
