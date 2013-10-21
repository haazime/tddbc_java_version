class JavaVersion
  module Specification

    def self.satisfied_by?(candidate)
      return false unless candidate.family_number
      return false unless candidate.update_number
      return false unless candidate.family_number >= 0
      return false unless candidate.update_number >= 0
      true
    end
  end
end
