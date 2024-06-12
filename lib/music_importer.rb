require_relative '../lib/concerns/memorable'
require_relative '../lib/concerns/findable'

class MusicImporter

  extend Concerns::Memorable::ClassMethods
  include Concerns::Memorable::InstanceMethods
  extend Concerns::Findable
  extend Concerns::Findable::ClassMethods
  include Concerns::Findable::InstanceMethods

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{|f| f.gsub("#{path}/", "")}
  end

  def import
    files.each{ |filename| Song.create_from_filename(filename)}
  end

end
