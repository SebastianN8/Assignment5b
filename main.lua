-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- Created by: Sebastian N
-- Created on: April 
--
-- This program moves stuff trhough the screen
-----------------------------------------------------------------------------------------

-- Variables
local movingSpeed = 4

-- visual elements 
display.setStatusBar(display.HiddenStatusBar)
local myImage = display.newImageRect('./Assets/Sprites/background.png', 2048, 1536)
myImage.x = display.contentCenterX
myImage.y = display.contentCenterY
myImage.id = 'The background'

-- Snowman
local mySnowman = display.newImageRect('./Assets/Sprites/SnowMan.png', 300, 300)
mySnowman.x = display.contentCenterx 
mySnowman.y = display.contentCentery 
mySnowman.id = 'The SnowMan'
mySnowman.alpha = 1

-- Igloo
local myIgloo = display.newImageRect('./Assets/Sprites/Igloo.png', 300, 300)
myIgloo.x = 0
myIgloo.y = display.contentHeight
myIgloo.id = 'The igloo'
myIgloo.alpha = 1

-- Sound loading
local backgroundNoise = audio.loadSound("./Assets/Sounds/crash.wav")

-- functions that determines the movement of the snowman
local function movingSnowman(event)
	if mySnowman.x < 2048 then
		mySnowman.x = mySnowman.x + movingSpeed
		mySnowman.y = mySnowman.y + (movingSpeed - 1)
	end
end

-- function that determines the movement of the igloo
local function movingIgloo(event)
	if myIgloo.x < 2048 then
		myIgloo.x = myIgloo.x + movingSpeed
		myIgloo.y = myIgloo.y - (movingSpeed - 1)
	end
	if myIgloo.x > 500 and myIgloo.x < 1500 then
		myIgloo.alpha = myIgloo.alpha - 0.00000001
	elseif myIgloo.x > 1600 then
		myIgloo.alpha = myIgloo.alpha + 0.1
	end 
end

-- function that plays a sound when the igloo crashes with the snowman
local function soundIgloo(event)
	if myIgloo.y == mySnowman.y then
	    audio.play(backgroundNoise, { channel=1, loops=0, duration=5000, fadein=500 })
	end
end


-- event listeners
Runtime: addEventListener('enterFrame', movingSnowman)
Runtime: addEventListener('enterFrame', movingIgloo)
Runtime: addEventListener('enterFrame', soundIgloo)