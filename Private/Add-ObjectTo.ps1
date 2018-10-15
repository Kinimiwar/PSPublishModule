function Add-ObjectTo {
    [CmdletBinding()]
    param($Object, $Type)
    #Write-Color 'Adding ', $Object.Name, ' to ', $Type -Color White, Green, White, Yellow
    Write-Verbose "Adding $($Object.Name) to $Type"
    return $Object.Name
}