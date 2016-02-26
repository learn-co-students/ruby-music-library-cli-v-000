require 'pry'
class MusicImporter

  attr_accessor :path
  attr_reader :files

  def initialize(filepath)
    @path = filepath
  end

  def files
    filepath = Dir.pwd
    filepath = File.join(filepath, '/spec/fixtures/mp3s')
    Dir.entries(filepath).select {|song| song.match(/\.mp3/) }
  end

  def import
    files.each {|file| Song.new_from_filename(file)}
  end

end