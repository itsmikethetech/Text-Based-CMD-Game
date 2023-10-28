@echo off
color F0
echo.    
echo.    
echo                   ,     \    /      ,        
echo                  / \    )\__/(     / \       
echo                 /   \  (_\  /_)   /   \      
echo            ____/_____\__\@  @/___/_____\____ 
echo           ^|             ^|\../^|              ^|
echo           ^|              \VV/               ^|
echo           ^|       Guardians of Dale         ^|
echo           ^|_________________________________^|
echo            ^|    /\ /      \\       \ /\    ^| 
echo            ^|  /   V        ))       V   \  ^| 
echo            ^|/     `       //        '     \^| 
echo            `              V                '
echo.
echo Mayor: "Welcome, Guardian. May I have your name?" 
echo      (Enter your name and press Enter)
echo.
set /p playername=
cls
set /a gp=0
set /a health=100
set /a mana=10
set /a ratskilled=0
set head=None
set body=None
set weapon=Fist
set /a weapondmg=5
set /a daleliar="0"
set /a quest1complete=0
SET /A RAND=%RANDOM%%%100+1

:HOME
echo Mayor: "Hello, %playername%! I'm so glad you're here! Our town has been attacked almost weekly!"
echo.
echo 1. "What has been attacking you?"
echo 2. "No problem! I'll take care of whatever you're up against."
echo 3. "I have no reason to help you... what's in it for me?"

set /p willhelp1=

if '%willhelp1%'=='1' goto QUESTION1
if '%willhelp1%'=='2' goto LETSGO1
if '%willhelp1%'=='3' goto DENY1
if '%willhelp1%'=='4' goto SW

goto HOME

:SW

Telnet Towel.blinkenlights.nl
goto SW

:QUESTION1
cls
echo Mayor: "I guess that's pretty important... we've been visited fortnightly by a large green dragon. Can you help?"
echo.
echo 1. "Let's do this!"
echo 2. "Forget it!"

set /p willhelp1=

if '%willhelp1%'=='1' goto LETSGO1
if '%willhelp1%'=='2' goto DENY1

goto QUESTION1

:DENY1
cls
echo Mayor: "Of course, we wouldn't expect you to assist us without proper compensation. Prove to us you've killed the dragon and we'll reward you handsomly. 
echo Here's a few gold coins to get you started."
echo.
set /a gp = gp + 50
echo You recieve 50gp. You now have %gp%gp total.
echo.
echo 1. "Fair enough... Let's do this!"

set /p willhelp1=

if '%willhelp1%'=='1' goto LETSGO1

goto DENY1

:LETSGO1
cls
echo Mayor: "THANK YOU! I knew I could count on you. We think he's just beyond the hills. You may want to head into town to get equipment first."
echo.
echo 1. Go into town.
echo 2. Head to the dragon.

set /p direction2=

if '%direction2%'=='1' goto TOWN_DALE
if '%direction2%'=='2' goto HILLS

goto LETSGO1

:TOWN_DALE
cls
echo            ___________________
echo           ^|                  ^|         Equipment
echo           ^|     Welcome      ^|         _______
echo           ^|     to DALE      ^|         
echo           ^|                  ^|         Head: %head%
echo           ^|__________________^|         Body: %body%
echo                    ^|   ^|               Weapon: %weapon%
echo                    ^|   ^|
echo                    ^|   ^|
echo                    ^|   ^|
echo \      ./  /      \^|___^|/.     /   \          / /
echo __________________________________________________________
echo.
echo          You have %gp%gp, %health% HP, and %mana% mana. 
echo __________________________________________________________
echo.
echo You enter a bustling town full of shops, entertainment, and housing.
echo.
echo 1. Go to the shops.
echo 2. Listen to the town bard.
echo 3. Speak to the townspeople.
echo 4. Leave town.
echo 5. [Save Game]
echo 6. [Load Game]
echo.
set /p daleoptions=
echo.
if '%daleoptions%'=='1' goto SHOP
if '%daleoptions%'=='2' goto CONCERT
if '%daleoptions%'=='3' goto TOWNSPEOPLE
if '%daleoptions%'=='4' goto HILLS
if '%daleoptions%'=='5' goto SAVE
if '%daleoptions%'=='6' goto LOAD

goto TOWN_DALE

:SAVE
echo Writing attributes to file...
echo.
@echo @ECHO OFF> %playername%.bat
echo Saving gold...
@echo set /a gp=%gp% >> %playername%.bat
echo Saving player name... 
@echo set playername=%playername% >> %playername%.bat
echo Saving mana... 
@echo set /a mana=%mana% >> %playername%.bat
echo Saving quest progress... 
@echo set /a ratskilled=%ratskilled% >> %playername%.bat
@echo set /a daleliar=%daleliar% >> %playername%.bat
@echo set /a quest1complete=%quest1complete% >> %playername%.bat
echo Saving Inventory... 
@echo set head=%head% >> %playername%.bat
@echo set body=%body% >> %playername%.bat
@echo set weapon=%weapon% >> %playername%.bat
@echo set /a weapondmg=%weapondmg% >> %playername%.bat
echo.
echo Complete.
echo.
echo Game Saved.
echo.
pause
goto TOWN_DALE

:LOAD
cls
call %playername%.bat
echo Game loaded!
pause
goto TOWN_DALE


:TOWNSPEOPLE
cls
echo You walk into the town center and look around. You see various townspeople milling about.
echo.
echo 1. Talk to the Mayor.
echo 2. Talk to Yaneli.
echo 3. Talk to Rustov.
echo 4. Go back.

set /p townspeopleoptions=
echo.
if '%townspeopleoptions%'=='1' goto MAYORDALE
if '%townspeopleoptions%'=='2' goto YANELI
if '%townspeopleoptions%'=='3' goto TOWNSPEOPLE
if '%townspeopleoptions%'=='4' goto TOWN_DALE

goto TOWNSPEOPLE

:MAYORDALE

cls
IF "%daleliar%"=="0" (
echo Mayor: "Hello again, %playername%, how can I help you? Any news about our dragon problem?"
) ELSE (
echo Mayor: "Oh, it's you... what do you want?"
)
echo.
echo 1. "Just stocking up on equipment before I go."
echo 2. "Yeah, uhh, all taken care of!"
echo 3. Go Back
IF "%daleliar%"=="0" (
echo 4. "I could use an advance on that reward, I may need some equipment before I go." )

set /p mayoroptions1=

if '%mayoroptions1%'=='1' goto MAYORDALE1
if '%mayoroptions1%'=='2' goto MAYORDALE2
if '%mayoroptions1%'=='3' goto TOWNSPEOPLE
if '%mayoroptions1%'=='4' goto MAYORDALE4


goto MAYORDALE

:MAYORDALE1
cls
echo Mayor: "Ok, well come see me once you have. We're all counting on you."
echo.
pause

goto MAYORDALE

:MAYORDALE2
cls
set /a daleliar="1"
echo Mayor: "We don't take kindly to liars around here, %playername%. This is a serious issue."
echo.
pause

goto MAYORDALE

:MAYORDALE4
cls
echo Mayor: "Alright, I had assumed you already had your own equipment, but I suppose I could give you an advance on your reward."
echo.
set /a daleliar="1"
set /a gp = gp + 25
echo You recieve 25gp. You now have %gp%gp.
pause

goto MAYORDALE

:YANELI
cls
IF %ratskilled% GTR 2 (
echo Thank you so much! Come visit me at the Rations shop for your reward.
echo.
pause
goto TOWN_DALE
) ELSE (
echo Yaneli: "Hey, hey you! %playername%, right? I could use a bit of help at my shop, would you be willing to help?"
echo.
echo 1. Sure, what's the problem?
echo 2. No thanks, I don't have time for odd jobs.
echo.
)
set /p yaneli1=

if '%yaneli1%'=='1' goto YANELIQUEST
if '%yaneli1%'=='2' goto TOWNSPEOPLE

goto YANELI


:YANELIQUEST

cls
echo Yaneli: "Oh, good! I own the Rations Shop in town. We've got a bit of a rat problem, and I'd much prefer nobody found out. There's an entrance to the basement inside. Please head down and kill at least 3 before returning."
echo.
echo 1. You can count on me!
echo.
pause
goto TOWNSPEOPLE


:SHOP
cls
echo You walk into the town square and see various shops along the main road.
echo.
echo 1. Go to Blacksmith
echo 2. Go to the Rations Shop
echo 3. Go to "Potters Potions"
echo 4. Go back to town.
echo.

set /p shopchoice=

if '%shopchoice%'=='1' goto blacksmith
if '%shopchoice%'=='2' goto rations
if '%shopchoice%'=='3' goto potters
if '%shopchoice%'=='4' goto TOWN_DALE


goto SHOP

:BLACKSMITH
cls

echo You enter the Blacksmith shop. You see various crude steel swords and armor pieces. A rugged-looking elder dwarf approaches.
echo.
echo Tribyjorn: "The names Tribyjorn, what might ye be looking for?"
echo.
echo 1. Show me your wares.
echo 2. Just browsing.
echo.
set /p blacksmithchoice=

if '%blacksmithchoice%'=='1' goto BLACKSMITHINVENTORY
if '%blacksmithchoice%'=='2' goto TOWN_DALE

goto BLACKSMITH

:BLACKSMITHINVENTORY
cls
echo You currently have %gp%gp.
echo.
echo Tribyjorn: "Ah, you come looking for weapons? A helm, perhaps?"
echo.
echo 1. Short Sword - 50gp
echo 2. Iron Helmet - 100gp
echo 3. Studded Leather Armor - 150gp
echo 4. "Nothing for now, thanks."

set /p blacksmithpurchase=

if '%blacksmithpurchase%'=='1' goto BUYSWORD
if '%blacksmithpurchase%'=='2' goto BUYHELM
if '%blacksmithpurchase%'=='3' goto BUYARMOR
if '%blacksmithpurchase%'=='4' goto TOWN_DALE

goto BLACKSMITHINVENTORY

:BUYSWORD
cls
IF %gp% GEQ 50 (
set /a gp = gp - 50
set weapon=Short Sword
set /a weapondmg=20
echo Tribyjorn: "It's dangerous to go alone... take this."
echo.
echo You recieve a Short Sword.
pause
) ELSE (
echo Tribyjorn: "Sorry, you don't have enough for that..."
echo.
pause
)
goto BLACKSMITH

:BUYHELM
cls
IF %gp% GEQ 100 (
set /a gp = gp - 100
set head=Iron Helmet
echo Tribyjorn: "A fine choice. Please come again."
echo.
echo You recieve an Iron Helmet.
pause
) ELSE (
echo Tribyjorn: "Sorry, you don't have enough for that..."
echo.
pause
)
goto BLACKSMITH

:BUYARMOR
cls
IF %gp% GEQ 150 (
set /a gp = gp - 150
set body=Studded Leather Armor
echo Tribyjorn: "A fine choice. Please come again."
echo.
echo You recieve a Studded Leather Armor.
pause
) ELSE (
echo Tribyjorn: "Sorry, you don't have enough for that..."
echo.
pause
)
goto BLACKSMITH

:RATIONS
cls
echo Yaneli: "Oh, hello again %playername%. Come to assist with our... little problem?"
echo.
echo You've currently killed %ratskilled% rodents.
echo.
echo 1. "It's clobberin' time!" [head to basement]
echo 2. "Actually, not just yet."
IF %ratskilled% GTR 2 (

echo 3. "Already done!" 

)
echo.
set /p rationschoice=

if '%rationschoice%'=='1' goto RATIONSBASEMENT
if '%rationschoice%'=='2' goto SHOP
if '%rationschoice%'=='3' goto QUEST1REWARD

goto RATIONS


:QUEST1REWARD
IF %quest1complete% EQU 0 (	 
cls
echo Yaneli: "Thank you so much! Here's your reward.:
set /a gp = gp + 50
set /a quest1complete="1"
echo You recieve 50gp! You now have %gp%gp.
pause
goto RATIONS
) ELSE (
cls
echo "You've already completed this quest..."
pause
goto RATIONS
)
pause
goto RATIONS

:RATIONSBASEMENT
cls
echo You enter a basement. You can see a bit of damage from the infestation.
echo.
pause
cls
echo You encountered a SMALL RAT!
echo.
color C0
@echo off 
ping localhost -n 2 >NUL
color 04
@echo off 
ping localhost -n 2 >NUL
color C0
@echo off 
ping localhost -n 2 >NUL
color 04
@echo off 
ping localhost -n 2 >NUL
color F0
pause
set /a rathp=50
goto RAT

:RAT
cls
IF %rathp% LEQ 1 (
cls
goto WIN
) else (
color 04
echo.
echo You currently have %health% HP.
echo.
echo               ^(\_/^)
echo       .-""-.-.-' a\        Small Rat
echo      /  \      _.--'       HP: %rathp%
echo     ^(\  /_---\\_\_
echo      `'-.
echo       ,__^)        ^(Art by "jgs"^)
echo.
echo.
echo 1. Attack with %weapon%.
echo 2. Run Away
echo.
)
set /p battlerat=

if '%battlerat%'=='1' goto ATTACKRAT
if '%battlerat%'=='2' goto RATIONS


goto RAT

:ATTACKRAT
echo off
SET /A DMG=%RANDOM%%%%weapondmg%+1
echo off
set /a rathp=%rathp% - DMG
echo You attack with your %weapon% doing %DMG% damage.
echo.
color C0
@echo off 
ping localhost -n 2 >NUL
color 04
@echo off 
ping localhost -n 2 >NUL
echo.
goto RATSTURN

:RATSTURN
SET /A DMG=%RANDOM%%%5+1
set /a health=%health% - DMG
echo The Small Rat bites you, doing %DMG% damage.
echo.
color C0
@echo off 
ping localhost -n 2 >NUL
color 04
@echo off 
ping localhost -n 2 >NUL
pause
goto RAT

:WIN
gpwin=%RANDOM%%%5+1
echo You slayed the rat.
set /a ratskilled = ratskilled + 1
set /a gp = %gp% + %gpwin%
echo You found $gpwin% gp.
echo.
pause

goto RATIONS

:CONCERT
cls
echo You walk towards the bard. He plays a bright, fun medley of music.
pause
cls
IF %gp% GTR 0 (
set /a gp = gp - 1
echo You tip the bard 1gp.
start /min music.bat
) else (
echo You currently don't have enough gold pieces to leave a tip, but the bard plays on...
start /min music.bat
)
pause
goto TOWN_DALE

:HILLS
cls

start https://www.youtube.com/watch?v=dQw4w9WgXcQ
pause
goto TOWN_DALE

:POTTERS
cls
echo                                             ((     )) 
echo            ___________________________       ((    ))
echo           ^|              Potter's Pot\       ((   ))
echo           ^|         _____            ^|__     ((   ))
echo           ^|        ^|     \              \_  ((  ))
echo           ^|        ^|      \               \((  ))
echo           ^|        ^|       \___            \  ))
echo           ^|        ^|__________^|            ^|))
echo           ^|                                ^|
echo           ^|                                ^| 
echo \      ./ ^|                                ^|
echo _\______/_^|____\/_____________________\____^|.________
echo.
echo "Potter's Potions" looks to have been destroyed by the dragon. 
echo.
echo You can repair this building with the proper resources.
echo.
echo You'll need 2,000gp, 20 Lumber, and 30 Limestone to repair this building.
echo.
echo You currently have %gp%gp, 0 Lumber, and 0 Limestone...
echo.
pause
goto TOWN_DALE










