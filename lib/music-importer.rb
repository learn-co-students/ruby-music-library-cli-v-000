
class MusicImporter
  extend Concerns::Findable

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir[path + '/*.mp3'].map {|file| file.split("mp3s/")[1]}
  end

  def import
    files.map do |file| 
      Song.create_from_filename(file)
    end
  end


end