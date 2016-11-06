class MusicImporter
  attr_accessor :path
  def initialize p
    @path=p
  end
  def files
    r=[]
    Dir[@path+"/*"].each do |fn|
       next if File.directory? fn
        r<<fn[@path.length+1..-1]
    end
    r
  end
  def import
    files.each { |n| Song.create_from_filename(n) }
  end
end
