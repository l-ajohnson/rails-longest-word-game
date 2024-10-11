require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    num_letters = 10
    @letters = ('a'..'z').to_a.sample(num_letters)
  end

  def score

    @word = params["first"]
    @letters = params[:letters]

    url = "https://dictionary.lewagon.com/#{@word}"

    word_info = URI.parse(url).read
    result = JSON.parse(word_info)

    if result['found']
      @response = "that's a real word"
    else
      @response = "start again"
    end
  end
end
