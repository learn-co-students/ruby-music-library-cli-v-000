class Super
  
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods
  extend Concerns::Findable
  
  attr_accessor :name
  
  @@all = []
  
  def self.all
    @@all
  end
  
end