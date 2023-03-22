local head = require 'components/head'
local nav = require 'components/nav'
local background = require 'components/background'
local delegate = require 'delegate'
local xhr = require 'api/xhr'

function OnServerStart()
   ProgramTokenBucket()
end

HidePath('/usr/share/zoneinfo/')
HidePath('/usr/share/ssl/')

function OnHttpRequest()
   local route = GetEffectivePath()
   if GetMethod() == 'GET' then
      if delegate[route] then
         Write(head)
         Write(nav)
         Write(background)
         Write(delegate[route])
      else
         Route()
      end
   -- else
   --    xhr.test()
   end
end
