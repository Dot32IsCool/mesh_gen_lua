
function love.load()
  mesh = CreateCircle(120)
  -- mesh:setTexture(dot32)
  ii = 0

  love.graphics.setBackgroundColor(0.68, 0.97, 0.99)
end

function love.update()
 ii = ii+1
 local x =  math.cos((2/7)*math.pi*2) *(math.sin(ii/20)/2+1)
 local y = math.sin((2/7)*math.pi*2) *(math.sin(ii/20)/2+1)
 --mesh:setVertex( 4, x*dot32:getWidth(), y*dot32:getHeight(), (x+1)/2, (y+1)/2)
end

function love.draw()
  local radius = 200--100--20
  local mx, my = love.mouse.getPosition()
  love.graphics.setColor(108.0/255.0, 177.0/255.0, 5.0/255.0)
  love.graphics.draw(mesh, 400, 300, 0--[[ii*math.pi/180]], radius, radius)
  love.graphics.setColor(0.61, 0.86, 0.26)
  love.graphics.draw(mesh, 400, 300, 0--[[ii*math.pi/180]], radius*0.98, radius*0.98)
  love.graphics.setColor(0.53, 0.5, 0.43)
  love.graphics.draw(mesh, 400, 300, 0--[[ii*math.pi/180]], radius*0.9, radius*0.9)
  love.graphics.print(length)
end

function CreateCircle(segments)
  local vertices = {}

  -- The first vertex is at the origin (0, 0) and will be the center of the circle.
  table.insert(vertices, {0, 0, 0.5, 0.5})

  -- Create the vertices at the edge of the circle.
  for i=0, segments do
    local angle = (i / segments) * math.pi * 2

    -- Unit-circle.
    local x = math.cos(angle)
    local y = math.sin(angle)

    value = love.math.noise(x*3, y*3 , 0)
    -- let x = radius * c * (((val as f32) +0.5) + 5.0)/6.0;

    x = math.cos(angle) * ((value + 0.5) + 4)/5
    y = math.sin(angle) * ((value + 0.5) + 4)/5

    table.insert(vertices, {x, y, (x+1)/2, (y+1)/2})
  end
  length = #vertices
  -- The "fan" draw mode is perfect for our circle.
  return love.graphics.newMesh(vertices)
end