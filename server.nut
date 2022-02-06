local WantedPlayers = []; # Push wanted players here, Calls for request by client
local GaragePloys = []; # Push all garage Polys here
local VehicleRefresh = []; # Push all server vehicles here
local ResprayVehicle = []; # Vehicles requesting respray


function SetWantedLevel(client, val) { 
	if (val => 0 ) WantedPlayers.push(client, val);
	else WantedPlayers.remove(client);
	
	FindPlayer(client).WantedLevel = val
	
	# Testing
	print("Client " + client + " wanted level was set to ("+ val +")");
}

function ResprayVehicle(iD, color1, color2) { 
	local vehicle = FindVehicle(iD);
	vehicle.Colour1 = color1;
	vehicle.Colour2 = color2;
	
	# Testing
	print("Vehicle ID: " + iD + " was resprayed ("+ color1 + ","+ color2 +")");
}

