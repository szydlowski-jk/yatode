local fn = {
  atlas = nil,
  levelManager = nil,
}

function fn:Init()
  self.atlas = love.filesystem.load( "atlas.lua" )()
  self.levelManager = love.filesystem.load( "levelmanager.lua" )()

  self.atlas:AddImage( "hex", "assets/water_island_N.png" )
  self.atlas:AddImage( "hex2", "assets/river_straight_N.png" )

end

function fn:NewGame()

end

function fn:Update( dt )

end

function fn:Draw()
  for j = 1, 5 do
    for i = 1, 4 do
      local offsetx = 0
      local name = "hex"
      if j % 2 == 0 then
        offsetx = 91
        name = "hex2"
      end
      love.graphics.draw( self.atlas:GetImage( name ), i * 183 + offsetx, j * 80 )
    end
  end



end

return fn
