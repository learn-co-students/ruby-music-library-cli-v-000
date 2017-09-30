class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

#this works -- but I do not understand it
  def files
    @files = Dir.glob("#{@path}/*.mp3")
    @files.collect do |instance|
      File.basename(instance)
    end
  end

  def import
    collection = files
    collection.each do |instance|
      Song.create_from_filename(instance)
    end
  end


end
