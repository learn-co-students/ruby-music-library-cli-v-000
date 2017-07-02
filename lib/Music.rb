require_relative '../concerns/music_module'
class Music
  # extend Concerns::ClassMethods
  # include Concerns::InstanceMethods

  attr_accessor :name
  def initialize(name)
    @name = name
  end

  # def save
  #   @@all << self
  # end
  #
  # def self.destroy_all
  #   @@all=[]
  # end
  #
  # def self.create(name)
  #   new(name).tap {|a| a.save}
  # end
  #
  # def self.all
  #   @@all
  # end
end
