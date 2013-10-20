require 'java_version/update_number'

class JavaVersion
  include Comparable

  class << self

    def valid?(version)
      return false unless /^JDK\d+u\d+$/ =~ version
      return true
    end

    def parse(version)
      raise ArgumentError.new("invalid version `#{version}`") unless valid?(version)
      (family_number, update_number) = version.scan(/\d+/).collect(&:to_i)
      new(family_number, UpdateNumber.new(update_number))
    end
  end

  attr_reader :family_number, :update_number

  def initialize(family_number, update_number)
    @family_number = family_number
    @update_number = update_number
  end

  def next_limited_update
    next_version { next_limited_update }
  end

  def next_critical_patch_update
    next_version { next_critical_patch_update }
  end

  def next_security_alert
    next_version { next_security_alert }
  end

  def <=>(other)
    (self.family_number <=> other.family_number).tap do |x|
      break self.update_number <=> other.update_number if x == 0
    end
  end

private

  def next_version(&block)
    self.class.new(
      @family_number,
      @update_number.instance_eval(&block)
    )
  end
end
