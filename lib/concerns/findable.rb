module Concerns
  module Findable
    def find_by_name n
      self.all.find {|e| e.name==n}
    end
    def find_or_create_by_name n
      r=find_by_name n
      r==nil ? create(n) : r
    end
    def create n
      new(n).save
    end
  end
end
