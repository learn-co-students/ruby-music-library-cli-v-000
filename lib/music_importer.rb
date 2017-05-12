class MusicImporter

  attr_accessor :path, :files

def initialize(path)
  @path = path
end

def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def normalize_filenames(filenames)
    filenames.collect do |fn|
      fn.split('/').last
    end

  def import
   files.each {|file| Song.create_from_filename(file)}
 end
end
end
