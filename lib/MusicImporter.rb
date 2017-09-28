class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end


  def files
    @files = Dir.glob("#{@path}/*.mp3")
    @files.collect do |instance|
      File.basename(instance)
    end
  end

  def import
    collection = files
    collection.each do |each_file|
      Song.create_from_filename(each_file)
    end
  end


end
