#!/usr/bin/env ruby

begin

  class String
    def black; "\e[30m\e[47m#{self}\e[0m" end
    def red;   "\e[31m\e[47m#{self}\e[0m" end
  end

  cards = ["A-S", "2-S", "3-S", "4-S", "5-S", "6-S", "7-S", "8-S", "9-S", "10-S", "J-S", "Q-S", "K-S"] +
          ["A-D", "2-D", "3-D", "4-D", "5-D", "6-D", "7-D", "8-D", "9-D", "10-D", "J-D", "Q-D", "K-D"] +
          ["A-C", "2-C", "3-C", "4-C", "5-C", "6-C", "7-C", "8-C", "9-C", "10-C", "J-C", "Q-C", "K-C"] +
          ["A-H", "2-H", "3-H", "4-H", "5-H", "6-H", "7-H", "8-H", "9-H", "10-H", "J-H", "Q-H", "K-H"]

  spade   = "\u2660"
  diamond = "\u2666"
  club    = "\u2663"
  heart   = "\u2665"

  cards.shuffle!

  hand = cards[0..4]

  hand.each_with_index do |card, n|
    value, suit = card.split('-')
    
    if suit == "S"
      hand[n] = value.black + spade.black
    elsif suit == "D"
      hand[n] = value.red + diamond.red
    elsif suit == "C"
      hand[n] = value.black + club.black
    elsif suit == "H"
      hand[n] = value.red + heart.red
    end
  end

  printf "%33s %33s %33s %33s %33s \n\n\n" % hand

end while true
