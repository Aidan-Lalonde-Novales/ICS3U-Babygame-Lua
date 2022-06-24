-- 9th Baby Game Learning Guide

-- adds a fire sprite for the gameover state to trigger at

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

push = require 'push'

function love.load()  
    love.window.setTitle('Baby Game by A.M.W.L.N')

    love.graphics.setDefaultFilter('nearest', 'nearest')  
    sprites = {}
    sprites.background = love.graphics.newImage("images/background.png")
    sprites.ground = love.graphics.newImage("images/ground.png")
    sprites.baby = love.graphics.newImage("images/baby.png")
    sprites.fire = love.graphics.newImage("images/fire1.png")

    baby = {}
    baby.x = 370
    baby.y = 150
    gameState = 0

    smallfont = love.graphics.newFont('fonts/pixel_text.ttf', 14)
    largefont = love.graphics.newFont('fonts/pixel_text.ttf', 32)

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = true
    })
end

function love.update(dt)
    baby.x = baby.x - 0.5
    if baby.x < 28 then
        gameState = 1
        gameOver()
        baby.x = 500
        baby.y = 1000
    end
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.draw()
    push:apply('start')

    love.graphics.draw(sprites.background)
    love.graphics.draw(sprites.baby,  baby.x , baby.y)
    love.graphics.draw(sprites.fire, 35, 125)
    love.graphics.draw(sprites.ground, 0, (VIRTUAL_HEIGHT - 60))

    displayFPS()
    if gameState == 1 then
        gameOver()
    end

    push:apply('end')
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
    if key == 'space' then
        baby.x = 370
    end
end

function displayFPS()
    love.graphics.setColor(254 / 255, 255 / 255, 254 / 255, 255 / 255)
    love.graphics.setFont(smallfont)
    love.graphics.print('FPS '.. tostring(love.timer.getFPS()), 16, 8)
    love.graphics.setColor(255 / 255, 255 / 255, 255 / 255, 255 / 255)
end

function gameOver()
    love.graphics.setFont(largefont)
    love.graphics.printf("Game Over, You Monster!", 0, VIRTUAL_HEIGHT / 2 - 6, VIRTUAL_WIDTH, 'center')
end
    
