class MusicImporter

  attr_accessor :filepath, :files

  def initialize(filepath)
    @filepath = filepath
    @files = []
    @fsongs = []
  end

  def path
    @filepath
  end

  def files
    Dir.entries(path).each do |file|
      @files << "#{file}"
    end
    @files.each do |fsong|
      noext = File.basename(fsong, ".*").split(" - ")
      @fsongs << noext
    end
  end

  def import
    @songs.each do |song|
      Song.create_from_filename(song)
    end
  end


end
