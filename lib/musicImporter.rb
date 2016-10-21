class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def import
    records = Dir.glob(@path + "/*.mp3")
    songs = records.collect { |record|  /[^\/]*$/.match(record)[0] }
    songs.each { |song| Song.create_from_filename(song) }
  end

end
