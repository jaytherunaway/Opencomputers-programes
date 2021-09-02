--ROBOT SETTINGS--
--blocks pre strip--
local far = 10 --change number to amount of block wanted--
--bots name--
local Name = "new bot" --change bot name for broadcast needs " on each side--
--broadcast channel--
local CC = 123 -- change broadcast channel need at least 3 numbers EXP:123,321,423,111--
--Do Not Change Under This Line--
--VARABLES--
local r = require("robot")
local component = require("component")
local d = r.detect()
local event = require("event")
local m = component.modem -- get primary modem component
local inventory = component.inventory_controller
local component = require("component")
local sides = require("sides")
local RNOS = r.inventorySize()
local ISIU = 1
local RSIU = r.select()
local CountDown = 10
local loop = 1
--CODE--
--code loop--
while(loop <= 2) do
--look for start block--
print("looking for next strip")
m.broadcast(123, "looking for next strip", Name)
while(r.detect() == false) do
r.forward()
end
os.execute(clear)
print("found next strip")
m.broadcast(123, "found next strip", Name)

--mine strip--
r.swing()
r.forward()
r.turnLeft()
r.swingUp()
r.swingDown()
for i=1,far do 
r.swing()
r.forward()
r.swingUp()
r.swingDown()

end
r.turnRight()
r.swing()
r.forward()
r.swingUp()
r.swingDown()
r.turnRight()
    
for i=1,far do 
r.swing()
r.forward()
r.swingUp()
r.swingDown()

end  
r.turnRight()
m.broadcast(123, "headed home", Name)

--return home--
while(r.detect() == false) do 
 r.forward()
end
m.broadcast(123, "clearing inventory in 10sec", Name)

--empty invetory--
os.execute("clear")
print ("getting number of slots")
print ("pls wait")
os.sleep(1)
os.execute("clear")
print ("loading...")
os.sleep(3)
os.execute("clear")
print ("slots in chest",inventory.getInventorySize(3))
print ("clearing",inventory.getInventorySize(3),"slots")
print ("in 10SEC")
os.sleep(2)
os.execute("clear")
CountDown = 10
for i=1,10 do
print (CountDown)
os.sleep(1)
os.execute("clear")
CountDown = CountDown - 1
   end
CountDown = 10
ISIU = 1
RSIU = 1
for i=1,inventory.getInventorySize(3) do
if RSIU == RNOS then

else
inventory.dropIntoSlot(3,ISIU)
ISIU = ISIU + 1
RSIU = RSIU + 1
r.select(RSIU)
end
end
if RNOS == RSIU then 
print("im empty")
m.broadcast(123, "Inventory Empty restart in 10sec", Name)
r.select(1)
os.execute("clear")
for i=1,CountDown do
print(CountDown)
CountDown = CountDown - 1
os.sleep(1)
os.execute("clear")
end
r.turnAround()
os.execute("check")
else
print("not enought space to empty")
m.broadcast(123, "Error", Name)
print("RUN (clearinventory)")

end
end