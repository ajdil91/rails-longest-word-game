require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times do
      @letters << ('a'..'z').to_a.sample
    end
    @letters
  end

  def score
    @result = params[:word]
    @letters = params[:letters]

    if included?(@result, @letters)
      @response = "No cheating! Letters are not in the original grid"
    elsif !included?(@result, @letters) && valid_word(@result)
      @response = "Great job, you created a word!"
    else
      @response = "Nice try but word does not exist in English"
    end
  end

  def included?(word, letters)
    word.chars.all? { |letter| word.count(letter) > letters.count(letter) }
  end

  def valid_word(word)
    url = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse((url).read)
    json['found']
  end
end

