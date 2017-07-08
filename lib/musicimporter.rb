class MusicImporter
attr_accessor :path, :files, :normalized_files

#Dir["/path/to/search/**/*.rb"]

def initialize (path)
@path = path
@files = []
end


def files
@files = Dir["#{path}/**/*.mp3"]
@normalized_files = []
@files.each {|filename| @normalized_files << filename.sub(Regexp.new("#{path}/"), "")}
@normalized_files
end

def import
filelist = files
filelist.each{|curr_filename|
Song.create_from_filename(curr_filename)
}
end

    

end