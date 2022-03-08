#FS-Logix Gruppen Anpassung Teil 2
    Get-LocalGroup -Name "FSLogix ODFC Include List"
    Add-LocalGroupMember -Name "FSLogix ODFC Include List" -Member $FSLogixUsers
 
    Get-LocalGroup -Name "FSLogix Profile Include List"
    Add-LocalGroupMember -Name "FSLogix ODFC Include List" -Member $FSLogixUsers
    
    Get-LocalGroup -Name "FSLogix Profile Exclude List"
    Add-LocalGroupMember -Name "FSLogix Profile Exclude List" -Member $ExcludeUsers

    Get-LocalGroup -Name "FSLogix ODFC Exclude List"
    Add-LocalGroupMember -Name "FSLogix Profile Exclude List" -Member $ExcludeUsers
