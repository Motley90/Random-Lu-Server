# Register client calls. when wantedlevel needs to be set call the function to update WantedPlayers. Clinet grabs this in one segment
# Prepare a fake poly function, Should work will expand and test another day
# Server vehicles are buggy. I want fresh instances created. Destroy vehicle respawn event. Vehicles will be OneTime and get a new creation for the same time period
# A server vehicle the player grabbed will be for the player and the server will recreate a new one

# LU does not respawn vehicles with a different color in content.xml. In my method make sure they do
# Add ps2 vehicle colors. They are much prettier and still in standards.

local WantedPlayers = []; # Push wanted players here, Calls for request by client
local GaragePloys = []; # Push all garage Polys here
local VehicleRefresh = []; # Push all server vehicles here
local ResprayVehicle = []; # Vehicles requesting respray


function SetWantedLevel(client, val) { 
	if (val => 0 ) WantedPlayers.push(client, val);
	else WantedPlayers.remove(client);
	
	FindPlayer(client).WantedLevel = val;
	
	# Testing
	print("Client (" + client + ") wanted level was set to ("+ val +")");
}

function ResprayVehicle(iD, color1, color2) { 
	local vehicle = FindVehicle(iD);
	vehicle.Colour1 = color1;
	vehicle.Colour2 = color2;
	
	# Testing
	print("Vehicle ID: (" + iD + ") was resprayed ("+ color1 + ","+ color2 +")");
}

