class MusicImporter
attr_accessor :path,:filenames,:title

def initialize(path)
    @path = path
    @filenames = []
  end

  def files
      Dir.entries(path).each do |filename|
        #loads all the mp3 files in the path directory
          @filenames << "#{filename}"
        end
        @filenames.delete_if {|x| x == "." || x == ".."}
        #normalizes the filename to just the mp3 filename with no path
      end

  # def add_song(song)
  #     @songs << song unless @songs.include?(song)
  #     song.file_name = self unless song.file_name
  #   end

  def import
          # binding.pry
      files.each{ |file_name| Song.create_from_filename(file_name) }
    end

end
