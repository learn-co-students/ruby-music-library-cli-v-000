class MusicImporter

  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.glob("#{path}/*mp3")
    @files.map { |file| file.gsub("#{path}/", "") }
  end

  def import
    files.each{|x| Song.create_from_filename(x)}
  end


end