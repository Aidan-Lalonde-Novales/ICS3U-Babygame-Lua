-- 3rd Baby Game Learning Guide

-- adds baby sprite image ontop of block

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243
BABY_PLACEMENT_X = 415
BABY_PLACEMENT_Y = 162.5

push = require 'push'

function love.load()  
    love.window.setTitle('Baby Game by A.M.W.L.N')

    love.graphics.setDefaultFilter('nearest', 'nearest')  
    sprites = {}
    sprites.background = love.graphics.newImage("images/background.png")
    sprites.ground = love.graphics.newImage("images/ground.png")
    sprites.baby = love.graphics.newImage("images/baby.png")

    smallfont = love.graphics.newFont('fonts/pixel_text.ttf', 14)
    largefont = love.graphics.newFont('fonts/pixel_text.ttf', 32)

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = true
    })
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.draw()
    push:apply('start')

    displayFPS()

    love.graphics.draw(sprites.background)
    love.graphics.draw(sprites.baby, BABY_PLACEMENT_X, BABY_PLACEMENT_Y)
    love.graphics.draw(sprites.ground, 0, (VIRTUAL_HEIGHT - 60))

    love.graphics.setFont(largefont)
    love.graphics.printf("Hello Ground!", 0, VIRTUAL_HEIGHT / 2 - 6, VIRTUAL_WIDTH, 'center')

    push:apply('end')
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function displayFPS()
    love.graphics.setColor(254 / 255, 255 / 255, 254 / 255, 255 / 255)
    love.graphics.setFont(smallfont)
    love.graphics.print('FPS '.. tostring(love.timer.getFPS()), 16, 8)
    love.graphics.setColor(255 / 255, 255 / 255, 255 / 255, 255 / 255)
end
