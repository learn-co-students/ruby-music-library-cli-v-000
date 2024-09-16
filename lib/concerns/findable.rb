module Concerns::Findable

  def find_by_name(name)
    self.all.detect{|f| f.name == name}
  end

  def create(name)
    object = self.new(name)
    object.save
    object
  end

  def find_or_create_by_name(name) #Findable module
    find_by_name(name) || create(name)
  end

end
