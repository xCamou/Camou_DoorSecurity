# got to: ox_doorlock/client/utils and search for: ox_doorlock:setState

# put this:
```lua
TriggerServerEvent('doorbreak:alertPolice', door.id, door.coords)
```

# under this:
```lua
TriggerServerEvent('ox_doorlock:setState', door.id, door.state == 1 and 0 or 1, true)
```

# in the end it should look like this:
```lua
---@param entity number
local function pickLock(entity)
	local door = getDoorFromEntity(entity)

	if not door or PickingLock or not door.lockpick or (not Config.CanPickUnlockedDoors and door.state == 0) then return end

	PickingLock = true

	TaskTurnPedToFaceCoord(cache.ped, door.coords.x, door.coords.y, door.coords.z, 4000)
	Wait(500)

	local animDict = lib.requestAnimDict('mp_common_heist')

	TaskPlayAnim(cache.ped, animDict, 'pick_door', 3.0, 1.0, -1, 49, 0, true, true, true)

	local success = lib.skillCheck(door.lockpickDifficulty or Config.LockDifficulty)
	local rand = math.random(1, success and 100 or 5)

	if success then
		TriggerServerEvent('ox_doorlock:setState', door.id, door.state == 1 and 0 or 1, true)
		TriggerServerEvent('doorbreak:alertPolice', door.id, door.coords)
	end

	if rand == 1 then
		TriggerServerEvent('ox_doorlock:breakLockpick')
		lib.notify({ type = 'error', description = locale('lockpick_broke') })
	end

	StopEntityAnim(cache.ped, 'pick_door', animDict, 0)
	RemoveAnimDict(animDict)

	PickingLock = false
end
```