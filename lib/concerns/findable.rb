module Concerns::Findable

  def find_by_name(new_name)
    self.all.find{|x| x.name == new_name}
  end

  def find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
end
