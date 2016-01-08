module Concerns::Findable

  def find_by_name(n)
    self.all.detect { |x| x.name == n }
  end 

  def find_or_create_by_name(n)
    self.find_by_name(n) || self.create(n)
  end

  def destroy_all
    self.all.clear
  end
end