class GamesController < ApplicationController
  def new
    @letters = []
    10.times do
      @letters << ('a'..'z').to_a.sample
    end
    @letters
  end

  def score
    result = params[:word]
    letters = params[:letters]
    valid_word =

    if result != letters
      @result = "No cheating! Letters are not in the original grid"
    elsif result != valid_word
      @result = "Nice try but word does not exist in English"
    elsif result == letters && valid_word
      @result = "Great job, you created a word!"
    else
      @result = "Input Error"
    end
  end
end
