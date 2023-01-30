class Game

  attr_reader :which_round, :active_player

  def initialize
    @active_player = nil
    @players = []
    @which_round = 0
  end

  def run_game

    puts "\nWelcome and Good luck!\n\n"

    print "Player 1, what is your name? "
    player1 = Player.new(gets.chomp)
    @players << player1

    print "Player 2, what is your name? "
    player2 = Player.new(gets.chomp)
    @players << player2

    puts "\nWelcome, #{player1.name} and #{player2.name}!\n\n"

    @active_player = @players[rand(0..1)]
     if (@active_player == @players[0])
      puts "I flipped a coin and #{@players[1].name} is going first!\n\n"
    else
      puts "I flipped a coin and #{@players[0].name} is going first!\n\n"
    end    

    while (@active_player.lives > 0)
        run_round
    end

    end_game
  end

  def increment_round!
    @which_round += 1
  end

  def switch_player!
    if (@active_player == @players[0])
      @active_player = @players[1]
    else
      @active_player = @players[0]
    end

  end

  def end_game
    puts "________ GAME OVER ________"
    puts "#{@active_player.name}, you've run out of lives.\n\n"
    switch_player!
    puts "#{@active_player.name}, you win!\n\n"
  end

  def run_round
        increment_round!
        switch_player!
        question = Question.new()
        puts "________ Question #{@which_round} ________"
        puts "#{@active_player.name}, you have #{@active_player.lives} #{(@active_player.lives) == 1 ? "life" : "lives"} remaining.\n"
        print "#{@active_player.name}, #{question.display_question} "
        answer = gets.chomp.to_i

        if question.correct?(answer)
          puts "Well done, #{@active_player.name}!  #{answer} was the correct answer.\n\n"
        else
          puts "The correct answer was #{question.correct_answer}. You lose a life.\n\n"
          @active_player.lose_life
        end
    end
end