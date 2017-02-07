class MusicImporter
attr_accessor :path, :files 
@@files = []
def initialize(path)
  @path = path
end# of initialize


def files
  @@files = Dir.entries(path).reject do
    |file| file == "." ||  file == ".."
  end# of do
end# of files 


def import
 @@files.each do |file_name| 
  Song.create_from_filename(file_name)
  end# of do
end# of import


end# of class