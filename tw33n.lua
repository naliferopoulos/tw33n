local tw33n = {}
tw33n.__index = tw33n

local tweens = {}
local values = {}

function tw33n.linear(ratio)
  return ratio
end

function tw33n.quadIn(ratio)
  return ratio * ratio
end

function tw33n.quadOut(ratio)
  return ratio * (2 - ratio)
end

function tw33n.create(name, from, to, duration, ease)
  local time = 0
  local diff = to - from

  local update = function(dt)
    if time > duration then
      values[name] = to
      return true
    end

    time = time + dt

    values[name] = from + diff * ease(time / duration)
    return false
  end

  tweens[#tweens + 1] = update
end

function tw33n.update(dt)
  for i = #tweens, 1, -1 do
    -- Each tween returns true when finished
    if tweens[i](dt) then
      table.remove(tweens, i)
    end
  end
end

function tw33n.get(name)
  return values[name]
end

local bound = {
  update = function(...) return tw33n.update(...) end,
  get = function(...) return tw33n.get(...) end,
  create = function(...) return tw33n.create(...) end,
}
setmetatable(bound, tw33n)

return bound
