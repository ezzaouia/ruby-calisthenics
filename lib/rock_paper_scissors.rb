class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    stgies = ['R','P','S']
    stg1 = player1[1]
    stg2 = player2[1]
    g1 = ['P', 'S'] # S
    g2 = ['P', 'R'] # P
    g3 = ['R', 'S'] # R
    unless (stgies.include?(stg1) && stgies.include?(stg2))
      raise NoSuchStrategyError, "Strategy must be one of R,P,S"
    end
    return player1 if stg1 == stg2
    if g1.include?(stg1) && g1.include?(stg2)
      return player1 if stg1 == 'S'
      return player2 if stg2 == 'S'
    end
    if g2.include?(stg1) && g2.include?(stg2)
      return player1 if stg1 == 'P'
      return player2 if stg2 == 'P'
    end
    if g3.include?(stg1) && g3.include?(stg2)
      return player1 if stg1 == 'R'
      return player2 if stg2 == 'R'
    end
  end

  def self.tournament_winner(tournament)
    if tournament[0][0].is_a? String
      return RockPaperScissors.winner(tournament[0], tournament[1])
    end
      tournament.each do |nested|
        nested.map! do |nested_level_2|
          return RockPaperScissors.winner(tournament_winner(tournament[0]), tournament_winner(tournament[1]))
        end
      end
  end

end
