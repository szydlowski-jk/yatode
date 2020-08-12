game = love.filesystem.load( "game.lua" )()

function love.load()
    love.window.setMode( 1280, 720 )
    game:Init()
end

function love.draw()
    game:Draw()
end

function love.update()
    game:Update()
end
