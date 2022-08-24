require 'pp'
require './question'
require './player'

# the Main/Game class to handle I/O
class Main
  attr_accessor :answer, :current_player, :p1, :p2, :question

  def initialize
    @answer = 0
    @current_player = nil
    @p1 = Player.new('Player1')
    @p2 = Player.new('Player2') 
    @question = Question.new
  end

  # message for each play turn
  def turnMsg
    puts "P1: #{@p1.lives}/3 vs. P2: #{@p2.lives}/3"
    puts "----- NEW TURN -----"
  end
  
  # message for the end of game
  def endMsg (player)
    if !player.isAlive?
      if player == @p1
        puts "Player 2 wins with a score of #{@p2.lives}/3"
        puts "----- GAME OVER -----"
        puts "Good bye!"
      elsif player == @p2
        puts "Player 1 wins with a score of #{@p1.lives}/3"
        puts "----- GAME OVER -----"
        puts "Good bye!"
      end
    end
  end

  # the method to get the game loop to start
  def start
    game_loop
  end

  # the game loop to handle the game
  def game_loop
    if !@p1.isAlive?
      return endMsg (@p1)
    elsif !@p2.isAlive?
      return endMsg (@p2)
    end
    
    @current_player == @p1 ? @current_player = @p2 : @current_player = @p1

    if @current_player == @p1

      print "Player 1: "
      puts @question.ques_user
      print ">"
      player_answer = $stdin.gets.chomp

      if player_answer.to_i == @question.math_answer
        puts "Player 1: YES! You are correct."

        if !@p1.scoresFull?
          @p1.addALife
        end

        turnMsg

      elsif player_answer.to_i != @question.math_answer
        puts "Player 1: Seriously? No!"

        @p1.killALife

        turnMsg

      end
    elsif @current_player == @p2
      print "Player 2: "
      puts @question.ques_user
      print ">"
      player_answer = $stdin.gets.chomp
        
      if player_answer.to_i == @question.math_answer
        puts "Player2: YES! You are correct."

        if !@p2.scoresFull?
          @p2.addALife
        end

        turnMsg

      elsif player_answer.to_i != @question.math_answer
        puts "Player 2: Seriously? No!"

        @p2.killALife

        turnMsg

      end
  
    end#end of if two players
    
    game_loop
  end#end of game_loop

end

m1 = Main.new
m1.start

# p m1.question.operand1 
# p m1.question.operand2
# p m1.question.math_answer