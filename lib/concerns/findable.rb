module Concerns::Findable
  def find_by_name(search_name)
    self.all.find do |name_vari|
      name_vari.name == search_name
    end
  end

  def find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end

end
