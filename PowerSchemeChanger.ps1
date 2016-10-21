###############################################################################
# File:        PowerSchemeChanger.ps1
# AUTHOR:      Eric Schnipke, 2016
# LICENSE:     MIT License
# DESCRIPTION: Aliases "power" cmd to "powercfg" and eases setting changing.
# USAGE:       Reference script within PowerShell profile to enable global
#              usage.
###############################################################################

function power
{
    param($scheme)

    switch -wildcard ($scheme)
    {
        "p*"    { powercfg -setactive SCHEME_MAX;      break } # "p" for "power saver"
        "h*"    { powercfg -setactive SCHEME_MIN;      break } # "h" for "high performance"
        "b*"    { powercfg -setactive SCHEME_BALANCED; break } # "b" for "balanced"
        default { powercfg -setactive SCHEME_BALANCED; break }
    }
}
