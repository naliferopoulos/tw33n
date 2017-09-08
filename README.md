# tw33n - Tweening in lua made easy

## What is tweening?
**Tweening** is the process of interpolating a value between a starting and an ending constant during a given time.

## But why?
Tweening can be used for animating values over time. It is widely used in game development and web design for animation.

## Yes, but does it LÖVE?
Oh, it does LÖVE. You can find a LÖVE demo in *main.lua* displaying the process of creating tw33ns.

## Why tw33n and not some other library?
Tw33n is super light-weight, has a tiny performance and memory footprint and is less than a hundred lines of code fitting in a single file. It does not make assumptions of your programming style and can be used with any other lua framework.

## How do I tw33n?
The whole tw33n library runs with a single call to **tw33n.update(dt)**, which maintains your active tw33ns and animates their values accordingly.

Creating a tw33n is as simple as:
```lua
tw33n.create("xPosition", 0, 100, 10, easeIn)
```
You need to specify a name for the tw33n, a starting and ending position, a duration in seconds and an easing function.

After that, the value of a tw33n can be retrieved as follows:
```lua
tw33n.get("xPosition")
```
Requesting a value for a non existent tw33n returns *nil*.

## Which easing functions exist?
At the time being the existing functions are:
  * Linear - ratio
  * Ease In - ratio * ratio
  * Ease Out - ratio * (2 - ratio)

## Can I implement my own?
Sure thing! You just need to specify a function when creating a tw33n. The function needs to accept a number argument and also return a number.
```lua
function MyEaseIn(r)
  return r * r * r
end

tw33n.create("myTw33n", 0 , 100, 10, MyEaseIn)
```

### Made by Nick Aliferopoulos with Lua and complex math.
### Special thanks to recursor
