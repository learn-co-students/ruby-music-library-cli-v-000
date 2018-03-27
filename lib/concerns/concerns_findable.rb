module Concerns::Findable

  def find_by_name(name)
    self.all.bsearch { |instance| instance.name == name }
  end

  def find_or_create_by_name(name)
    instance = self.find_by_name(name)
    instance == nil ? self.create(name) : instance
  end

  def create(name)
    self.new(name).save
  end

  def destroy_all
    self.all.clear
  end

end
