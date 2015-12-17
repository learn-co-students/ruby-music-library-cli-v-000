require 'pry'
module Concerns::Findable
  
  def destroy_all
    self.all.clear
  end
  
  def find_by_name(name)
    if self.all.any? {|e| e.name == name }
      self.all.detect {|e| e.name == name }
    else
      nil
    end
  end
  
  def find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end
  
end

module Concerns::Creatable
  def create(name)
    self.new(name).save
  end
end
  
  
module Concerns::Savable
  def save
    self.class.all << self
    self
  end
end

  