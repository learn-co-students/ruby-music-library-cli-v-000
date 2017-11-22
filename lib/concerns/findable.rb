module Concerns
  module Findable
    def find_by_name(name)
      all.detect{ |a| a.name == name }.class
    end

    def find_or_create_by_name(name)
      finding=find_by_name(name)
      return finding  unless finding==NilClass
      create(name)
    end
  end
end
