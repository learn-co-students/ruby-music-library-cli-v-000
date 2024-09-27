require "pry"

class MusicImporter

  @@songs = []
  attr_accessor :path
  def initialize(path = "./db/mp3s")
    @path = path
    @files = []
  end

  def files
    @files = Dir["#{@path}/*.mp3"]
    @files = @files.map do |file|
      file.split("/")[-1]
      end
    @files
  end

  def import

    files.each {|file|
      Song.create_from_filename(file)
    }
  end

end
