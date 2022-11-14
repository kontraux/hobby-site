local art = require 'pages/art'
local astar = require 'pages/astar'
local blog = require 'pages/blog'
local boids = require 'pages/boids'
local complaints = require 'pages/complaints'
local contact = require 'pages/contact'
local index = require 'index'
local drunk = require 'pages/drunk'
local language = require 'pages/language'
local projection = require 'pages/projection'
local stocks = require 'pages/stocks'
local style = require 'components/style'
local types = require 'pages/types'
local typing = require 'pages/typing'
local zalgo = require 'pages/zalgo'

local delegate = {
    ['/art'] = art, ['/astar'] = astar, ['/blog'] = blog, ['/boids'] = boids, ['/complaints'] = complaints,
    ['/contact'] = contact, ['/drunk'] = drunk, ['/index'] = index, ['/language'] = language,
    ['/projection'] = projection, ['/stocks'] = stocks, ['/style'] = style, ['/types'] = types, ['/typing'] = typing, ['/zalgo'] = zalgo,
    ['/'] = index, [''] = index
}

return delegate