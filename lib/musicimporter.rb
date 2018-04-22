class MusicImporter
  require 'pry'
  attr_reader :path

  def import
    files.each {|f| Song.create_from_filename(f)}
  end

  def initialize(path)
    @path = path
  end

  def files
    # binding.pry
    Dir.glob("#{@path}/*.mp3").map {|f| f.gsub("#{@path}/", "")}
  end


end
