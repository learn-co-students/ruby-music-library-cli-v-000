module Concerns::Findable

  def find_by_name(name)
    self.all.detect do |each_name|
      each_name.name == name
    end
  end

  def find_or_create_by_name(name)
    if find_by_name(name) == nil
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

end
