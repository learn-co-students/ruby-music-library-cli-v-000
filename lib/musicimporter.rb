require 'pry'
class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files =[]
    Dir.foreach(@path) do |item|
      next if (item == '.' || item == '..')
      #item.gsub!(/\.mp3\z/, "")
      @files << item
    end
  end

  def import
    @files.each do |item|
      Song.create_from_filename(item)
    end
  end


end
