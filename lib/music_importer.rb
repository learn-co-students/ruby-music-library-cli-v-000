class MusicImporter

  attr_accessor :song, :artist, :genre, :path, :files

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    files.each do |filename|
      Song.create_from_filename(filename)
    end
  end

end
