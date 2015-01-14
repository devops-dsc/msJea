Configuration SetupJea
{
    Import-DscResource -module msJea
    Node localhost
    {
        msJeaEndPoint CleanAll
        {
            Name     = 'CleanALL'
            CleanAll = $true
        }

        LocalConfigurationManager
        {
            RefreshFrequencyMins = 30
            ConfigurationMode    = "ApplyAndAutoCorrect"
            DebugMode            = "True"    #This disables provider caching 
        }
    }
}

SetupJea -OutputPath C:\JeaDemo

Set-DscLocalConfigurationManager -Path C:\JeaDemo -Verbose 

Start-DscConfiguration -Path c:\JeaDemo -Wait -Verbose

#EOF
