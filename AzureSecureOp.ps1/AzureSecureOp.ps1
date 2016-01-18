configuration AddLocalUserAcct
{
    param
    (        
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.PSCredential]$AdminCredentials
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.PSCredential]$UserCredentials
    )
    
    Node localhost 
    {
        User LocalUserAccount
        {
            Username = $UserCredentials.UserName
            Password = $UserCredentials
            Disabled = $false
            Ensure = "Present"
            FullName = "Local User Account"
            Description = "Local User Account"
            PasswordNeverExpires = $true
        }                                            
    }
}
