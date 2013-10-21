class JavaVersion
  module SecurityAlert

    def self.next_number(current)
      (current + 1).tap do |x|
        break x + 2 if x % 20 == 0 and x % 5 == 0
        break x + 1 if x % 5 == 0
      end
    end
  end
end

