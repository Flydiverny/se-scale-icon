local se_prefix = 'se-'

function string.starts(String, Start)
    return string.sub(String, 1, string.len(Start)) == Start
end

function getSetting(setting)
    if settings["startup"][setting] then
        return settings["startup"][setting].value
    else
        error("No setting '" .. setting .. "' found.")
    end
end

-- Iterate all assembling-machine entities and find space exploration ones and enable scale on all of them
if getSetting("ssi-scale-assembling-machines") == 'all' then
    for _, entity in pairs(data.raw["assembling-machine"]) do
        if string.starts(entity.name, se_prefix) then
            data.raw["assembling-machine"][entity.name].scale_entity_info_icon = true
        end
    end
end

if getSetting("ssi-scale-assembling-machines") == "space-manufactory" then
    data.raw["assembling-machine"][se_prefix .. "space-manufactory"].scale_entity_info_icon = true
end

-- Scale icon on Cargo rocket launch pad and landing pad
data.raw["container"][se_prefix .. "rocket-launch-pad"].scale_info_icons = getSetting("ssi-scale-launch-pad")
data.raw["container"][se_prefix .. "rocket-landing-pad"].scale_info_icons = getSetting("ssi-scale-landing-pad")

-- Hide alt mode info from hidden entities in the launch pad.
if getSetting("ssi-hide-launch-pad-combinator") then
    table.insert(data.raw["constant-combinator"][se_prefix .. "rocket-launch-pad-combinator"].flags, "hide-alt-info")
end

-- Hide alt mode info from fuel tank
if getSetting("ssi-hide-launch-pad-tank") then
    table.insert(data.raw["storage-tank"][se_prefix .. "rocket-launch-pad-tank"].flags, "hide-alt-info")
end
