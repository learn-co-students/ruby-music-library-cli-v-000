module Concerns::Findable
#==============================================
  def find_by_name(name)
    # self.all.find(&:name) ?find out why this didnt work?
    self.all.find {|o| name == o.name}
  end

  def find_or_create_by_name(name)
    find = self.find_by_name(name)
    find == nil ? self.create(name) : find
  end
#==============================================
end
