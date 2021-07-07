module
  Concerns::Findable

  def find_by_name(name)
    self.all.find do |thing|
      thing.name == name
    end
  end

   def find_or_create_by_name(name)
    return_value = self.find_by_name(name)
    if return_value
      return_value
    else
      self.create(name)
    end
  end

end 
