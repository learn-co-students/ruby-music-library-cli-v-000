module Concerns::Findable

  def all
    @all = []
  end

  def destroy_all
    @all.clear
  end

  def create(name)
    x = self.new(name)
    x.save
    x
  end

  def find_by_name(name)
    self.all.detect { |x| x.name == name }
  end

  def find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
end
