# Random from scratch server, Motley

#2/3/22

#LU Server

SmallMessage("Connecting", 3500, 2);
print("Script is starting");

/* 
	Timed methods would be kewl. Should that be client base or server >.<
	I think this random code project should handle data data server side and should function client side

	Dont expect this shit to work out of the box
	Events, functions etc are not being referenced from the wiki I am coding whatever pops in my memory
	
	BUMP, CONVERTING TO A CLIENT SCRIPT. i WILL RETURN AT SOME POINT TO CALL SERVER FUNCTIONS
	REMOVE CLASS, REMOVE MANUAL WEAPON INFO, USE A ARRAY SLOT FOR WEAPONS
	
	LETS GO WITH STRAIGHT LOCALS SINCE LOCALS ARE THE FASTEST METHOD
	
	* Wrap all of the basic functions to get called from a fake call server function. I will write the server another day 'SetPlayerData()'
	
	Fix onPlayer blah events not triggering
*/
		# Main Player
//local 		pPlayer = FindLocalPlayer ( );
local		Wanted = 0;
local		Kills = 0;
local		KilledByPlayers = 0;
local		Deaths = 0;
local		Money = 0;
local		Bank = 0;
local		Health = 0;
local		KdRatio = 0.0;
local		x = 0;
local		y = 0;
local		z = 0;
local		skin = -1;
local		hospitalSpawn = false;
local		canSpawnCar = false
local		CarsSpawned = -1;
local		CurrentVehicle = -1;
local		SpawnCarTime = 0;
local		updateAccount = false;
local		updateAccountTime = 0;

local		lastVehicleModel = -1;
local		lastVehiclePositionX = 0;
local		lastVehiclePositionY = 0;
local		lastVehiclePositionZ = 0;
local		lastVehicleColor1 = 0;
local		lastVehicleColor2 = 0;
local		lastVehicleWasOn = false;		

		# Weapon Ownership
local 		weaponOwnership = [ [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12] ];
local		weaponAmmo = [ [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0] ];

		#Missions
local		Police = false;
local		BustedPlayers = 0;
local		PoliceLevel = 0;
local		allowedWeapons = [ [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12] ]; // 1 = level 1. 2 = 20 etc
local		canKill = false; 
local		SendToPoliceStation = false;
local		CanSpawnByWantedPlayer = false;
local		policeVehicleModel = -1;
local		SendToOriginalStation = false;
local		CanWarpToAnotherStation = false;

		#General Mission
local		getBackInCarTime = 0;
local		getBackInCarBool = false;
local		TimerNeeded = false;
local		TempSkin = -1;
local		CanRecreateNewModel = false;

		#Spawn To world
local		canSpawn = false;
local		isLogged = false;
local		dataProcessed = false;

local		TimerUsages = {};
local		Timers = [];

function SetTimer(type, time) { 
	Timers.push(NewTimer("TimedEvent", type, time, 0)); 
}		
			      
function DeleteTimer(func) {
	Timers.rawget(func)
}
			      
# Called on Login
function SetPlayerData() {
	# Do a call server func later, left as an example
	/*Player.SetWeapon...
	Player.WantedLevel = Wanted;
	Player.Cash = Money;
	Player.Health = Health;
	Player.Armour = Armour;
	
	canSpawn = true;
	isLogged = true;
	dataProcessed = true;*/

}
function onScriptLoad() {
	Message("Welcome to the server", Colour(201, 201, 201));
	
	onPlayerJoin(pPlayer);
}

function onPlayerReconnect() {
	# Custom full detection
}

function onPlayerJoin( player ) {
	print(pPlayer.Name + " has joined");

	return 0;

}

function onClientSpawn ( spawn ) {
	print("Test")
	pPlayer.VirtualWorld = 69;
	SetTimer("Account", 1000);
}

function onPlayerPart ( pPlayer , iReason ) {
	#Create Some call server function to send over all client variables to get wrote
}

function onVehicleRespawn(vehicle) { 
	# Need to handle shit?
}

# Gathering Ideas
function PoliceMission(Player) {
	# Wanted Check
	if (Player.WantedLevel > 0 ) MessagePlayer("No criminals wanker", Player);
	
	# Start
	SmallMessage("Look for wanted criminals", 1, 2000); // From memory lu had a get nearest player func
	Police = true;
	getBackInCarTime = 30;
}

# Squirel isn't strict so this will work
local weaponPrice = "000";		   
function BuyWeapon(Player, weapon) { 
	local somePrice = weapon.tostring() + weaponPrice, price = somePrice + weaponPrice;
	if (Money >= price.tointeger()) {
		# If they own it they own it, 9999 ammo
		weaponOwnership[weapon] = true;		
	}
}

function TimedEvent(Usage) {
	switch( Usage ) {
     		case "Police":
		# getBackInCarTime++; // Add a check
		# Check for wanted players
		# Set to start and stop this timer at random
        	break;
      		case "Account":	
		updateAccountTime++;
		# Check if a update is needed
		if ( updateAccountTime == 300) { 
			updateAccount = true;
			updateAccountTime = 0;
			# SomeUpdateFunc
		}
		break;
  	}
  	return true;
}

local		canKill = false; 
local		SendToPoliceStation = false;
local		CanSpawnByWantedPlayer = false;
local		policeVehicleModel = -1;
local		SendToOriginalStation = false;
local		CanWarpToAnotherStation = false;


function onClientEnteredVehicle ( Vehicle, Seat) {
  switch (vehicle.Model) {
  
    case 107:
    case 116:
    case 117: 
    
      if (Seat == 0) {
        PoliceMission(Player);
      }
	  break;
	  
	}
}

function PoliceAbility() { 
  switch (PoliceLevel) {
	case 0; 
	case 1;	
	case 2; 
	case 3; 
	case 4; 
	case 5; 
	case 6; 
	case 7; 
	case 8; 
	case 9; 
	case 10; 		
		allowedWeapons = [ [true], [false], [false], [false], [false], [false], [false], [false], [false], [false], [false], [false] ];
	break;
	
	case 11;	
	case 12; 
	case 13; 
	case 14; 
	case 15; 
	case 16; 
	case 17; 
	case 18; 
	case 19; 
	case 20; 		
		allowedWeapons = [ [true], [true], [false], [false], [false], [false], [false], [false], [false], [false], [false], [false] ];
	break;
	
	case 21;	
	case 22; 
	case 23; 
	case 24; 
	case 25; 
	case 26; 
	case 27; 
	case 28; 
	case 29; 
	case 30; 		
		allowedWeapons = [ [true], [true], [true], [false], [false], [false], [false], [false], [false], [false], [false], [false] ];
	break;
	
	case 31;	
	case 32; 
	case 33; 
	case 34; 
	case 35; 
	case 36; 
	case 37; 
	case 38; 
	case 39; 
	case 40; 		
		allowedWeapons = [ [true], [true], [true], [true], [false], [false], [false], [false], [false], [false], [false], [false] ];
	break;
	
	case 41;	
	case 42; 
	case 43; 
	case 44; 
	case 45; 
	case 46; 
	case 47; 
	case 48; 
	case 49; 
	case 50; 		
		allowedWeapons = [ [true], [true], [true], [true], [true], [false], [false], [false], [false], [false], [false], [false] ];
	break;
	
	case 51;	
	case 52; 
	case 53; 
	case 54; 
	case 55; 
	case 56; 
	case 57; 
	case 58; 
	case 59; 
	case 60; 		
		allowedWeapons = [ [true], [true], [true], [true], [true], [true], [false], [false], [false], [false], [false], [false] ];
	break;
	
	case 61;	
	case 62; 
	case 63; 
	case 64; 
	case 65; 
	case 66; 
	case 67; 
	case 68; 
	case 69; 
	case 70; 		
		allowedWeapons = [ [true], [true], [true], [true], [true], [true], [true], [false], [false], [false], [false], [false] ];
	break;
	
	case 71;	
	case 72; 
	case 73; 
	case 74; 
	case 75; 
	case 76; 
	case 77; 
	case 78; 
	case 79; 
	case 80; 		
		allowedWeapons = [ [true], [true], [true], [true], [true], [true], [true], [true], [false], [false], [false], [false] ];
	break;
	
	case 81;	
	case 82; 
	case 83; 
	case 84; 
	case 85; 
	case 86; 
	case 87; 
	case 88; 
	case 89; 
	case 90; 		
		allowedWeapons = [ [true], [true], [true], [true], [true], [true], [true], [true], [true], [false], [false], [false] ];
	break;
	
	case 91;	
	case 92; 
	case 93; 
	case 94; 
	case 95; 
	case 96; 
	case 97; 
	case 98; 
	case 99; 
	case 100; 		
		allowedWeapons = [ [true], [true], [true], [true], [true], [true], [true], [true], [true], [true], [false], [false] ];
	break;
	
	case 101;	
	case 102; 
	case 103; 
	case 104; 
	case 105; 
	case 106; 
	case 107; 
	case 108; 
	case 109; 
	case 110; 		
		allowedWeapons = [ [true], [true], [true], [true], [true], [true], [true], [true], [true], [true], [true], [false] ];
	break;
	
	case 111;	
	case 122; 
	case 133; 
	case 144; 
	case 155; 
	case 166; 
	case 177; 
	case 188; 
	case 199; 
	case 120; 		
		allowedWeapons = [ [true], [true], [true], [true], [true], [true], [true], [true], [true], [true], [true], [true] ];
	break;
	
	default:	{
					allowedWeapons = [ [true], [true], [true], [true], [true], [true], [true], [true], [true], [true], [true], [true] ];	
			}
}
