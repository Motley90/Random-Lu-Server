# Random from scratch server, Motley

#2/3/22

#LU Server

/* 
	Timed methods would be kewl. Should that be client base or server >.<
	I think this random code project should handle data data server side and should function client side

	Don't expect this shit to work out of the box
	Events, functions etc are not being referenced from the wiki I am coding whatever pops in my memory

	Do weird shit. I think I should set all vehicles to running
*/
# Main storage
Data <- array(GetMaxPlayers(), 0);
class CThePlayerData { 
	# Main Player
	Wanted = 0;
	Kills = 0;
	KilledByPlayers = 0;
	Deaths = 0;
	Money = 0;
	Bank = 0;
	Health = 0;
	KdRatio = 0.0;
	
	# Vehicle
	TimesSpawned = 0;
	CurrentVehicle = -1;
	
	# Weapon Ownership
	Weapon = [0,0,0,0,0,0,0,0,0,0,0,0];
	Bat = 0;
	Pistol = 0;
	Uzi = 0; 
	Shotgun = 0;
	Ak47 = 0;
	M16 = 0;
	Snipper = 0;
	RocketLauncher = 0;
	Flamethrower = 0;
	MolotovCocktail = 0;
	Grenade = 0;
	
	#Missions
	Police = false;
};
function SetPlayerData(Player) {
	Data[Player.ID] = CThePlayerData();
	# Do some ini read shit for the class
	// SOME CODE
	
	# Set data
	Player.SetWeapon... // each index, autoset ammo to 9999
	Player.WantedLevel = Data[Player.ID].Wanted;
	Player.Score = Data[Player.ID].Kills;
	Player.Cash = Data[Player.ID].Money;
	Player.Health = Data[Player.ID].Health;
	Player.Armour = Data[Player.ID].Armour;
}
function onScriptLoad() {
	print("Loanding scripts");
	
	# Load Ini
	LoadModule("Lu-Ini");
	
	print("LU INI has loaded"); 
	
	# If any players
	Message("Server Restarted");
}
		   
function onPlayerCommand( pPlayer, szCmd, szParams ) {
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
	SmallMessage(Player, "Look for wanted criminals", 1, 2000);
}
		   
local weaponPrices = [
[1000],
[2000],
[3000],
[4000],
[5000],
[6000],
[7000],
[8000],
[9000],
[10000],
[11000],
[12000],
];
function BuyWeapon(Player, weapon) { 
	if (Data[Player.ID].Money => weaponPrices[weapon]) {
		Data[Player.ID].Weapon[weapon] = 9999;
		Player.SetWeapon(weapon, 9999);
		if (weapon == 1 ) Data[Player.ID].Bat = 1;		
		else if (weapon == 2 ) Data[Player.ID].Pistol = 1;
		else if (weapon == 3 ) Data[Player.ID].Uzi = 1;		
		else if (weapon == 4 ) Data[Player.ID].Shotgun = 1;	
		else if (weapon == 5 ) Data[Player.ID].Ak47 = 1;			
		else if (weapon == 6 ) Data[Player.ID].M16 = 1;			
		else if (weapon == 7 ) Data[Player.ID].Snipper = 1;			
		else if (weapon == 8 ) Data[Player.ID].RocketLauncher = 1;			
		else if (weapon == 9 ) Data[Player.ID].Flamethrower = 1;			
		else if (weapon == 10 ) Data[Player.ID].MolotovCocktail = 1;			
		else if (weapon == 11 ) Data[Player.ID].Grenade = 1;	
			
	}
}
	
