# frozen_string_literal: true

class CaesarCipher
  ALPHABET = ('a'..'z').to_a
  UPPERCASE_ALPHABET = ('A'..'Z').to_a

  def initialize(shift)
    @shift = shift
  end

  def caesar_cipher(string)
    string.chars.map { |char| shift_character(char) }.join
  end

  private

  def shift_character(char)
    if letter?(char)
      is_uppercase?(char) ? shift_uppercase(char) : shift_lowercase(char)
    else
      char
    end
  end

  def letter?(char)
    char.match?(/[A-Za-z]/)
  end

  def is_uppercase?(char)
    char == char.upcase
  end

  def shift_lowercase(char)
    shift_character_in_alphabet(char, ALPHABET)
  end

  def shift_uppercase(char)
    shift_character_in_alphabet(char, UPPERCASE_ALPHABET)
  end

  def shift_character_in_alphabet(char, alphabet)
    index = alphabet.index(char)
    shifted_index = (index + @shift) % 26
    alphabet[shifted_index]
  end
end


#caesar_cipher('AppLe or 4 OraNges?', 4)
