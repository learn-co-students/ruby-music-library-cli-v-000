require_relative '../concerns/findable.rb'
require 'pry'

class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end


    def files
     @files = Dir.glob("#{path}/*.mp3").collect { |files| files.sub("#{path}/", "") }
    end

    def import
      files.collect { |filename| Song.create_from_filename(filename) }
    end

end
