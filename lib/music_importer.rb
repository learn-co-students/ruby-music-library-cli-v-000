require 'pry'
class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.glob(@path + "/" + "*.mp3")
    files.collect {|file| file.gsub(@path + "/", "")}
  end

  # Why is this considered hardcoded? because i didn't use @path?
  #   files.collect {|file| file.split("./spec/fixtures/mp3s/")[1]}
  # end

  def import
    files.each do |song|
      Song.create_from_filename(song)
    end
  end

end
