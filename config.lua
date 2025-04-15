Config = {}

-- [Door-ID]
Config.AlertDoors = {
    [1] = {
        alertChance = 100, -- alertchance (0-100)
        alerPolice = true,
        policeJobs = { 'police', 'sheriff' }, -- you can add more jobs
        policeMessage = "A break-in was reported. The coordinates were entered in the GPS.",
        alertOwner = true,
        ownerJobs = { 'mechanic' }, -- you can add more jobs
        ownerMessage = "Burglary in your workshop!"
    },
    -- [2] = {
    --     alertChance = 100,
    --     alerPolice = true,
    --     policeJobs = { 'police' },
    --     policeMessage = "A break-in was reported. The coordinates were entered in the GPS.",
    --     alertOwner = true,
    --     ownerJobs = { 'mechanic' },
    --     ownerMessage = "Burglary in your workshop!"
    -- },
}
