class StringCalculator
  def initialize
    @default_delimiters = [",", "\n", ";"]
  end

  def add(*inputs)
    return "please enter inputs" if inputs.empty?
    negatives = []
    sum = 0
    inputs.map do |numbers|
      delimiters, numbers = custom_delimiters(numbers)
      numbers = split_numbers(numbers, delimiters)
      negatives << numbers.select { |num| num < 0 }
      sum = numbers.sum
    end
    negatives.flatten!
    raise "negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?
    sum
  end

  private

  def custom_delimiters(numbers)
    if numbers.start_with?("//")
      numbers = numbers[2..-1]
      delimiter, numbers = numbers.split("\n", 2)
      delimiters = delimiter.chars
    else
      delimiters = @default_delimiters
    end
    [delimiters, numbers]
  end

  def split_numbers(numbers, delimiters)
    numbers.split(Regexp.union(delimiters)).map(&:to_i)
  end
end


