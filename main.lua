-- tw33n Demo, made with LÖVE 2D

-- Require the tw33n module
tw33n = require "tw33n"

-- Create a tw33n, giving it a name, a starting and target value, and an easing function.
tw33n.create("lin", 0, 300, 3, tw33n.linear)
tw33n.create("quadIn", 0, 300, 3, tw33n.quadIn)
tw33n.create("quadOut", 0, 300, 3, tw33n.quadOut)

-- In order for tw33n to function, we need to call tw33n.update(dt).
-- dt is the delta time, time passed since last call
function love.update(dt)
  tw33n.update(dt)
end

function love.draw()
  -- Draw a cube, tw33ning it's x position with a linear easing
  love.graphics.rectangle("fill", tw33n.get("lin"), 0, 30, 30)
  love.graphics.print("Linear", 350, 10)
  -- Draw a cube, tw33ning it's x position with a quad-in easing
  love.graphics.rectangle("fill", tw33n.get("quadIn"), 30, 30, 30)
  love.graphics.print("QuadIn", 350, 40)
  -- Draw a cube, tw33ning it's x position with a quad-out easing
  love.graphics.rectangle("fill", tw33n.get("quadOut"), 60, 30, 30)
  love.graphics.print("QuadOut", 350, 70)
end
