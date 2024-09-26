class MusicImporter
  attr_accessor :path
  attr_accessor :file 

  def initialize(filepath)
    @path = filepath
  end

   def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{|f| f.gsub("#{path}/", '')}
  end

  def import
    files.each{|f| Song.create_from_filename(f)}
  end
end #<<class#classx