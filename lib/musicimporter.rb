class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end

  def files
    files = Dir["#{path}/**/*.mp3"]
    new_files = files.collect {|file| file.split("#{path}/")}
    new_files.flatten!
    new_files.delete_if {|file| file == ""}
    #binding.pry
    new_files
  end

  def import
    library = self.files.collect {|file| Song.create_from_filename(file)}
    #binding.pry
  end


end
