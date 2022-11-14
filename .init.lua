local head = require 'components/head'
local nav = require 'components/nav'
local complaints_xhr = require 'api/complaints_xhr'
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
      ServeAsset()
   end
   if GetMethod() == 'POST' then
      complaints_xhr.test()
   end
end
