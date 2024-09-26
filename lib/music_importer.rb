
class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    array = []
    Dir.entries(path).each do |a|
      if a.include?("mp3")
        array << a
      end
    end
    array
  end

  def import
    array = []
    array = files
    array.each {|file| Song.create_from_filename(file)}
  end
end
