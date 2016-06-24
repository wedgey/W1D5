require_relative './player.rb'
require_relative './question.rb'

class Game

  def initialize
    @players = []
    get_players_count
  end

  def get_players_count
    puts "How many players will play?"
    (gets.strip.to_i).times do |current_player|
      puts "What is Player #{current_player+1}'s name?"
      name = gets.strip
      @players << Player.new(name)
    end
    (puts "There were no players given..."; get_players_count) if @players.empty?
  end

  def get_input
    puts "Tell us your answer."
    gets.strip
  end

  def greenify(string)
    "\e[32m#{string}\e[0m"
  end

  def redify(string)
    "\e[31m#{string}\e[0m"
  end

  def display_feedback(player, question, input)
    if question.validate(input)
      puts greenify("Good Job. #{question.answer} was the right answer!")
      player.gain_a_point
    else
      puts redify("Sorry, you were wrong. The answer was #{question.answer}.")
      player.lose_a_life
    end
  end

  def show_results
    puts "The game has ended!"
    puts "The loser is: #{(@players.detect { |player| player.life <= 0 }).name} and the winner is: #{(@players.max { |high, now| high.score <=> now.score }).name }"
    @players.each do |player|
      player.add_score_to_total
      puts "#{player.name}: #{player.score} [Running score: #{player.total_score}]"
    end
  end

  def reset_life
    @players.each { |player| player.reset_game }
  end


  def restart?
    puts "Do you want to restart? (y/n)"
    gets.strip == 'y' ? true : false
  end

  def main
    until @players.detect { |player| player.life <= 0} do
      @players.each do |player|
        question = Question.new
        puts "#{player.name}: #{question.question}"
        display_feedback(player, question, get_input.to_i)
        break if player.life <= 0
      end
    end
    show_results
    restart? ? (reset_life; main;)  : (puts "Goodbye")
  end
end

app = Game.new()
app.main