class JavaVersion
  module Specification
    extend self

    def satisfied_by?(version)
      return false unless version[:name] == 'JDK'
      return false unless version[:separator] == 'u'
      return false if /^0\d+/ =~ version[:family_number]
      return false if /^0\d+/ =~ version[:update_number]
      return true
    end
  end
end
