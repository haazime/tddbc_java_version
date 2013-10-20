class JavaVersion

  class << self

    def valid?(version)
      return false unless /^JDK\d+u[1-9]\d+$/ =~ version
      return true
    end
  end
end
