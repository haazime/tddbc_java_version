class String

  def family_number
    version_numbers[0]
  end

  def update_number
    version_numbers[1]
  end

private

  def version_numbers
    @_java_version_numbers ||= self.scan(/^jdk(\d+)u(\d+)$/i)
                               .flatten
                               .map(&:to_i)
  end
end
