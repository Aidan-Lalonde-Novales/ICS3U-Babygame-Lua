-- 1st Baby Game Learning Guide

-- Hello World program to serve as a baseline for the game, with properly formatted dimensions

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

function love.load()  
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false
    })
end

function love.draw()
    love.graphics.printf("Hello World!", 0, WINDOW_HEIGHT / 2 - 6, WINDOW_WIDTH, 'center')
end
