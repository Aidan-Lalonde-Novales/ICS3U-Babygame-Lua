-- 2nd Baby Game Learning Guide

-- adds font, resize, title change, esc to quit, and fps counter

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

push = require 'push'

function love.load()  
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = true

    love.window.setTitle('Baby Game by A.M.W.L.N')

    smallfont = love.graphics.newFont('fonts/pixel_text.ttf', 14)
    largefont = love.graphics.newFont('fonts/pixel_text.ttf', 32)
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.draw()
    displayFPS()
    love.graphics.setFont(largefont)
    love.graphics.printf("Hello World!", 0, WINDOW_HEIGHT / 2 - 6, WINDOW_WIDTH, 'center')
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function displayFPS()
    love.graphics.setColor(254 / 255, 255 / 255, 254 / 255, 255 / 255)
    love.graphics.setFont(smallfont)
    love.graphics.print('FPS '.. tostring(love.timer.getFPS()), 40, 20)
    love.graphics.setColor(255 / 255, 255 / 255, 255 / 255, 255 / 255)
end
