class MusicImporter
attr_accessor :path
# require_relative './db/mp3s'

  def initialize(path)
    @path = path
  end

  def files
    nombres = Dir[path + '/*']
    nombres.collect do |one|
      one.split("/").last
    end
  end


  def import
    files.each { |new_song| Song.create_from_filename(new_song)}
  end

end
