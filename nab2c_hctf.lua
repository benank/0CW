--
-- Copyright (c) 2005 Pandemic Studios, LLC. All rights reserved.
--

-- load the gametype script
    Conquest = ScriptCB_DoFile("ObjectiveConquest")
    ScriptCB_DoFile("setup_teams") 

--  Empire Attacking (attacker is always #1)
    CIS = 1
    REP = 2
    GAR = 3
--  These variables do not change
    ATT = 1
    DEF = 2
    
 ---------------------------------------------------------------------------
 -- FUNCTION:    ScriptInit
 -- PURPOSE:     This function is only run once
 -- INPUT:
 -- OUTPUT:
 -- NOTES:       The name, 'ScriptInit' is a chosen convention, and each
 --              mission script must contain a version of this function, as
 --              it is called from C to start the mission.
 ---------------------------------------------------------------------------
function ScriptPostLoad()
	KillObject("com_item_healthrecharge")
	KillObject("com_item_weaponrecharge")
	KillObject("com_item_weaponrecharge0")
	KillObject("com_item_weaponrecharge1")
	KillObject("com_item_weaponrecharge2")
	KillObject("com_item_weaponrecharge3")
	KillObject("com_item_weaponrecharge4")
	KillObject("com_item_weaponrecharge5")
	KillObject("com_item_weaponrecharge6")
	KillObject("com_item_weaponrecharge7")
	KillObject("com_item_weaponrecharge8")
	KillObject("com_item_healthrecharge0")
	KillObject("com_item_healthrecharge1")
	KillObject("com_item_healthrecharge2")
	KillObject("com_item_healthrecharge3")
	KillObject("com_item_healthrecharge4")
	KillObject("com_item_healthrecharge5")
	KillObject("com_item_healthrecharge6")
	KillObject("com_item_healthrecharge7")
	KillObject("com_item_healthrecharge8")
	DisableBarriers("cambar1")
	DisableBarriers("cambar2")
	DisableBarriers("cambar3")
	DisableBarriers("turbar1")
	DisableBarriers("turbar2")
	DisableBarriers("turbar3")
	DisableBarriers("camveh")
    SetMapNorthAngle(180, 1)
    AddAIGoal (GAR, "Deathmatch", 100)
 
	AICanCaptureCP("CP1", GAR, false)
	AICanCaptureCP("CP2", GAR, false)
	AICanCaptureCP("CP3", GAR, false)
	AICanCaptureCP("CP4", GAR, false)
	AICanCaptureCP("CP5", GAR, false)
	AICanCaptureCP("CP6", GAR, false)
   
    --This defines the CPs.  These need to happen first
    cp1 = CommandPost:New{name = "CP1"}
    cp2 = CommandPost:New{name = "CP2"}
    cp3 = CommandPost:New{name = "CP3"}
    cp4 = CommandPost:New{name = "CP4"}
    cp5 = CommandPost:New{name = "CP5"}
    cp6 = CommandPost:New{name = "CP6"}
    
    --This sets up the actual objective.  This needs to happen after cp's are defined
    conquest = ObjectiveConquest:New{teamATT = ATT, teamDEF = DEF, 
                                     textATT = "game.modes.con", 
                                     textDEF = "game.modes.con2",
                                     multiplayerRules = true}
    
    --This adds the CPs to the objective.  This needs to happen after the objective is set up
    conquest:AddCommandPost(cp1)
    conquest:AddCommandPost(cp2)
    conquest:AddCommandPost(cp3)
    conquest:AddCommandPost(cp4)
    conquest:AddCommandPost(cp5)
    conquest:AddCommandPost(cp6)
  
  
	----------------------------------------------------------------------------------------
	scanner = OnObjectDamage(function(object, damager)
		if GetObjectLastHitWeaponClass(object) == "imp_weap_inf_scanner" and GetObjectTeam ~= 0 then
			if GetObjectTeam(object) == 2 then
				AttachEffectToMatrix(CreateEffect("com_sfx_red"), GetEntityMatrix(object))
			end
			if GetObjectTeam(object) == 3 then
				AttachEffectToMatrix(CreateEffect("com_sfx_blue"), GetEntityMatrix(object))
			end
			if GetObjectTeam(object) == 1 then
				AttachEffectToMatrix(CreateEffect("com_sfx_red"), GetEntityMatrix(object))
			end
		end
    end)
	
	unitsAlive = {}

	unitSpawn = OnCharacterSpawn(
    function(character)
        playerInfo = {playerUnit = GetCharacterUnit(character), playerTeam = GetCharacterTeam(character)--, this comma is only necessary if you add more info
                           --any other info you want to record
                         }
        unitsAlive[character] = playerInfo
    end)


 pingcount = 0	

	pingtimer1 = CreateTimer("pingtimer1")
	SetTimerValue(pingtimer1, 30)
	OnTimerElapse(
	  function(timer)
		for i, v in pairs(unitsAlive) do
			unit = GetCharacterUnit(i)                  --**Add these lines**
			playerTeam = GetCharacterTeam(i)      --"
			--local x, y, z = GetWorldPosition(unit)
			if playerTeam == 2 and unit ~= nil then
				pingcount = pingcount + 1;
				CreateEntity("com_item_null", GetEntityMatrix(unit), "ping"..pingcount)
				MapAddEntityMarker("ping"..pingcount, "hud_objective_icon1", 2.5, 1, "BLUE", true, true, true)
			end
		end
		SetTimerValue(pingtimer1, 30)
		StartTimer(pingtimer1)
		StartTimer(pingtimer2)
	  end,
	pingtimer1
	)
	
	
	pingtimer2 = CreateTimer("pingtimer2")
	SetTimerValue(pingtimer2, 15)
	OnTimerElapse(
	  function(timer)
		if pingcount == 1 then
			MapRemoveEntityMarker("ping1")
			DeleteEntity("ping1")
		end
		if pingcount == 2 then
			MapRemoveEntityMarker("ping1")
			MapRemoveEntityMarker("ping2")
			DeleteEntity("ping1")
			DeleteEntity("ping2")
		end
		if pingcount == 3 then
			MapRemoveEntityMarker("ping1")
			MapRemoveEntityMarker("ping2")
			MapRemoveEntityMarker("ping3")
			DeleteEntity("ping1")
			DeleteEntity("ping2")
			DeleteEntity("ping3")
		end
		if pingcount == 4 then
			MapRemoveEntityMarker("ping1")
			MapRemoveEntityMarker("ping2")
			MapRemoveEntityMarker("ping3")
			MapRemoveEntityMarker("ping4")
			DeleteEntity("ping1")
			DeleteEntity("ping2")
			DeleteEntity("ping3")
			DeleteEntity("ping4")
		end
		if pingcount == 5 then
			MapRemoveEntityMarker("ping1")
			MapRemoveEntityMarker("ping2")
			MapRemoveEntityMarker("ping3")
			MapRemoveEntityMarker("ping4")
			MapRemoveEntityMarker("ping5")
			DeleteEntity("ping1")
			DeleteEntity("ping2")
			DeleteEntity("ping3")
			DeleteEntity("ping4")
			DeleteEntity("ping5")
		end
		if pingcount == 6 then
			MapRemoveEntityMarker("ping1")
			MapRemoveEntityMarker("ping2")
			MapRemoveEntityMarker("ping3")
			MapRemoveEntityMarker("ping4")
			MapRemoveEntityMarker("ping5")
			MapRemoveEntityMarker("ping6")
			DeleteEntity("ping1")
			DeleteEntity("ping2")
			DeleteEntity("ping3")
			DeleteEntity("ping4")
			DeleteEntity("ping5")
			DeleteEntity("ping6")
		end
		if pingcount == 7 then
			MapRemoveEntityMarker("ping1")
			MapRemoveEntityMarker("ping2")
			MapRemoveEntityMarker("ping3")
			MapRemoveEntityMarker("ping4")
			MapRemoveEntityMarker("ping5")
			MapRemoveEntityMarker("ping7")
			DeleteEntity("ping1")
			DeleteEntity("ping2")
			DeleteEntity("ping3")
			DeleteEntity("ping4")
			DeleteEntity("ping5")
			DeleteEntity("ping6")
			DeleteEntity("ping7")
		end
		if pingcount == 8 then
			MapRemoveEntityMarker("ping1")
			MapRemoveEntityMarker("ping2")
			MapRemoveEntityMarker("ping3")
			MapRemoveEntityMarker("ping4")
			MapRemoveEntityMarker("ping5")
			MapRemoveEntityMarker("ping7")
			MapRemoveEntityMarker("ping8")
			DeleteEntity("ping1")
			DeleteEntity("ping2")
			DeleteEntity("ping3")
			DeleteEntity("ping4")
			DeleteEntity("ping5")
			DeleteEntity("ping6")
			DeleteEntity("ping7")
			DeleteEntity("ping8")
		end
		if pingcount == 9 then
			MapRemoveEntityMarker("ping1")
			MapRemoveEntityMarker("ping2")
			MapRemoveEntityMarker("ping3")
			MapRemoveEntityMarker("ping4")
			MapRemoveEntityMarker("ping5")
			MapRemoveEntityMarker("ping7")
			MapRemoveEntityMarker("ping8")
			MapRemoveEntityMarker("ping9")
			DeleteEntity("ping1")
			DeleteEntity("ping2")
			DeleteEntity("ping3")
			DeleteEntity("ping4")
			DeleteEntity("ping5")
			DeleteEntity("ping6")
			DeleteEntity("ping7")
			DeleteEntity("ping8")
			DeleteEntity("ping9")
		end
		if pingcount == 10 then
			MapRemoveEntityMarker("ping1")
			MapRemoveEntityMarker("ping2")
			MapRemoveEntityMarker("ping3")
			MapRemoveEntityMarker("ping4")
			MapRemoveEntityMarker("ping5")
			MapRemoveEntityMarker("ping7")
			MapRemoveEntityMarker("ping8")
			MapRemoveEntityMarker("ping9")
			MapRemoveEntityMarker("ping10")
			DeleteEntity("ping1")
			DeleteEntity("ping2")
			DeleteEntity("ping3")
			DeleteEntity("ping4")
			DeleteEntity("ping5")
			DeleteEntity("ping6")
			DeleteEntity("ping7")
			DeleteEntity("ping8")
			DeleteEntity("ping9")
			DeleteEntity("ping10")
		end
		if pingcount == 11 then
			MapRemoveEntityMarker("ping1")
			MapRemoveEntityMarker("ping2")
			MapRemoveEntityMarker("ping3")
			MapRemoveEntityMarker("ping4")
			MapRemoveEntityMarker("ping5")
			MapRemoveEntityMarker("ping7")
			MapRemoveEntityMarker("ping8")
			MapRemoveEntityMarker("ping9")
			MapRemoveEntityMarker("ping10")
			MapRemoveEntityMarker("ping11")
			DeleteEntity("ping1")
			DeleteEntity("ping2")
			DeleteEntity("ping3")
			DeleteEntity("ping4")
			DeleteEntity("ping5")
			DeleteEntity("ping6")
			DeleteEntity("ping7")
			DeleteEntity("ping8")
			DeleteEntity("ping9")
			DeleteEntity("ping10")
			DeleteEntity("ping11")
		end
		if pingcount == 12 then
			MapRemoveEntityMarker("ping1")
			MapRemoveEntityMarker("ping2")
			MapRemoveEntityMarker("ping3")
			MapRemoveEntityMarker("ping4")
			MapRemoveEntityMarker("ping5")
			MapRemoveEntityMarker("ping7")
			MapRemoveEntityMarker("ping8")
			MapRemoveEntityMarker("ping9")
			MapRemoveEntityMarker("ping10")
			MapRemoveEntityMarker("ping11")
			MapRemoveEntityMarker("ping12")
			DeleteEntity("ping1")
			DeleteEntity("ping2")
			DeleteEntity("ping3")
			DeleteEntity("ping4")
			DeleteEntity("ping5")
			DeleteEntity("ping6")
			DeleteEntity("ping7")
			DeleteEntity("ping8")
			DeleteEntity("ping9")
			DeleteEntity("ping10")
			DeleteEntity("ping11")
			DeleteEntity("ping12")
		end
		if pingcount == 13 then
			MapRemoveEntityMarker("ping1")
			MapRemoveEntityMarker("ping2")
			MapRemoveEntityMarker("ping3")
			MapRemoveEntityMarker("ping4")
			MapRemoveEntityMarker("ping5")
			MapRemoveEntityMarker("ping7")
			MapRemoveEntityMarker("ping8")
			MapRemoveEntityMarker("ping9")
			MapRemoveEntityMarker("ping10")
			MapRemoveEntityMarker("ping11")
			MapRemoveEntityMarker("ping12")
			MapRemoveEntityMarker("ping13")
			DeleteEntity("ping1")
			DeleteEntity("ping2")
			DeleteEntity("ping3")
			DeleteEntity("ping4")
			DeleteEntity("ping5")
			DeleteEntity("ping6")
			DeleteEntity("ping7")
			DeleteEntity("ping8")
			DeleteEntity("ping9")
			DeleteEntity("ping10")
			DeleteEntity("ping11")
			DeleteEntity("ping12")
			DeleteEntity("ping13")
		end
		if pingcount == 14 then
			MapRemoveEntityMarker("ping1")
			MapRemoveEntityMarker("ping2")
			MapRemoveEntityMarker("ping3")
			MapRemoveEntityMarker("ping4")
			MapRemoveEntityMarker("ping5")
			MapRemoveEntityMarker("ping7")
			MapRemoveEntityMarker("ping8")
			MapRemoveEntityMarker("ping9")
			MapRemoveEntityMarker("ping10")
			MapRemoveEntityMarker("ping11")
			MapRemoveEntityMarker("ping12")
			MapRemoveEntityMarker("ping13")
			MapRemoveEntityMarker("ping14")
			DeleteEntity("ping1")
			DeleteEntity("ping2")
			DeleteEntity("ping3")
			DeleteEntity("ping4")
			DeleteEntity("ping5")
			DeleteEntity("ping6")
			DeleteEntity("ping7")
			DeleteEntity("ping8")
			DeleteEntity("ping9")
			DeleteEntity("ping10")
			DeleteEntity("ping11")
			DeleteEntity("ping12")
			DeleteEntity("ping13")
			DeleteEntity("ping14")
		end
		pingcount = 0;
		SetTimerValue(pingtimer2, 15)
	  end,
	pingtimer2
	)

	victory1 = CreateTimer("victory1")
	SetTimerValue(victory1, 10)
	victory2 = CreateTimer("victory2")
	SetTimerValue(victory2, 10)
	AllowAISpawn(2, false)
    if (not ScriptCB_InMultiplayer()) then
		AllowAISpawn(2, true)
		SetTimerValue(victory1, 1)
		SetTimerValue(victory2, 1)
		ForceHumansOntoTeam1()
	end
    
	SetUberMode(1);
	 AddAIGoal(3, "deathmatch", 1000)
	 AddAIGoal(2, "deathmatch", 1000)
    conquest:Start()   
    EnableSPHeroRules()
	SetProperty("cp1", "CaptureRegion", "")
	SetProperty("cp2", "CaptureRegion", "")
	SetProperty("cp3", "CaptureRegion", "")
	SetProperty("cp4", "CaptureRegion", "")
	SetProperty("cp5", "CaptureRegion", "")
	SetProperty("cp6", "CaptureRegion", "")
	
    SetTeamAsFriend(3,1)
    SetTeamAsFriend(3,2)
    SetTeamAsFriend(2,3)
    SetTeamAsFriend(1,3)
    SetTeamAsFriend(2,1)
    SetTeamAsFriend(1,2)
	
	
-----------------------SCRIPTING BEGINS----------------------------------
	win = CreateTimer("win")
	SetTimerValue(win, 300)
	grace = CreateTimer("grace")
	SetTimerValue(grace, 30)
	check = CreateTimer("check")
	SetTimerValue(check, 0.1)
      onfirstspawn = OnCharacterSpawn(
        function(character)
			if IsCharacterHuman(character) then
				ReleaseCharacterSpawn(onfirstspawn)
				onfirstspawn = nil
				StartTimer(grace)
				ShowTimer(grace)
				ShowMessageText("level.0CW.grace")
				if (not ScriptCB_InMultiplayer()) then
					StartTimer("pingtimer1")
				end
			end
        end
		)
	OnTimerElapse(
	  function(timer)
		MissionVictory(1)
		DestroyTimer(timer)
	  end,
	win
	)
	--------------------WIN TIMER ABOVE, REINFORCEMENTS CHECKS BELOW---------------------
--	alive = CreateTimer("alive")
--	SetTimerValue(alive, 1)
--	StartTimer(alive)
	coolman = 1
	people = 5
	OnTimerElapse(
	    function(timer)
			if GetNumTeamMembersAlive(2) >= 1 and GetNumTeamMembersAlive(1) >= 1 then
				if (not ScriptCB_InMultiplayer()) then
					StartTimer(pingtimer1)
				end
				SetProperty("cp1", "SpawnPath", "")
				SetProperty("cp2", "SpawnPath", "")
				SetProperty("cp3", "SpawnPath", "")
				SetProperty("cp4", "SpawnPath", "")
				SetProperty("cp5", "SpawnPath", "")
				SetProperty("cp6", "SpawnPath", "")
				ShowMessageText("level.0CW.begin")
				SetTeamAsEnemy(3,1)
				SetTeamAsEnemy(3,2)
				SetTeamAsFriend(2,3)
				SetTeamAsEnemy(1,3)
				SetTeamAsEnemy(2,1)
				SetTeamAsEnemy(1,2)
				SetTeamPoints(2, GetNumTeamMembersAlive(2))
				SetTeamPoints(1, GetNumTeamMembersAlive(1))
				ShowTeamPoints(2, true)
				ShowTeamPoints(1, true)
				if people ~= GetNumTeamMembersAlive(3) then
					people = GetNumTeamMembersAlive(3)
				end
				StartTimer(win)
				ShowTimer(win)
				StartTimer(check)
				DestroyTimer(timer)
			end
			if GetNumTeamMembersAlive(2) <= 0 or GetNumTeamMembersAlive(1) <= 0 then
				ShowMessageText("level.0CW.nope")
				SetTimerValue(grace, 30)
				StartTimer(grace)
			end
		end,
	grace
	)
	nume = math.ceil((ScriptCB_random()*5)+2)
	OnTimerElapse(
		function(timer)
				if GetTeamPoints(1) ~= GetNumTeamMembersAlive(1) then
					SetTeamPoints(1, GetNumTeamMembersAlive(1))
					if GetTeamPoints(1) == 0 then
						SetVictoryTimer(victory2, 2)
						StartTimer(victory2)
						ShowMessageText("level.0CW.policedead")
						DestroyTimer(timer)
--						MissionVictory(2)
					end
				end
				if GetTeamPoints(2) ~= GetNumTeamMembersAlive(2) then
					SetTeamPoints(2, GetNumTeamMembersAlive(2))
					if GetTeamPoints(2) == 0 then
						SetVictoryTimer(victory1, 1)
						StartTimer(victory1)
						ShowMessageText("level.0CW.assassinsdead")
						DestroyTimer(timer)
--						MissionVictory(1)
					end
				end
				if people ~= GetNumTeamMembersAlive(3) and coolman == 1 then
					SetVictoryTimer(victory2, 2)
					StartTimer(victory2)
					ShowMessageText("level.0CW.civiliandead")
					coolman = 0
					DestroyTimer(timer)
--					MissionVictory(2)
				end
			SetTimerValue(check, 0.1)
			StartTimer(check)
		end,
	check
	)
	
	OnTimerElapse(
	  function(timer)
		MissionVictory(1)
		DestroyTimer(win)
	  end,
	victory1
	)
	OnTimerElapse(
	  function(timer)
		MissionVictory(2)
		DestroyTimer(win)
	  end,
	victory2
	)
	
	
	DisableSmallMapMiniMap()
	
	
end

function ScriptInit()
    StealArtistHeap(1200*1024)
    -- Designers, these two lines *MUST* be first!
    SetPS2ModelMemory(3100000)
    ReadDataFile("dc:ingame.lvl")
    ReadDataFile("ingame.lvl")

   

    ReadDataFile("sound\\nab.lvl;nab2gcw")
    ReadDataFile("dc:SIDE\\imp.lvl",
                    "imp_inf_rifleman")

    ReadDataFile("dc:SIDE\\des.lvl",
                             --"all_inf_soldier",
                             --"all_inf_vanguard",
                             "all_inf_engineer",
                             --"all_inf_soldier_evil",
                             --"all_inf_vanguard_evil",
                             "all_inf_engineer_evil")
    ReadDataFile("dc:SIDE\\gar.lvl",
                             "gar_inf_pilot",
                             "gar_inf_soldier",
                             "gar_inf_vanguard",
                             "gar_inf_naboo_queen",
                             "gar_inf_pilot_evil",
                             "gar_inf_soldier_evil",
                             "gar_inf_vanguard_evil",
                             "gar_inf_naboo_queen_evil")
    ReadDataFile("SIDE\\tur.lvl", 
                "tur_bldg_laser")
				
    -- Jawas --------------------------
	
	bots = (ScriptCB_GetCONNumBots()*5)
    SetTeamName (3, "locals")
    --AddUnitClass (3, "all_inf_engineer", 5)
    --AddUnitClass (3, "all_inf_soldier", 10)
    AddUnitClass (3, "gar_inf_pilot", 35)
    AddUnitClass (3, "gar_inf_soldier", 35)
    AddUnitClass (3, "gar_inf_vanguard", 35)
    AddUnitClass (3, "gar_inf_naboo_queen", 1)
    SetUnitCount (3, bots)
	
	nume = math.ceil((ScriptCB_random()*7)+2)
	
    SetupTeams{
        rep = {
            team = REP,
            units = nume,
            reinforcements = -1,
            soldier  = { "gar_inf_pilot_evil",1, 5},
            assault  = { "gar_inf_soldier_evil",1, 5},
            engineer = { "gar_inf_vanguard_evil",1, 5},
            sniper   = { "gar_inf_naboo_queen_evil",0, 1},
            officer = {"all_inf_engineer_evil",1, 3},
            
        }
    }
    SetupTeams{ 
        cis = {
            team = CIS,
            units = 5,
            reinforcements = -1,
            soldier  = { "imp_inf_rifleman",0, 0},
        }
    }
    

    --  Level Stats
    ClearWalkers()
    AddWalkerType(0, 3) -- 8 droidekas with 0 leg pairs each
    AddWalkerType(1, 3) -- ATSTs
    local weaponCnt = 220
    SetMemoryPoolSize("Aimer", 50)
    SetMemoryPoolSize("AmmoCounter", weaponCnt)
    SetMemoryPoolSize("BaseHint", 128)
    SetMemoryPoolSize("EnergyBar", weaponCnt)
    SetMemoryPoolSize("EntityCloth", 88)
    SetMemoryPoolSize("EntitySoundStream", 1)
    SetMemoryPoolSize("EntitySoundStatic", 44)
    SetMemoryPoolSize("EntityHover", 4)
    SetMemoryPoolSize("MountedTurret", 11)
    SetMemoryPoolSize("RedShadingState", 110)
    SetMemoryPoolSize("PathFollower", 110)
    SetMemoryPoolSize("Navigator", 140)
    SetMemoryPoolSize("Obstacle", 450)
    SetMemoryPoolSize("SoldierAnimation", 650)
    SetMemoryPoolSize("PathFollower", 90)
    SetMemoryPoolSize("PathNode", 200)
    SetMemoryPoolSize("TreeGridStack", 400)
    SetMemoryPoolSize("UnitAgent", 120)
    SetMemoryPoolSize("UnitController", 140)
    SetMemoryPoolSize("Weapon", weaponCnt)
	SetMemoryPoolSize("EntityFlyer", 6)   
    
    SetSpawnDelay(10.0, 0.25)
    ReadDataFile("NAB\\nab2.lvl","naboo2_Conquest")
    SetDenseEnvironment("true")
    --AddDeathRegion("Water")
    AddDeathRegion("Waterfall")
    SetMaxFlyHeight(25)
    SetMaxPlayerFlyHeight (25)

    

    --  Sound
    
    voiceSlow = OpenAudioStream("sound\\global.lvl", "rep_unit_vo_slow")
    AudioStreamAppendSegments("sound\\global.lvl", "cis_unit_vo_slow", voiceSlow)
    AudioStreamAppendSegments("sound\\global.lvl", "all_unit_vo_slow", voiceSlow)
    AudioStreamAppendSegments("sound\\global.lvl", "global_vo_slow", voiceSlow)
    
    voiceQuick = OpenAudioStream("sound\\global.lvl", "rep_unit_vo_quick")
    AudioStreamAppendSegments("sound\\global.lvl", "cis_unit_vo_quick", voiceQuick)     
    
    OpenAudioStream("sound\\global.lvl",  "cw_music")
    -- OpenAudioStream("sound\\global.lvl",  "global_vo_quick")
    -- OpenAudioStream("sound\\global.lvl",  "global_vo_slow")
    OpenAudioStream("sound\\nab.lvl",  "nab2")
    OpenAudioStream("sound\\nab.lvl",  "nab2")
    OpenAudioStream("sound\\nab.lvl",  "nab2_emt")

    SetBleedingVoiceOver(REP, REP, "rep_off_com_report_us_overwhelmed", 1)
    SetBleedingVoiceOver(REP, CIS, "rep_off_com_report_enemy_losing",   1)
    SetBleedingVoiceOver(CIS, REP, "cis_off_com_report_enemy_losing",   1)
    SetBleedingVoiceOver(CIS, CIS, "cis_off_com_report_us_overwhelmed", 1)
    
    SetLowReinforcementsVoiceOver(REP, REP, "rep_off_defeat_im", .1, 1)
    SetLowReinforcementsVoiceOver(REP, CIS, "rep_off_victory_im", .1, 1)
    SetLowReinforcementsVoiceOver(CIS, CIS, "cis_off_defeat_im", .1, 1)
    SetLowReinforcementsVoiceOver(CIS, REP, "cis_off_victory_im", .1, 1)    

    SetOutOfBoundsVoiceOver(2, "repleaving")
    SetOutOfBoundsVoiceOver(1, "cisleaving")

    SetAmbientMusic(REP, 1.0, "rep_nab_amb_start",  0,1)
    SetAmbientMusic(REP, 0.8, "rep_nab_amb_middle", 1,1)
    SetAmbientMusic(REP, 0.2,"rep_nab_amb_end",    2,1)
    SetAmbientMusic(CIS, 1.0, "cis_nab_amb_start",  0,1)
    SetAmbientMusic(CIS, 0.8, "cis_nab_amb_middle", 1,1)
    SetAmbientMusic(CIS, 0.2,"cis_nab_amb_end",    2,1)

    SetVictoryMusic(REP, "rep_nab_amb_victory")
    SetDefeatMusic (REP, "rep_nab_amb_defeat")
    SetVictoryMusic(CIS, "cis_nab_amb_victory")
    SetDefeatMusic (CIS, "cis_nab_amb_defeat")

    SetSoundEffect("ScopeDisplayZoomIn",  "binocularzoomin")
    SetSoundEffect("ScopeDisplayZoomOut", "binocularzoomout")
    --SetSoundEffect("WeaponUnableSelect",  "com_weap_inf_weaponchange_null")
    --SetSoundEffect("WeaponModeUnableSelect",  "com_weap_inf_modechange_null")
    SetSoundEffect("SpawnDisplayUnitChange",       "shell_select_unit")
    SetSoundEffect("SpawnDisplayUnitAccept",       "shell_menu_enter")
    SetSoundEffect("SpawnDisplaySpawnPointChange", "shell_select_change")
    SetSoundEffect("SpawnDisplaySpawnPointAccept", "shell_menu_enter")
    SetSoundEffect("SpawnDisplayBack",             "shell_menu_exit")



    


    --  Camera Stats
    --Nab2 Theed
    --Palace
    AddCameraShot(0.038177, -0.005598, -0.988683, -0.144973, -0.985535, 18.617458, -123.316505);
    AddCameraShot(0.993106, -0.109389, 0.041873, 0.004612, 6.576932, 24.040697, -25.576218);
    AddCameraShot(0.851509, -0.170480, 0.486202, 0.097342, 158.767715, 22.913860, -0.438658);
    AddCameraShot(0.957371, -0.129655, -0.255793, -0.034641, 136.933548, 20.207420, 99.608246);
    AddCameraShot(0.930364, -0.206197, 0.295979, 0.065598, 102.191856, 22.665434, 92.389435);
    AddCameraShot(0.997665, -0.068271, 0.002086, 0.000143, 88.042351, 13.869274, 93.643898);
    AddCameraShot(0.968900, -0.100622, 0.224862, 0.023352, 4.245263, 13.869274, 97.208542);
    AddCameraShot(0.007091, -0.000363, -0.998669, -0.051089, -1.309990, 16.247049, 15.925866);
    AddCameraShot(-0.274816, 0.042768, -0.949121, -0.147705, -55.505108, 25.990822, 86.987534);
    AddCameraShot(0.859651, -0.229225, 0.441156, 0.117634, -62.493008, 31.040747, 117.995369);
    AddCameraShot(0.703838, -0.055939, 0.705928, 0.056106, -120.401054, 23.573559, -15.484946);
    AddCameraShot(0.835474, -0.181318, -0.506954, -0.110021, -166.314774, 27.687098, -6.715797);
    AddCameraShot(0.327573, -0.024828, -0.941798, -0.071382, -109.700180, 15.415476, -84.413605);
    AddCameraShot(-0.400505, 0.030208, -0.913203, -0.068878, 82.372711, 15.415476, -42.439548);
    
    end

