require_relative "../config/environment.rb"
require 'pry'

class MusicImporter
  extend Concerns::Findable

  attr_accessor :files, :path

  def initialize(path="./spec/fixtures/mp3s")
    @path = path
  end

  def files
    Dir.chdir(@path){|path| Dir.glob("*.mp3")}
  end

  def import
    self.files.each {|file|
      Song.new_from_filename(file)
    }
    # binding.pry
  end



end