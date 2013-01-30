-- Version 1.4
-- 27.01.2013

function OnEvent(event, arg, family)

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- On ACTIVATED
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
if (event=="PROFILE_ACTIVATED" and GetRunningTime()< 50) then

	OutputLogMessage("==================== START SCRIPT ====================\n");
	ReleaseAll();
	ClearLog();

	SetMKeyState(1); -- Force M1

	-- INIT Variables for all Race
	SC2WOL = "1";
	SC2HOTS = "2";
	CURRENTGAME = SC2WOL;
	ARMY1 = "1";
	ARMY2 = "2";
	BASES = "5";
	SAVEDACTION = "0";
	SCV_LARVA="s";
	DRONE="d";
	PROBE="e";
	VAR_start=0;

	-- Init globals variables for Zerg	
	QUEEN = "9";
	QueenOK=0;
	TimeLastLarva=0;
	TimeSinceLastLarva=0;

	-- Init globals variables for Terran

	-- Init globals variables for Protoss

end

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- On DEACTIVATED
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
if (event=="PROFILE_DEACTIVATED") then
	-- switch M2 and M1 at desactivation for keyboard and G13
	--SetMKeyState(2,"kb");
	--SetMKeyState(2,"lhc");
	--SetMKeyState(1,"kb");
	--SetMKeyState(1,"lhc");
end

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- On every event do
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
--showMousePosition();
OutputLogMessage("OnEvent = %s, arg = %s\n", event, arg);

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------

-- M1 for Zerg
if (event=="M_PRESSED" and arg==1) then

	-- Init locals variables for Zerg	
	--SetBacklightColor(0,167,0);
	Race=1;
	SelectLarva="s"; -- Key for zerg larva
	VAR_CreatePeon="d" -- Key for create peon
	VAR_CreateArmy1="z"; -- Zergling
	VAR_CreateArmy2="r"; -- Roach
	VAR_CreateArmy3="h"; -- Hydralisk
	VAR_CreateArmy4="t"; -- Mutalisk

end

-- M2 for Terran 
if (event=="M_PRESSED" and arg==2) then
	--SetBacklightColor(0,0,167);
	Race=2;
	VAR_CreatePeon="s"; -- Key for create peon
end

-- M3 for Protoss
if (event=="M_PRESSED" and arg==3) then
	--SetBacklightColor(167,0,0);
	Race=3;
	VAR_CreatePeon="e"; -- Key for create peon
end

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- G1 G2 G7 and G8 For M1, M2 and M3 (All race)
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------

---------------------------------------------------
-- G1, 
---------------------------------------------------
if (event=="G_PRESSED" and arg==1) then
	Init(SC2HOTS);
end	

---------------------------------------------------
-- G7, new game
---------------------------------------------------
if (event=="G_PRESSED" and arg==7) then
	Init(SC2WOL);
end	

---------------------------------------------------
-- G2, Start
---------------------------------------------------
if (event=="G_PRESSED" and arg==2) then
	--OutputLogMessage("OnEvent = %s, arg = %s\n", event, arg);
	OutputLogMessage("VAR_Start Debut = %s\n",VAR_start);
	start();
	OutputLogMessage("VAR_Start Fin = %s\n",VAR_start);
end	

---------------------------------------------------
-- G8, Kitte
---------------------------------------------------
if (event=="G_PRESSED" and arg==8) then
	kitteWithRangedUnits();
	
end	

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- M1 for Zerg
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
if (Race==1) then

------------------------------------------------------------------------------------------------------
-- On every Zerg event do
------------------------------------------------------------------------------------------------------

	if QueenOK==1 then
		TimeSinceLastLarva=GetRunningTime()-TimeLastLarva;
	end

	OutputLogMessage("TimeSinceLastLarva = %s\n", TimeSinceLastLarva);

	-- check if must make larva
	if QueenOK==1 and TimeSinceLastLarva > 35000 then
		MakeLarva()
	end

---------------------------------------------------
-- G3, Mass Zerglings
---------------------------------------------------
	if (event=="G_PRESSED" and arg==3) then
		--saveCurrentAction();
		masseProduction(25, VAR_CreateArmy1);
		-- Select transformation larva and add to group 1
		AddGroup("1",1,1)
		--goToSavedAction();
	end

---------------------------------------------------
-- G9, Mass Roach
---------------------------------------------------
	if (event=="G_PRESSED" and arg==9) then
		masseProduction(25, VAR_CreateArmy2);
		-- Select transformation larva and add to group 2
		AddGroup("2",1,1)
	end

---------------------------------------------------
-- G4, Mass Hydralisk
---------------------------------------------------
	if (event=="G_PRESSED" and arg==4) then
		masseProduction(25, VAR_CreateArmy3);
		-- Select transformation larva and add to group 3
		AddGroup("3",1,1)
	end

---------------------------------------------------
-- G10, Mass Mutalisk
---------------------------------------------------
	if (event=="G_PRESSED" and arg==10) then
		masseProduction(25, VAR_CreateArmy4);
		-- Select transformation larva and add to group 4
		AddGroup("4",1,1)
	end

---------------------------------------------------
-- G5, Nothing
---------------------------------------------------
if (event=="G_PRESSED" and arg==5) then
	--Nothing
end

---------------------------------------------------
-- G11, Nothing
---------------------------------------------------
	if (event=="G_PRESSED"  and arg==11) then
		--Nothing
	end
---------------------------------------------------
-- G6, Nothing
---------------------------------------------------
if (event=="G_PRESSED" and arg==7) then
	--Nothing
end	

---------------------------------------------------
-- G12, Queen make larva
---------------------------------------------------
if (event=="G_PRESSED" and arg==12) then
	MakeLarva()
end

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- M1 for Terran 
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
elseif (Race==2) then
-- Nothing at the moment
------------------------------------------------------------------------------------------------------
-- On every Terran  event do
------------------------------------------------------------------------------------------------------

--Nothing

---------------------------------------------------
-- G3, Nothing
---------------------------------------------------
	if (event=="G_PRESSED" and arg==3) then
		--Nothing
	end

---------------------------------------------------
-- G9, Nothing
---------------------------------------------------
	if (event=="G_PRESSED" and arg==9) then
		--Nothing
	end

---------------------------------------------------
-- G4, Nothing
---------------------------------------------------
	if (event=="G_PRESSED" and arg==4) then
		--Nothing
	end

---------------------------------------------------
-- G10, Nothing
---------------------------------------------------
	if (event=="G_PRESSED" and arg==10) then
		--Nothing
	end

---------------------------------------------------
-- G5, Nothing
---------------------------------------------------
if (event=="G_PRESSED" and arg==5) then
	--Nothing
end

---------------------------------------------------
-- G11, Nothing
---------------------------------------------------
	if (event=="G_PRESSED"  and arg==11) then
		--Nothing
	end
---------------------------------------------------
-- G6, Nothing
---------------------------------------------------
	if (event=="G_PRESSED" and arg==7) then
		--Nothing
	end	

---------------------------------------------------
-- G12, Nothing
---------------------------------------------------
if (event=="G_PRESSED" and arg==12) then
	MakeLarva()
end

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- M3 for Protoss
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
elseif (Race==3) then
-- Nothing at the moment
------------------------------------------------------------------------------------------------------
-- On every Protoss event do
------------------------------------------------------------------------------------------------------

--Nothing

---------------------------------------------------
-- G3, Nothing
---------------------------------------------------
	if (event=="G_PRESSED" and arg==3) then
		--Nothing
	end

---------------------------------------------------
-- G9, Nothing
---------------------------------------------------
	if (event=="G_PRESSED" and arg==9) then
		--Nothing
	end

---------------------------------------------------
-- G4, Nothing
---------------------------------------------------
	if (event=="G_PRESSED" and arg==4) then
		--Nothing
	end

---------------------------------------------------
-- G10, Nothing
---------------------------------------------------
	if (event=="G_PRESSED" and arg==10) then
		--Nothing
	end

---------------------------------------------------
-- G5, Nothing
---------------------------------------------------
if (event=="G_PRESSED" and arg==5) then
	--Nothing
end

---------------------------------------------------
-- G11, Nothing
---------------------------------------------------
	if (event=="G_PRESSED"  and arg==11) then
		--Nothing
	end
---------------------------------------------------
-- G6, Nothing
---------------------------------------------------
	if (event=="G_PRESSED" and arg==7) then
		--Nothing
	end	

---------------------------------------------------
-- G12, Nothing
---------------------------------------------------
if (event=="G_PRESSED" and arg==12) then
	MakeLarva()
end

end

end

---------------------------------------------------
-- Functions
---------------------------------------------------
function Init(gameMode)
	CURRENTGAME = gameMode;
	OutputLogMessage("VAR_Start Init = %s\n",VAR_start);
	ReleaseAll();
	ClearLog();
	VAR_start=0;
	QueenOK=0;
	TimeLastLarva=0;
	TimerQueen=0;
end

---------------------------------------------------

function kitteWithRangedUnits()
	f=0;
	while f<5 do

		PressAndReleaseMouseButton(3);
		Sleep(math.random(1050, 1100)); -- //marine shoot at 0.8608
		PressAndReleaseKey("S"); -- //Stop the units
		Sleep(math.random(100, 110));
		f = f+1;
	end
end

---------------------------------------------------

function MakeLarva()
	saveCurrentAction();
	i=0;
	while i<5 do
		i = i+1;
		PressAndReleaseKey(QUEEN);
		Sleep(math.random(10, 20));
		PressAndReleaseKey("v");
		-- Center mouse on screen and click the left mouse button
		MoveMouseTo(32817,23600);
		Sleep(math.random(10, 20));
		PressAndReleaseKey("backspace")
		Sleep(math.random(30, 50));
		PressAndReleaseMouseButton(1);
		Sleep(math.random(10, 20));
	end
	goToSavedAction();
	TimeLastLarva= GetRunningTime();
	QueenOK=1;
end

---------------------------------------------------

function showMousePosition()
	x, y = GetMousePosition();
	OutputLogMessage("Mouse is at %d, %d\n", x, y);
end

---------------------------------------------------
function saveCurrentAction()
	OutputLogMessage("saveCurrentAction\n");
	PressKey("lctrl")
	Sleep(10);
	PressAndReleaseKey(SAVEDACTION);
	Sleep(10);
	ReleaseKey("lctrl");
	Sleep(10);
end

---------------------------------------------------
function goToSavedAction()
	OutputLogMessage("goToSavedAction\n");
	Sleep(10);
	PressAndReleaseKey(SAVEDACTION, SAVEDACTION);
end

---------------------------------------------------
function masseProduction(amount, UnitType)
	OutputLogMessage("MASSE\n");
	OutputLogMessage(BASES,"\n");
	PressAndReleaseKey(BASES);
	Sleep(math.random(10, 20));


	if (Race==1) then -- Zerg case
		OutputLogMessage("======== ZERG ========\n");
		PressAndReleaseKey(SelectLarva);
		Sleep(math.random(10, 20));
	elseif (Race==2) then -- Marine case
		OutputLogMessage("Marine");
	elseif (Race==3) then -- Protoss case
		OutputLogMessage("Protoss");
	end


	while amount > 0 do
		PressAndReleaseKey(UnitType);
		Sleep(math.random(10, 20));
		amount = amount - 1;
	end
	--Sleep (270);
	--MoveMouseTo(22460, 55207);
	OutputLogMessage("END");
end


---------------------------------------------------
function start()

	-- 1st run
	if VAR_start==0 then
		OutputLogMessage("Function start");
		if CURRENTGAME == SC2WOL then
			SelectWorkers(0);
			UnSelect(3);
			AddGroup("0",0,0);
			PressAndReleaseKey("0");
			UnSelect(2);
			AddGroup("8",0,0);

			SelectWorkers(0);
		end
		
		PressAndReleaseKey("backspace");
		Sleep(math.random(40, 50));

		MoveMouseTo(32819, 23566);
		PressAndReleaseMouseButton(1);
			
		PressKey("lctrl");
		Sleep(math.random(10, 20));

		PressAndReleaseKey(BASES);
		Sleep(math.random(10, 20));

		ReleaseKey("lctrl");
		Sleep(math.random(10, 20));
		
		CreatePeonRandom();

		PressAndReleaseKey(BASES);
		Sleep(math.random(10, 20));

		SelectWorkers(1);

		VAR_start=1;
	
	elseif VAR_start==1 then
		PressAndReleaseKey("0");
		VAR_start=2;

	elseif VAR_start==2 then
		PressAndReleaseKey("8");
		VAR_start=3;

	elseif VAR_start==3 then
		CreatePeon(1);
	end

end

---------------------------------------------------
function CreatePeon(amount)
	OutputLogMessage("CreatePeon Start\n");
	OutputLogMessage(BASES,"\n");

	PressAndReleaseKey(BASES);
	if (Race==1) then -- Zerg case
		OutputLogMessage("======== ZERG ========\n");
		PressAndReleaseKey(SelectLarva);
		Sleep(math.random(10, 20));
	elseif (Race==2) then -- Terran case
		OutputLogMessage("Terran");
	elseif (Race==3) then -- Protoss case
		OutputLogMessage("Protoss");
	end

	i=0;

	while i<amount do
		PressAndReleaseKey(VAR_CreatePeon);
		Sleep(math.random(10, 20));
		i=i+1;
	end

	OutputLogMessage("CreatePeon END\n");
end

---------------------------------------------------
function CreatePeonRandom()
	OutputLogMessage("CreatePeonRandom Start\n");
	OutputLogMessage(BASES,"\n");

	PressAndReleaseKey(BASES);
	PressAndReleaseKey(SCV_LARVA);
	Sleep(math.random(10, 20));
	PressAndReleaseKey(DRONE);
	Sleep(math.random(10, 20));
	PressAndReleaseKey(PROBE);
	Sleep(math.random(10, 20));

	OutputLogMessage("CreatePeonRandom END\n");
end

---------------------------------------------------
function UnSelect(number)
	OutputLogMessage("started unselect\n");
	PressKey("lshift");
	Sleep(math.random(10, 20));
	MoveMouseTo(23564,55693);
	i=0;
	while i<number do
		PressAndReleaseMouseButton(1);
		Sleep(math.random(10, 20));
		i = i + 1;
	end
	ReleaseKey("lshift");
	MoveMouseTo(32819, 23566);
	OutputLogMessage("end unselect\n");
end
---------------------------------------------------
function SelectWorkers(Action)
--Action=0 only select
--Action=1 add
	OutputLogMessage("started selectWorkers action : %s\n",Action);
	PressKey("lctrl");
	Sleep(math.random(10, 20));

	if Action==1 then
		PressKey("lshift");
		Sleep(math.random(10, 20));
	end

	PressAndReleaseKey("F1");
	Sleep(math.random(10, 20));

	if Action==1 then
		ReleaseKey("lshift");
		Sleep(math.random(10, 20));
	end

	ReleaseKey("lctrl");
	Sleep(math.random(10, 20));
	
	OutputLogMessage("end selectWorkers\n");
end

---------------------------------------------------
function AddGroup(Group,Action,Safe)
--Action=0 only select
--Action=1 add
--Safe=1 add only same type of the 1st unit

	if Safe==1 then
		OutputLogMessage("AddGroup\n");
		Sleep(math.random(10, 20));
		MoveMouseTo(23564,55693);
		Sleep(math.random(10, 20));
		PressKey("lctrl");
		Sleep(math.random(10, 20));
		PressAndReleaseMouseButton(1);
		Sleep(math.random(10, 20));
		ReleaseKey("lctrl");
		Sleep(math.random(10, 20));
	else
		PressAndReleaseKey(Group);
	end

	if Action==0 then
		PressKey("lctrl");
		Sleep(math.random(10, 20));
	elseif Action==1 then
		PressKey("lshift");
		Sleep(math.random(10, 20));
	end

	PressAndReleaseKey(Group);
	Sleep(math.random(10, 20));

	if Action==0 then
		ReleaseKey("lctrl");
		Sleep(math.random(10, 20));
	elseif Action==1 then
		ReleaseKey("lshift");
		Sleep(math.random(10, 20));
	end

	PressAndReleaseKey(Group);
end

---------------------------------------------------
function ReleaseAll()
	ReleaseKey("lctrl");
	ReleaseKey("lshift");
end
