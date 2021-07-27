local se_prefix = 'se-'

function string.starts(String, Start)
    return string.sub(String, 1, string.len(Start)) == Start
end

-- Iterate all assembling-machine entities and find space exploration ones and enable scale on all of them
for _, entity in pairs(data.raw["assembling-machine"]) do
    if string.starts(entity.name, se_prefix) then
        data.raw["assembling-machine"][entity.name].scale_entity_info_icon = true
    end
end

-- Scale icon on Cargo rocket launch pad and landing pad
data.raw["container"][se_prefix .. "rocket-launch-pad"].scale_info_icons = true
data.raw["container"][se_prefix .. "rocket-landing-pad"].scale_info_icons = true

-- Hide alt mode info from hidden entities in the launch pad.
table.insert(data.raw["constant-combinator"][se_prefix .. "rocket-launch-pad-combinator"].flags, "hide-alt-info")
table.insert(data.raw["storage-tank"][se_prefix .. "rocket-launch-pad-tank"].flags, "hide-alt-info")

