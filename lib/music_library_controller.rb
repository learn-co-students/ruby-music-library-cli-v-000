class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    new_MI_object = MusicImporter.new(path)
    new_MI_object.import
  end

  # def files
  #   @files = Dir["#{path}/*.mp3"].collect {|f| f.gsub("#{path}/", "")}
  # end

  # def import
  #   files.each {|f| Song.create_from_filename(f)}
  # end

end
