function Find-EnumsList {
    [CmdletBinding()]
    param (
        [string] $ProjectPath
    )

    $Enums = @( Get-ChildItem -Path $ProjectPath\Enums\*.ps1 -ErrorAction SilentlyContinue )
    #Write-Verbose "Find-EnumsList - $ProjectPath\Enums"

    $Opening = '@('
    $Closing = ')'
    $Adding = ','

    $EnumsList = New-ArrayList
    Add-ToArray -List $EnumsList -Element $Opening
    Foreach ($import in @($Enums)) {
        $Entry = "'Enums\$($import.Name)'"
        Add-ToArray -List $EnumsList -Element $Entry
        Add-ToArray -List $EnumsList -Element $Adding
    }
    Remove-FromArray -List $EnumsList -LastElement
    Add-ToArray -List $EnumsList -Element $Closing
    return [string] $EnumsList
}
