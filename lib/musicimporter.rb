class MusicImporter

attr_reader :path

def initialize(filepath)
  @path = filepath
end

def files
   @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
end

def import
  self.files.each{|f| Song.create_from_filename(f)}

end

end
