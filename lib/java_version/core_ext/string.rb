class String

  def family_number
    version_numbers[0]
  end

  def update_number
    version_numbers[1]
  end

  def java_version?
    version_numbers.size == 2 &&
      version_numbers.all? {|n| n >= 0 }
  end

private

  def version_numbers
    @_java_version_numbers = self.scan(/^jdk(\d+)u(\d+)$/i)
                               .flatten
                               .map(&:to_i)
  end
end
