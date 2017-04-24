class Artist

  attr_accessor :name
  extend Findable::ClassMethods
  include Findable::InstanceMethods
  @@all=[]

  def self.all
    @@all
  end

end
