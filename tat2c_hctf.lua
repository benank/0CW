--
-- Copyright (c) 2005 Pandemic Studios, LLC. All rights reserved.
--

ScriptCB_DoFile("setup_teams")
ScriptCB_DoFile("ObjectiveConquest")

function ScriptPostLoad()
    --This defines the CPs.  These need to happen first
    SetProperty("FDL-2", "IsLocked", 1)
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
	DisableSmallMapMiniMap()
    cp1 = CommandPost:New{name = "cp1"}
    cp2 = CommandPost:New{name = "cp2"}
    cp3 = CommandPost:New{name = "cp3"}
	cp6 = CommandPost:New{name = "cp6"}
	cp7 = CommandPost:New{name = "cp7"}
	cp8 = CommandPost:New{name = "cp8"}
	

	----------------------------------------------------------------------------------------
	--scancount = 0
	scanner = OnObjectDamage(function(object, damager)
		if GetObjectLastHitWeaponClass(object) == "imp_weap_inf_scanner" 
		and GetObjectTeam ~= 0 
		and GetEntityClass(object) ~= "06A728F0" then
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


 pingcount = 0

	
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
    --This sets up the actual objective.  This needs to happen after cp's are defined
    conquest = ObjectiveConquest:New{teamATT = ATT, teamDEF = DEF, textATT = "game.modes.con", textDEF = "game.modes.con2", multiplayerRules = true}
    
    --This adds the CPs to the objective.  This needs to happen after the objective is set up
	conquest:AddCommandPost(cp1)
	conquest:AddCommandPost(cp2)
	conquest:AddCommandPost(cp3)

	conquest:AddCommandPost(cp6)
	conquest:AddCommandPost(cp7)
	conquest:AddCommandPost(cp8)


	conquest:Start()
	SetUberMode(1);
	 AddAIGoal(3, "deathmatch", 1000)
	 AddAIGoal(2, "deathmatch", 1000)
	EnableSPHeroRules()
	
	
	SetProperty("cp1", "CaptureRegion", "")
	SetProperty("cp2", "CaptureRegion", "")
	SetProperty("cp3", "CaptureRegion", "")
	SetProperty("cp6", "CaptureRegion", "")
	SetProperty("cp7", "CaptureRegion", "")
	SetProperty("cp8", "CaptureRegion", "")
	
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
				SetProperty("cp6", "SpawnPath", "")
				SetProperty("cp7", "SpawnPath", "")
				SetProperty("cp8", "SpawnPath", "")
				ShowMessageText("level.0CW.begin")
				SetTeamAsEnemy(3,1)
				SetTeamAsFriend(2,3)
				SetTeamAsFriend(3,2)
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
end

---------------------------------------------------------------------------
-- FUNCTION:    ScriptInit
-- PURPOSE:     This function is only run once
-- INPUT:
-- OUTPUT:
-- NOTES:       The name, 'ScriptInit' is a chosen convention, and each
--              mission script must contain a version of this function, as
--              it is called from C to start the mission.
---------------------------------------------------------------------------

function ScriptInit()
    -- Designers, these two lines *MUST* be first!
    StealArtistHeap(1024 * 1024)
    SetPS2ModelMemory(2097152 + 65536 * 10)
    ReadDataFile("dc:ingame.lvl")
    ReadDataFile("ingame.lvl")
    ReadDataFile("dc:sound\\global.lvl;troopersounds")

    --  Empire Attacking (attacker is always #1)
    local ALL = 2
    local IMP = 1
    --  These variables do not change
    local ATT = 1
    local DEF = 2

    SetMaxFlyHeight(40)
	SetMaxPlayerFlyHeight(40)

    ReadDataFile("sound\\tat.lvl;tat2gcw")
                    
    ReadDataFile("dc:SIDE\\imp.lvl",
                    "imp_inf_rifleman")

    ReadDataFile("dc:SIDE\\des.lvl",
                             "all_inf_pilot",
                             "all_inf_aq",
                             "all_inf_wq",
                             "all_inf_twilek_red",
                             "all_inf_twilek_red_evil",
                             "all_inf_twilek_blue",
                             "all_inf_twilek_blue_evil",
                             "tat_inf_tuskenhunter",
                             "all_inf_engineer",
                             "all_inf_pilot_evil",
                             "all_inf_aq_evil",
                             "all_inf_wq_evil",
                             "tat_inf_tuskenhunter_evil",
                             "all_inf_engineer_evil",
                             "tat_inf_jawa",
                             "tat_inf_jawa_evil")

    -- Jawas --------------------------
	bots = (ScriptCB_GetCONNumBots()*5)
    SetTeamName (3, "locals")
    AddUnitClass (3, "tat_inf_jawa", 17)
    AddUnitClass (3, "all_inf_pilot", 17)
    AddUnitClass (3, "all_inf_wq", 17)
    AddUnitClass (3, "all_inf_aq", 17)
    AddUnitClass (3, "tat_inf_tuskenhunter", 17)
    AddUnitClass (3, "all_inf_twilek_red", 17)
    --AddUnitClass (3, "all_inf_twilek_blue", 17)
    SetUnitCount (3, bots)
	-----------------------------------

	nume = math.ceil((ScriptCB_random()*7)+2)
	
	ReadDataFile("SIDE\\tur.lvl",
						"tur_bldg_tat_barge",	
						"tur_bldg_laser")	
 
	SetupTeams{
		all = {
			team = ALL, -- team 2
			units = nume,
			reinforcements = -1,
			soldier	= { "tat_inf_jawa_evil",1, 5},
			assault	= { "all_inf_pilot_evil",1, 5},
			engineer	= { "all_inf_aq_evil",1, 5},
			sniper	= { "all_inf_wq_evil",1, 5},
			officer	= { "tat_inf_tuskenhunter_evil",1, 5},
			special	= { "all_inf_engineer_evil",1, 5},

		},
		imp = {
			team = IMP, --team 1
			units = 15,
			reinforcements = -1,
			soldier	= { "imp_inf_rifleman",0, 0},
		},
	}
	
    --AddUnitClass (2, "all_inf_twilek_blue_evil", 1)
    AddUnitClass (2, "all_inf_twilek_red_evil", 1)
    
    --  Level Stats
    ClearWalkers()
    AddWalkerType(0, 0) -- special -> droidekas
    AddWalkerType(1, 0) -- 1x2 (1 pair of legs)
    AddWalkerType(2, 0) -- 2x2 (2 pairs of legs)
    AddWalkerType(3, 0) -- 3x2 (3 pairs of legs)
    SetMemoryPoolSize("Aimer", 14)
	SetMemoryPoolSize("EntityCloth", 25)
	SetMemoryPoolSize("EntityFlyer", 6) -- to account for rocket upgrade
    SetMemoryPoolSize("MountedTurret", 30)
    SetMemoryPoolSize("Obstacle", 664)
    SetMemoryPoolSize("PathNode", 384)
    SetMemoryPoolSize("SoldierAnimation", 540)
    SetMemoryPoolSize("TreeGridStack", 500)

    SetSpawnDelay(0.0, 0.0)
    ReadDataFile("TAT\\tat2.lvl", "tat2_con")
    SetDenseEnvironment("false")


    --  Sound Stats
    
    voiceSlow = OpenAudioStream("sound\\global.lvl", "all_unit_vo_slow")
    AudioStreamAppendSegments("sound\\global.lvl", "imp_unit_vo_slow", voiceSlow)
    AudioStreamAppendSegments("sound\\global.lvl", "des_unit_vo_slow", voiceSlow)
    AudioStreamAppendSegments("sound\\global.lvl", "global_vo_slow", voiceSlow)
    
    voiceQuick = OpenAudioStream("sound\\global.lvl",  "all_unit_vo_quick")
    AudioStreamAppendSegments("sound\\global.lvl",  "imp_unit_vo_quick", voiceQuick)    
    
    OpenAudioStream("sound\\global.lvl",  "gcw_music")
    OpenAudioStream("sound\\tat.lvl",  "tat2")
    OpenAudioStream("sound\\tat.lvl",  "tat2")
    -- OpenAudioStream("sound\\global.lvl",  "global_vo_quick")
    -- OpenAudioStream("sound\\global.lvl",  "global_vo_slow")

    SetBleedingVoiceOver(ALL, ALL, "all_off_com_report_us_overwhelmed", 1)
    SetBleedingVoiceOver(ALL, IMP, "all_off_com_report_enemy_losing",   1)
    SetBleedingVoiceOver(IMP, ALL, "imp_off_com_report_enemy_losing",   1)
    SetBleedingVoiceOver(IMP, IMP, "imp_off_com_report_us_overwhelmed", 1)

    SetLowReinforcementsVoiceOver(ALL, ALL, "all_off_defeat_im", .1, 1)
    SetLowReinforcementsVoiceOver(ALL, IMP, "all_off_victory_im", .1, 1)
    SetLowReinforcementsVoiceOver(IMP, IMP, "imp_off_defeat_im", .1, 1)
    SetLowReinforcementsVoiceOver(IMP, ALL, "imp_off_victory_im", .1, 1)

    SetOutOfBoundsVoiceOver(2, "Allleaving")
    SetOutOfBoundsVoiceOver(1, "Impleaving")

    SetAmbientMusic(ALL, 1.0, "all_tat_amb_start",  0,1)
    SetAmbientMusic(ALL, 0.8, "all_tat_amb_middle", 1,1)
    SetAmbientMusic(ALL, 0.2, "all_tat_amb_end",    2,1)
    SetAmbientMusic(IMP, 1.0, "imp_tat_amb_start",  0,1)
    SetAmbientMusic(IMP, 0.8, "imp_tat_amb_middle", 1,1)
    SetAmbientMusic(IMP, 0.2, "imp_tat_amb_end",    2,1)

    SetVictoryMusic(ALL, "all_tat_amb_victory")
    SetDefeatMusic (ALL, "all_tat_amb_defeat")
    SetVictoryMusic(IMP, "imp_tat_amb_victory")
    SetDefeatMusic (IMP, "imp_tat_amb_defeat")

    SetSoundEffect("ScopeDisplayZoomIn",  "binocularzoomin")
    SetSoundEffect("ScopeDisplayZoomOut", "binocularzoomout")
    --SetSoundEffect("WeaponUnableSelect",  "com_weap_inf_weaponchange_null")
    --SetSoundEffect("WeaponModeUnableSelect",  "com_weap_inf_modechange_null")
    SetSoundEffect("SpawnDisplayUnitChange",       "shell_select_unit")
    SetSoundEffect("SpawnDisplayUnitAccept",       "shell_menu_enter")
    SetSoundEffect("SpawnDisplaySpawnPointChange", "shell_select_change")
    SetSoundEffect("SpawnDisplaySpawnPointAccept", "shell_menu_enter")
    SetSoundEffect("SpawnDisplayBack",             "shell_menu_exit")



    SetAttackingTeam(ATT)

    --  Camera Stats
    --Tat2 Mos Eisley
	AddCameraShot(0.974338, -0.222180, 0.035172, 0.008020, -82.664650, 23.668301, 43.955681);
	AddCameraShot(0.390197, -0.089729, -0.893040, -0.205362, 23.563562, 12.914885, -101.465561);
	AddCameraShot(0.169759, 0.002225, -0.985398, 0.012916, 126.972809, 4.039628, -22.020613);
	AddCameraShot(0.677453, -0.041535, 0.733016, 0.044942, 97.517807, 4.039628, 36.853477);
	AddCameraShot(0.866029, -0.156506, 0.467299, 0.084449, 7.685640, 7.130688, -10.895234);
end
