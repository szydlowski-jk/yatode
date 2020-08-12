local fn = {
    imageAtlas = {},
}

function fn:AddImage( name, path )
    self.imageAtlas[ name ] = love.graphics.newImage( path )
end

function fn:GetImage( name )
    return self.imageAtlas[ name ]
end

return fn
