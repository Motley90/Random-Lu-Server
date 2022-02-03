# Random from scratch server, Motley

#2/3/22

#LU Server


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
	health = 0;
	KdRatio = 0.0;
	
	# Vehicle
	TimesSpawned = 0;
	CurrentVehicle = -1;
	
	# Weapon Ownership
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
};

	
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
    Smallmessage(Player, "Connecting");
}

function onPlayerJoin ( Player ) {
	Message(Player.Name + " has joined");
}

function onPlayerSpawn ( Player , iClass ) {
	Player.VirtualWorld = 69;
}

function onPlayerPart ( Player , iReason ) {
	# Destroy shit nigga
}

function onVehicleRespawn(vehicle) { 
	# Need to hand shit?
}


