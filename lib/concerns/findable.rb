module Concerns::Findable

  def find_by_name(name)
    self.all.find do |object|
      object.name == name
    end


  end

  def find_or_create_by_name(name)
    if not self.find_by_name(name)
      self.create(name)
    else
      self.find_by_name(name)
    end

      
  end
end
