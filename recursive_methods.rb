def palindrome?(word)
        return (word[0] == word[-1])  if(word.length <= 3)
        palindrome?(word[0] + word[-1]) && palindrome?(word[1,word.length-2])
end
def factorial(num)
    return 1 if(num == 1)
    num * factorial(num - 1)
end
def bottles_of_beer(bottles)
    if(bottles == 0)
        print "no more bottles of beer on the wall\n"
    else
        print "#{bottles} bottle of beer on the wall\n"
        bottles_of_beer(bottles-1)
    end
end
def fibonacci(n)
    return n if(n <= 1)
    return fibonacci(n-2) + fibonacci(n-1)
end
def flatten_array(array)
    if(array.length == 1)
        if(array[0].class == Array)
            return flatten_array(array[0])
        else
            return array
        end
    else
        length_of_second_array  = array.length - (array.length/2)
        a1 = flatten_array(array[0,array.length/2])
        a2 = flatten_array(array[array.length/2,length_of_second_array])
        a1 + a2
    end
end
$roman_mapping = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
}
$reverse_roman_mapping = {
  "M" => 1000,
  "CM" => 900,
  "D" => 500,
  "CD" => 400,
  "C" => 100,
  "XC" => 90,
  "L" => 50,
  "XL" => 40,
  "X" => 10,
  "IX" => 9,
  "V" => 5,
  "IV" => 4,
  "I" => 1
}
def int_to_roman_numeral(int)
    return "" if(int==0)
    $roman_mapping.each do |key,value|
        return value + int_to_roman_numeral(int - key) if(int >= key)
    end
end
def roman_numeral_to_int(numeral)
    $reverse_roman_mapping.each do |key,value|
        potental_new_roman_numeral_length = numeral.length - key.length
        return value + roman_numeral_to_int(numeral[key.length,potental_new_roman_numeral_length]) if(numeral.start_with? key)
    end
    0
end