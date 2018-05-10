require 'pry'

class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.glob("#{@path}/*.mp3").collect { |file| file.gsub("#{@path}/","")}
    @files
  end

  def import
    files.each { |filename| Song.create_from_filename(filename) }
    #binding.pry
  end

end


#learn spec/009_music_importer_spec.rb
