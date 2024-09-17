module Concerns
  module Findable

      def save
        self.class.all << self unless self.class.all.include?(self)
      end



      

      def destroy_all
        all.clear
      end

      def create(name)
        new(name) unless all.include?(self)
      end

      def find_by_name(name)
        all.detect{|s| s.name.include?(name)}
        # all.detect{|s| s.name == name}
      end

      def find_or_create_by_name(name)
        find_by_name(name) || create(name)
      end
  end
end