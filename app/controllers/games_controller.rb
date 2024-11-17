class GamesController <  ApplicationController
  skip_before_action :verify_authenticity_token, only: [ :update_or_create_score ]
  skip_before_action :protect_pages, only: [ :index, :update_or_create_score ]
  def index
    @games = Game.all
  end

  def update_or_create_score
    puts "Params: #{params}"
    @player = Person.find_by(username: params[:username])
    puts "Player: #{@player.id}"
    @game = Game.find_by(person_id: @player.id)
    if @game
      @game.update(points: @game.points + 10)
    else
      @game = Game.new(person_id: @player.id, points: 10)
    end
    @game.save
    render json: { score: @game.points }
  end

  # def game_params
  #   params.require(:game).permit(:username)
  # end
end
