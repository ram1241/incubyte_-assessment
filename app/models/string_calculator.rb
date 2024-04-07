class StringCalculator
  def add(*inputs)
    default_delimiters = [",", "\n"]
    inputs= inputs.reject(&:empty?)
    inputs.map do |numbers|
      numbers =  numbers.split(Regexp.union(default_delimiters)).map(&:to_i)
      numbers.sum
    end
  end
end
calculator = StringCalculator.new
p calculator.add("", "1", "1,5")