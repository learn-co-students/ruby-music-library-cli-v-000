class MusicImporter
  attr_accessor :path, :files

  @@win = true

  def initialize(path)
    @path = path
    @files = self.filer(path)
  end

  def lin2win_path(path, windows = false)
    windows ? path.gsub(/\//,"\\") : path
  end

  def filer(path)
    path = lin2win_path(path, @@win)
    Dir.entries(path).find_all{|file| file.match(/.*\.mp3/)}
  end

  def import
    self.files.each {|file| Song.create_from_filename(file)}
  end

  def self.file_shredder(file)
    mp3_info = {}
    mp3_info[:artist], mp3_info[:song], mp3_info[:genre] = file.match(/(.*) - (.*) - (.*)\.mp3/i).captures
    mp3_info
  end
end
