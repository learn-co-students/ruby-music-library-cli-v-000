module Concerns::Findable

  @@all = []

  def find_by_name(name)
    self.all.each do |object|
       if object.name == name
         return object
       end
     end
    nil
  end

  def find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end


end
