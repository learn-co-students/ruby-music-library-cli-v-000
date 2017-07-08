module Concerns::Findable

    def find_by_name(name)
      self.all.detect{|a| a.name == name}
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
        # self.all.detect do |obj|
        #   obj.name == name
        # end || Artist.new(name).save
    end

end
