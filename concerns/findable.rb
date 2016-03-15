module Concerns::Findable

  def find_by_name(name)
    @find_name = name
    self.all.find {|inst| inst.name == @find_name }
  end

  def find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
 end


end