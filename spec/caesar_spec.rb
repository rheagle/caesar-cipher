# frozen_string_literal: true

require_relative '../lib/caesar_cipher.rb'

describe CaesarCipher do

  describe '#caesar_cipher' do
  # public query method -> test return value
  # cases:
    # a string with both lower and uppercase letters
    # a string with non-alphabetic characters (they should remain unchanged)
    # edge cases such as an empty string or string with single character
  # test boundary cases for shifting, such as around start or end of alphabet
    subject(:cipher) { described_class.new(3) }

    context 'when a string contains both lowercase and uppercase letters' do
      it 'shifts all letters correctly' do
        result = cipher.caesar_cipher('Hello World')
        expect(result).to eq('Khoor Zruog')
      end
    end

    context 'when a string contains non-alphabetic characters' do
      it 'does not alter non-alphabetic characters' do
        result = cipher.caesar_cipher('Hello, World!')
        expect(result).to eq('Khoor, Zruog!')
      end
    end

    context 'when the string is empty' do
      it 'returns an empty string' do
        result = cipher.caesar_cipher('')
        expect(result).to eq('')
      end
    end

    context 'when the string contains a single character' do
      it 'shifts the single character correctly' do
        result = cipher.caesar_cipher('H')
        expect(result).to eq('K')
      end
    end

    context 'when a string contains only uppercase letters' do
      it 'shifts uppercase letters correctly' do
        result = cipher.caesar_cipher('HELLO')
        expect(result).to eq('KHOOR')
      end
    end

    context 'when a string contains only lowercase letters' do
      it 'shifts lowercase letters correctly' do
        result = cipher.caesar_cipher('hello')
        expect(result).to eq('khoor')
      end
    end

    context 'when the string contains a mix of alphabetic and non-alphabetic characters' do
      it 'shifts alphabetic characters and leaves non-alphabetic characters unchanged' do
        result = cipher.caesar_cipher('Hello, 123!')
        expect(result).to eq('Khoor, 123!')
      end
    end

    context 'when a shift causes wrapping at the end of the alphabet' do
      it 'correctly wraps around the alphabet from z to a' do
        result = cipher.caesar_cipher('xyz')
        expect(result).to eq('abc')
      end
    end

    context 'when the shift value is negative' do
      subject(:negative_shift) { described_class.new(-3) }
      it 'correctly shifts characters backward when the shift is negative' do
        result = negative_shift.caesar_cipher('Hello')
        expect(result).to eq('Ebiil')
      end
    end

    context 'when the shift value is greater than 26' do
      subject(:shift_over_twenty_six) { described_class.new(30) }
      it 'correctly handles shifts greater than 26 by wrapping around the alphabet' do
        result = shift_over_twenty_six.caesar_cipher('Hello')
        expect(result).to eq('Lipps')
      end
    end

    context 'when the shift value is zero' do
      subject(:zero_shift) { described_class.new(0) }
      it 'returns the original string without any changes' do
        result = zero_shift.caesar_cipher('Hello')
        expect(result).to eq('Hello')
      end
    end

    context 'when the shift is a large value greater than 26' do
      subject(:large_shift) { described_class.new(22) }
      it 'correctly handles large shift values by wrapping around the alphabet' do
        result = large_shift.caesar_cipher('Hello')
        expect(result).to eq('Dahhk')
      end
    end
  end
  
  
  #describe '#shift_character' do
  # private method, called by a public method
  # command method -> test change in observable state
  # tested indirectly


  #describe '#shift_lowercase' do
  # private method, called by a public method
  # command method -> test change in observable state
  # tested indirectly


  #describe '#shift_uppercase' do
  # private method, called by a public method
  # command method -> test change in observable state
  # tested indirectly


  # '#shift_character_in_alphabet' 
  # private method, called by other private methods
  # do not need to test -> tested indirectly through other methods

  # '#is_uppercase?'
  # private method
  # do not need to test -> tested indirectly through other methods
end