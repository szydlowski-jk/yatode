local fn = {
  atlas = nil,
  levelManager = nil,
  camera = {
    x = 0,
    y = 0,
    scale = 1,
    cameraSpeed = 200
  }
}

function fn:Init()
  self.atlas = love.filesystem.load( "atlas.lua" )()
  self.levelManager = love.filesystem.load( "levelmanager.lua" )()

  self.atlas:AddImage( "hex", "assets/gfx/grass_N.png" )
  self.atlas:AddImage( "hex2", "assets/gfx/stone_rocks_N.png" )

end

function fn:NewGame()

end

function fn:Update( dt )
  if love.keyboard.isDown( "left" ) then
    self.camera.x = self.camera.x + self.camera.cameraSpeed * dt
  end
  if love.keyboard.isDown( "right" ) then
    self.camera.x = self.camera.x - self.camera.cameraSpeed * dt
  end
  if love.keyboard.isDown( "up" ) then
    self.camera.y = self.camera.y + self.camera.cameraSpeed * dt
  end
  if love.keyboard.isDown( "down" ) then
    self.camera.y = self.camera.y - self.camera.cameraSpeed * dt
  end
  if love.keyboard.isDown( "=" ) then
    self.camera.scale = self.camera.scale + 1 * dt
  end
  if love.keyboard.isDown( "-" ) then
    self.camera.scale = self.camera.scale - 1 * dt
  end
end

function fn:Draw()
  for j = 1, 15 do
    local offsetx = 0
    local name = "hex"
    local length = 10
    if j % 2 == 1 then
      offsetx = 91
      name = "hex2"
      length = length - 1
    end

    for i = 1, length do
      local x = ( i * 183 + offsetx + self.camera.x ) * self.camera.scale
      local y = ( j * 79 + self.camera.y ) * self.camera.scale
      love.graphics.draw( self.atlas:GetImage( name ), x, y, 0, self.camera.scale, self.camera.scale )
    end

  end



end

return fn
