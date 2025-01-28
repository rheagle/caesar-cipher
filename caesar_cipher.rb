# ruby caesar_cipher.rb

def caesar_cipher(string, shift)
  alphabet = ('a'..'z').to_a # Create an array of lowercase letters of the alphabet

  shift_string = string.chars.map do |char|
    if char.match?(/[A-Za-z]/) # Check if character is a letter
      is_uppercase = char == char.upcase # Check if letter is uppercase
      base_alphabet = is_uppercase ? ('A'..'Z').to_a : alphabet

      # Find index of the character in the correct alphabet
      index = base_alphabet.index(char) # Do not downcase here!
      
      # Shift character and get the new letter
      shift_index = (index + shift) % 26
      base_alphabet[shift_index] # Return the shifted character
    else
      char # Leave non-alphabetic characters alone
    end
  end.join("") # Join shifted characters into a string

  shift_string
end
caesar_cipher("AppLe or 4 OraNges?", 4)