require 'pry'

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files #no need for passed in var (path) as @path already = path in init. V---Accounting for "." and ".." leftovers.
    files = Dir.entries(path).delete_if {|item| item == "." || item == ".."} #Dir.entries Returns array containing all filenames in given directory.
  end

  def import
    files.each {|item| Song.create_from_filename(item)} #binding.pry #self was an instance of MusicImporter.
  end

end
