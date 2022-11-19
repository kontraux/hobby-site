local head = require 'components/head'
local nav = require 'components/nav'
local delegate = require 'delegate'

function OnServerStart()
   ProgramTokenBucket()
end

HidePath('/usr/share/zoneinfo/')
HidePath('/usr/share/ssl/')

function OnHttpRequest()
   local route = GetEffectivePath()
   if delegate[route] then
      Write(head)
      Write(nav)
      Write(delegate[route])
   else
      Route()
   end
end
