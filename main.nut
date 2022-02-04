# Random from scratch server, Motley

#2/3/22

#LU Server

/* 
	Timed methods would be kewl. Should that be client base or server >.<
	I think this random code project should handle data data server side and should function client side

	Don't expect this shit to work out of the box
	Events, functions etc are not being referenced from the wiki I am coding whatever pops in my memory
	
	BUMP, CONVERTING TO A CLIENT SCRIPT. i WILL RETURN AT SOME POINT TO CALL SERVER FUNCTIONS
	REMOVE CLASS, REMOVE MANUAL WEAPON INFO, USE A ARRAY SLOT FOR WEAPONS
	
	LETS GO WITH STRAIGHT LOCALS SINCE LOCALS ARE THE FASTEST METHOD
*/
		# Main Player
local		Wanted = 0;
local		Kills = 0;
local		KilledByPlayers = 0;
local		Deaths = 0;
local		Money = 0;
local		Bank = 0;
local		Health = 0;
local		KdRatio = 0.0;
	
		# Vehicle
local		TimesSpawned = 0;
local		CurrentVehicle = -1;
	
		# Weapon Ownership
local 		weaponOwnership = [ [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12] ];
	
		#Missions
local		Police = false;

function SetPlayerData(Player) {
	# Do a call server func later, left as an example
	Player.SetWeapon...
	Player.WantedLevel = Wanted;
	Player.Cash = Money;
	Player.Health = Health;
	Player.Armour = Armour;
}
function onScriptLoad() {
	print("Loanding scripts");
	Message("Welcome to the server");
}
		   

function onPlayerCommand( pPlayer, szCmd, szParams ) {
	# Needs to be a call server function that gets the data to create the car, Client just verifies
	if ( szCmd == "spawncar" ) {
		if ( szParams ) {
			local pTemp = split( szParams, " " );
			if ( IsNum( pTemp[ 0 ] ) ) ID = pTemp[ 0 ].tointeger();
			
			if ( ( ID >= 90 ) && ( ID <= 150 ) ) {
				MessagePlayer( "Spawning a vehicle for you...", pPlayer );
				local vehicle = CreateVehicle( ID, pPlayer.Pos, pPlayer.Angle );
				vehicle.OneTime = truel
				vehicle.RespawnTime = 300; #Five minute delete
				MessagePlayer( "The vehicle ID ["+ID+"] was created for you", pPlayer );
				Data[pPlayer.ID].TimesSpawned++;

			}
		}
		return true;
	}

	if ( szCmd == "health" ) {
		pPlayer.Health = 100;
		Message("Nab " + pPlayer.Name + " has healed"); 
		return true;
	}

	if ( szCmd == "armour" )		
		pPlayer.Armour = 100;
		Message("Nab " + pPlayer.Name + " has armoured up"); 
		return true;
	}

	if ( szCmd == "goto" ) {
		if ( !szParams ) MessagePlayer( "You must specify some lil shit to go to", pPlayer );
		else
		{
			local pTemp = split( szParams, " " ), p = FindPlayer( pTemp[ 0 ] );
			if ( p )
			{
				if ( p.Spawned )
				{
					Message( "Taking this fucker " + pPlayer.Name + " to this fucker " + p.Name, Colour( 0, 223, 0 ) );
					pPlayer.Pos = p.Pos;
					pPlayer.Pos.y += 5;
					pPlayer.Pos.z += 2;
				}
				else MessagePlayer( "This person isn't spawned nub!", pPlayer );
			}
			else MessagePlayer( "Can't find anyone with that id/nick", pPlayer );
		}
		return true;
	}

	return 1;
}

function onPlayerReconnect() {
	# Custom full detection
}

function onPlayerConnect ( Player ) {
    Smallmessage(Player, "Connecting", 2000, 1);
}

function onPlayerJoin ( Player ) {
	Message(Player.Name + " has joined");
}

function onPlayerSpawn ( Player , iClass ) {
	Player.VirtualWorld = 69;
}

function onPlayerPart ( Player , iReason ) {
	# Destroy shit nigga
	// SOME CODE
	
	#Store last known data from the player and class to the account
	// SOME CODE
}

function onVehicleRespawn(vehicle) { 
	# Need to handle shit?
}

# Gathering Ideas
function PoliceMission(Player) {
	# Wanted Check
	if (Player.WantedLevel > 0 ) MessagePlayer("No criminals wanker", Player);
	
	# Start
	SmallMessage("Look for wanted criminals", 1, 2000);
}

# Squirel isn't strict so this will work
local weaponPrice = "000		   
function BuyWeapon(Player, weapon) { 
	local somePrice = weapon.tostring(), price = somePrice + weaponPrice;
	if (Money => price.tointeger()) {
		# If they own it they own it, 9999 ammo
		weaponOwnership[weapon] = true;		
	}
}
