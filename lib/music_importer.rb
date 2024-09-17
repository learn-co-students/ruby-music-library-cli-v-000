require "pry"
class MusicImporter
    attr_accessor :path
    
    def initialize (path)
        @path=path
    end
    
    def files
      Dir.glob("#{self.path}/*.mp3").collect do |entry|
            entry.split("/").last
                                        end
    end
    
    def import
       files.sort!
        files.each do |file|
        Song.create_from_filename(file)
                    end
    end
    
end