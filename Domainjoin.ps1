#Anpassung template Maschine

#Variablen
 $user = "LocAdmin"
 $pass=ConvertTo-SecureString "123AVDherbei!" -AsPlainText -Force
 $FSLogixUsers = "sepagoavd.onmicrosoft.com\AVDUsers"
 $ExcludeUsers = "sepagoavd.onmicrosoft.com\Domain Admins"


    #FS-Logix Gruppen Anpassung Teil 1
    Get-LocalGroup -Name "FSLogix ODFC Include List"
    Remove-LocalGroupMember -Name "FSLogix ODFC Include List" -Member "everyone"
 
    Get-LocalGroup -Name "FSLogix Profile Include List"
    Remove-LocalGroupMember -Name "FSLogix Profile Include List" -Member "everyone"

    Get-LocalGroup -Name "FSLogix Profile Exclude List"
    Add-LocalGroupMember -Name "FSLogix Profile Exclude List" -Member 'Administrators'

    Get-LocalGroup -Name "FSLogix ODFC Exclude List"
    Add-LocalGroupMember -Name "FSLogix ODFC Exclude List" -Member 'Administrators'

    #Domain Join
   
    $cred = New-Object System.Management.Automation.PSCredential -ArgumentList $user, $pass
    Add-Computer -DomainName sepagoavd.onmicrosoft.com -Credential $cred  -Restart

    #FS-Logix Gruppen Anpassung Teil 2
    Get-LocalGroup -Name "FSLogix ODFC Include List"
    Add-LocalGroupMember -Name "FSLogix ODFC Include List" -Member $FSLogixUsers
 
    Get-LocalGroup -Name "FSLogix Profile Include List"
    Add-LocalGroupMember -Name "FSLogix ODFC Include List" -Member $FSLogixUsers
    
    Get-LocalGroup -Name "FSLogix Profile Exclude List"
    Add-LocalGroupMember -Name "FSLogix Profile Exclude List" -Member $ExcludeUsers

    Get-LocalGroup -Name "FSLogix ODFC Exclude List"
    Add-LocalGroupMember -Name "FSLogix Profile Exclude List" -Member $ExcludeUsers
