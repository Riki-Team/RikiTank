-- 
-- @file main.lua
-- This file is a part of RikiTank project, an amazing tank game !
-- Copyright (C) 2012  Riki-Team
-- 
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
-- 

require "Tank"
require "Sound"
require "Ground"
require "Menu"
require "Entities"
require "Tir"

ChoixMap = 1
Reso = {
   Width,
   Height,
   Scale
}
resolution()

Tank = {
   Choix = 1,
   Position = {x = 1024, y = 768},
   OldPosition = {x, y},
   Vitesse = Speed,
   Angle = {Base = 0, Tourelle = 0},
   RotTourelleWidth = 0,
   Health = 0,
   Dammage = 0,
   CadenceTir = 0,
   Tir = 10,
   Score = 0
}

-- Cette fonction est appelee une seule fois, on charge un max de truc ici au debut du jeu
-- pour economiser les ressources systemes au maximum.
function love.load()
   ents.Startup()
   ChoixTankLoad()
   SoundMenu()
   GroundLoad()
   ShootLoad()

   ---------------------------------------
   -- Chargement des differents ennemies -
   ---------------------------------------
   tankEnnemiePic = love.graphics.newImage("Images/BaseTank4.png")
   walker_z = love.graphics.newImage("Images/Walker.png")
   local walker_1 = ents.Create("Walker", 100, 100)
   Missile = love.graphics.newImage("Images/Missile.png")
   TankLoad()
end

function love.draw()
   EtatJeuDraw()
end

--Cette fonction est appel�e en permanence
--'dt' = "delta temps", nombre de secondes depuis la derni�re fois que cette fonction a �t� appel�e

function love.update(dt)
   if EtatJeu == "EnJeu" then		-- si l'�tat du jeu est Play
      TankUpdate(dt)			-- on actualise la position du tank
      ents:update(dt)			-- on actualise la position des bots
   end
end
