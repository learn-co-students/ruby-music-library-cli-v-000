class Person
    extend Concerns::Findable
    extend Persistable::ClassMethods
    include Persistable::InstanceMethods


    attr_accessor :name

end

class MusicImporter

    attr_accessor :song, :genre, :artist, :path
    def initialize(path)
        @path = path
    end

    def files
      Dir.glob("#{path}/*.mp3").collect {|f| f.gsub("#{path}/", "")}

    end

#      def self.new_from_filename(file_name)
#  +       
#  +      title = file_name.split(" - ")[1]
#  +      song = self.new(title)
#  +      artist = file_name.split(" - ")[0]
#  +      song.artist_name=(artist)
#  +      song.artist = Artist.find_or_create_by_name(artist)
#  +      song

#     end 
    def import
        files.each { |f| Song.create_from_filename(f)}
    end
end

