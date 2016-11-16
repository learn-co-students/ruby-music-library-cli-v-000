require 'pry'

class MusicImporter

  attr_reader :path, :files

  def initialize(path)

    @path = path
    @files = []

  end

  def files

    Dir["#{@path}/*.mp3"].each do |file|
      file.slice! "#{@path}/"
      #file.slice! ".mp3"
      @files << file
      #Song.new_by_filename(file)
    end
    @files
  end

  def import
    self.files
    @files.each do |file|
      puts "Processing #{file}"
      song = Song.create_from_filename(file)
      puts "Created #{song}: #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end



end
