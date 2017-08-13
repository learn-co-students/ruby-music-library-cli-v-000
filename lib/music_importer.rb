class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    #loads all the mp3 files in the path directory
    #normalizes the filename to just the mp3 filename with no path
    my_files = Dir.glob("#{@path}/*.mp3")

    my_files.collect do |e|
      e.gsub("#{@path}/","")
      # files_path_removed = e
      # files_path_removed.slice! "./spec/fixtures/mp3s/"
      # files_path_removed
    end

  end

  def import
    #imports the files into the library by creating songs from a filename
    files.each{ |filename| Song.create_from_filename(filename) }
  end

end
