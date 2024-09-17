class MusicImporter

attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    names = Dir[path + '/*']
    names.collect do |one|
      one.split("/").last
    end
  end


  def import
    files.each { |new_song| Song.create_from_filename(new_song)}
  end
end
