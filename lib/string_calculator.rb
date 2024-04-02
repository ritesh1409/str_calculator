class StringCalculator
  def add(numbers)
    if numbers.empty?
      0
    else
      delimiter = extract_delimiter(numbers)
      numbers = extract_numbers(numbers, delimiter)
      validate_numbers(numbers)
      numbers = ignore_greater_than_1000(numbers)
      sum(numbers)
    end
  end

  private

  def extract_delimiter(numbers)
    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = numbers.split("\n")[1]
      delimiter
    else
      ","
    end
  end

  def extract_numbers(numbers, delimiter)
    raise "Invalid input" if numbers.include?(",\n")
    numbers.split(/#{delimiter}|\n/).map(&:to_i)
  end

  def validate_numbers(numbers)
    negatives = numbers.select { |num| num < 0 }
    raise "negative numbers not allowed #{negatives.join(",")}" if negatives.any?
  end

  def ignore_greater_than_1000(numbers)
    numbers.reject { |num| num > 1000 }
  end

  def sum(numbers)
    numbers.sum
  end
end
