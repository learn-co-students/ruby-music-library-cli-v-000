module Concerns::Findable
  @@all = []
  def all
    @@all
  end
  
  def create(name)
    new_object = self.new(name).save
    new_object.first
  end
  
  def destroy_all
    self.all.clear
  end
  
  def find_by_name(name)
    self.all.detect { |e| e.name }
  end
  
  def find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create(name)
  end
  
end
  
  
module Concerns::Savable
  def save
    self.class.all << self
  end
end

  