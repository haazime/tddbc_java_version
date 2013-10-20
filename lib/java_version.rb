class JavaVersion

  class << self

    def valid?(version)
      return false unless /^JDK\d+u[1-9]\d+$/ =~ version
      return true
    end

    def parse(version)
      raise ArgumentError.new("invalid version `#{version}`") unless valid?(version)
      new(*version.scan(/\d+/).collect(&:to_i))
    end
  end

  attr_reader :family_number, :update_number

  def initialize(family_number, update_number)
    @family_number = family_number
    @update_number = update_number
  end
end
