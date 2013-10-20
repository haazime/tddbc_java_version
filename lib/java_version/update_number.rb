class JavaVersion
  class UpdateNumber
    include Comparable

    def initialize(number)
      @number = number
    end

    def next_limited_update
      self.class.new(20 * (@number / 20 + 1))
    end

    def next_critical_patch_update
      self.class.new(
        (5 * (@number / 5 + 1)).tap do |x|
          break x + 1 if x % 2 == 0
        end
      )
    end

    def next_security_alert
      self.class.new(
        (@number + 1).tap do |x|
          break x + 2 if x % 20 == 0 and x % 5 == 0
          break x + 1 if x % 5 == 0
        end
      )
    end

    def to_i
      @number
    end

    def <=>(other)
      self.to_i <=> other.to_i
    end
  end
end
