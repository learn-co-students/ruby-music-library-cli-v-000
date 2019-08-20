require "pry"
class MusicImporter
  attr_accessor :path, :data, :songs

  def initialize(path)
    @path = path
  end

  def files
    filenames = Dir[@path + "/*"];
    @data = filenames.collect do |filename|
      filename = filename.slice(@path.size + 1, filename.size)
      filename
    end
    @data
  end

  def import
    self.files()
    @songs = @data.collect do |datum|
      Song.create_from_filename(datum)
    end
    @songs
  end
end
