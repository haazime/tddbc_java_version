class JavaVersion
  include Comparable

  class << self

    def valid?(version)
      return false unless /^JDK\d+u\d+$/ =~ version
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

  def next_limited_update
    self.class.new(
      @family_number,
      20 * (@update_number / 20 + 1)
    )
  end

  def next_critical_patch_update
    self.class.new(
      @family_number,
      (5 * (@update_number / 5 + 1)).tap do |x|
        break x + 1 if x % 2 == 0
      end
    )
  end

  def next_security_alert
    self.class.new(
      @family_number,
      (@update_number + 1).tap do |x|
        break x + 2 if x % 20 == 0 and x % 5 == 0
        break x + 1 if x % 5 == 0
      end
    )
  end

  def <=>(other)
    (self.family_number <=> other.family_number).tap do |x|
      break self.update_number <=> other.update_number if x == 0
    end
  end
end
