require 'ruby2d'

set background: 'navy'
set fps_cap: 15

# width = 640 / 20 = 32
# height = 480 / 20 = 24
GRID_SIZE = 20
GRID_WIDTH = Window.width / 20
GRID_HEIGHT = Window.height / 20
song = Music.new('/Users/liamclark14/Desktop/Actualize/Games/song3.mp3')

class Snake
    attr_writer :direction
    def initialize
        @positions = [[2,0], [2,1], [2,2], [2,3]]
        @direction = 's'
        @growing = false
    end

    def draw
        @positions.each do |position|
            Square.new(x: position[0] * GRID_SIZE, y: position[1]*GRID_SIZE, size: GRID_SIZE-1, color: 'white')
        end
    end

    def move
        if !@growing
            @positions.shift
        end

        case @direction
        when 's'
            @positions.push(new_coords(head[0], head[1] + 1))
        when 'w'
            @positions.push(new_coords(head[0], head[1] - 1))
        when 'a'
            @positions.push(new_coords(head[0]-1, head[1]))
        when 'd'
            @positions.push(new_coords(head[0]+1, head[1]))
        end
        @growing = false
    end

    def can_change_direction_to?(new_direction)
        case @direction
        when 'w' then new_direction != 's'
        when 's' then new_direction != 'w'
        when 'a' then new_direction != 'd'
        when 'd' then new_direction != 'a'
        end
    end

    def x
        head[0]
    end

    def y
        head[1]
    end

    def grow
        @growing = true
    end

    def hit_itself?
        @positions.uniq.length != @positions.length
    end

    private

    def new_coords(x,y)
        [x % GRID_WIDTH, y % GRID_HEIGHT]
    end


    

    def head
        @positions.last
    end

end

class Game
    def initialize
        @score = 0
        @ball_x = rand(GRID_WIDTH)
        @ball_y = rand(GRID_HEIGHT)
        @finished = false
    end

    def draw
        unless finished?
          Square.new(x: @ball_x * GRID_SIZE, y: @ball_y*GRID_SIZE, size: GRID_SIZE, color: 'red')
        end
        Text.new(text_message, color: "green", x:10,y:10, size:25)
    end

    def snake_hit_ball?(x,y)
        @ball_x == x && @ball_y == y
    end

    def record_hit
        @score += 1
        @ball_x = rand(GRID_WIDTH)
        @ball_y = rand(GRID_HEIGHT)
    end

    def finish
        @finished = true
    end

    def finished?
        @finished
    end

    private
    
    def text_message
        if finished?
            "Game Over! Your score was #{@score}. Press 'R' to restart."
        else
            "Score: #{@score}"
        end
    end


end
snake = Snake.new
game = Game.new
song.play

update do
    clear

    unless game.finished?
    snake.move
    end
    snake.draw
    game.draw

    if game.snake_hit_ball?(snake.x, snake.y)
        game.record_hit
        snake.grow
    end

    if snake.hit_itself?
        game.finish
    end
end

on :key_down do |event|

    if['w', 's', 'd', 'a'].include?(event.key)
        if snake.can_change_direction_to?(event.key)
          snake.direction = event.key
        end
    elsif event.key == 'r'
        snake = Snake.new
        game = Game.new
        song.play
    end
end

show