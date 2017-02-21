module Concerns::Findable

  def find_by_name(name)
    self.all.detect{|o| o.name == name}
  end

  def find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
end
  #module InstanceMethods
    #def save
      #self.all << self
    #end
  #end


  #module ClassMethods
    #def self.destroy_all
      #self.all.clear
    #end

    #def self.count
      #self.all.size
    #end
  #end
