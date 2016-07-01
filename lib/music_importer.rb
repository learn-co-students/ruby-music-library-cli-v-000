require 'pry'
class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path

  end

  def files
    new_file = []

    x = Dir["#{@path}/*.mp3"]

    x.each do |file|
      y = file.split(/(\/mp3s\/)/)

      new_file << y[2]

    end
    new_file

  end

  def import

      files.each do |file_name|
        new_song = Song.new_from_filename(file_name)
        if Song.all == []
          Song.all << new_song
        else

          not_nil = Song.all.detect{|is_song| is_song.name == new_song.name}
          
          if not_nil.nil?
            Song.all << new_song
          end
        end

      end
      Song.all

    end

end
