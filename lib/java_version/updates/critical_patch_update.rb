class JavaVersion
  module CriticalPatchUpdate
    extend self

    def next_update_number(current)
      (5 * (current / 5 + 1)).tap do |x|
        break x + 1 if x % 2 == 0
      end
    end
  end
end
