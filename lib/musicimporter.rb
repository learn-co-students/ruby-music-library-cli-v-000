require 'pry'

class MusicImporter

  attr_accessor :path
  attr_reader :files

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.glob("#{path}/*.mp3").collect do |song|
      a = path.length.to_i + 1
      song.slice!(0, a)
      song
    end
  end

    def import
      files.each do |files| Song.create_from_filename(files)
        end
    end
end
