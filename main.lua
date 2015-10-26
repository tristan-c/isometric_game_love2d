flux = require "flux"

block_width = 32
block_height = 32
block_depth = block_height / 2


grid_size = 90
grid = {}
for x = 1,grid_size do
   grid[x] = {}
   for y = 1,grid_size do
      grid[x][y] = love.math.random(0, 5 )
   end
end

grid[2][4] = 2
grid[6][5] = 2

function love.conf(t)
    t.window.width = 1920 
    t.window.height = 960 
end


function love.load()
  Tileset = love.graphics.newImage('ih.png')

  local tileW, tileH = 32,32
  local tilesetW, tilesetH = Tileset:getWidth(), Tileset:getHeight()

  GrassQuad = love.graphics.newQuad(15,  0, tileW, tileH, Tileset:getDimensions())
  BoxQuad = love.graphics.newQuad(15, 60, tileW, tileH, Tileset:getDimensions())

end

function love.keypressed(key)
   if key == "escape" then
      love.event.quit()
   end
end

function love.draw()
  grid_x = 250
  grid_y = 250

  for x = 1,grid_size do
     for y = 1,grid_size do
        if grid[x][y] == 1 then
           love.graphics.draw(Tileset,GrassQuad,
              grid_x + ((y-x) * (block_width / 2)),
              grid_y + ((x+y) * (block_depth / 2)) - (block_depth * (grid_size / 2)))
        elseif grid[x][y] == 2 then
           love.graphics.draw(Tileset,BoxQuad,
              grid_x + ((y-x) * (block_width / 2)),
              grid_y + ((x+y) * (block_depth / 2)) - (block_depth * (grid_size / 2)))
        else

        end
     end
  end
end