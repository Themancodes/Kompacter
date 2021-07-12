def anagram?(a,b)
    (a.upcase.chars).sort == (b.upcase.chars).sort

end

anagram?('Tap', 'paT')

anagram?('beat', 'table')

anagram?('beat', 'abet')

anagram?('seat', 'teal')

anagram?('god', 'Dog')
