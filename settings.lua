data:extend({{
    type = "string-setting",
    name = "ssi-scale-assembling-machines",
    setting_type = "startup",
    default_value = "all",
    allowed_values = {"all", "space-manufactory", "none"}
}, {
    type = "bool-setting",
    name = "ssi-scale-landing-pad",
    setting_type = "startup",
    default_value = true,
    order = "a2"
}, {
    type = "bool-setting",
    name = "ssi-scale-launch-pad",
    setting_type = "startup",
    default_value = true,
    order = "a31"
}, {
    type = "bool-setting",
    name = "ssi-hide-launch-pad-combinator",
    setting_type = "startup",
    default_value = true,
    order = "a32"
}, {
    type = "bool-setting",
    name = "ssi-hide-launch-pad-tank",
    setting_type = "startup",
    default_value = true,
    order = "a33"
}})
