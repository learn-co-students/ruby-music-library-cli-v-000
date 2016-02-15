class MusicImporter

  def initialize(filepath)
    @filepath = filepath
  end

  def path
    @filepath
  end

  def files
    Dir["#{path}/*.mp3"].collect {|path| path.split("/").last} # iterates through the @filepath and returns the last element
  end

  def import
    files.each do |filename|
      # iterates through each element in formatted files and creates a new instance of the Song using the class method .create_from_filename()
      Song.create_from_filename(filename)
    end
  end

end
