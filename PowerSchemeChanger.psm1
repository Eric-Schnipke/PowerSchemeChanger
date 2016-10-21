###############################################################################
# File:        PowerSchemeChanger.psm1
#
# AUTHOR:      Eric Schnipke, 2016
#
# LICENSE:     MIT License
#
# DESCRIPTION: Eases on-the-fly Windows power scheme changes within PowerShell.
#              Aliases "power" cmd to "powercfg" and eases setting changing.
#
# USAGE:       1. Place this .psm1 file inside a directory named
#                 "PowerSchemeChanger".
#              2. Move this directory to
#                 $home\Documents\WindowsPowerShell\Modules.
#              3. In your PowerShell profile script, add
#                 "Import-Module PowerSchemeChanger".
#              4. From PowerShell command prompt, issue "power" command with
#                 "p*", "h*", or "b*" arugments.
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
