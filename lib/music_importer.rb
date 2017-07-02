class MusicImporter

  attr_accessor :path

  def initialize(file_path)
  	@path = file_path
  	@@all = []
  	Dir.entries(@path).each { |filename| @@all << filename if filename.match(/.mp3/) != nil }
  end

  def files
  	@@all
  end

  def import
	  @@all.each { |filename| Song.create_from_filename(filename) }
  end

end