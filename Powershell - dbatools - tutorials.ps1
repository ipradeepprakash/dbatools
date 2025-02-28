
#------------------ common useful commands ----------------------------#




# Get-InstalledModule: 

        #List of modules that are installed
        Get-InstalledModule | Select-Object name,installedDate,version,type | ft -AutoSize -Wrap


#------------------ TROUBLESHOOTING  ----------------------------#
<#

Get-DbaComputerSystem
Get-DbaErrorLog
Get-DbaProcess
Get-DbaIoLatency


#>


 # Get-DbaComputerSystem: 
        #Gets computer system information from the server and returns as an object.
        # TO get local system info
	    Get-DbaComputerSystem
        # Returns information about the sql2016's computer system
        Get-DbaComputerSystem -ComputerName sql2016


# Get-DbaErrorLog 
            
        <# --------parameters: 
        -SQLinstance : <SQL instance name>
        - Lognumber : 0: recent log, 1,2,3 etc: older
        - Text : enter any search term          
        
        #>

        # find any search term with -Text parameter from recent(0) Errorlog
        cls
        Get-DbaErrorLog -SqlInstance LAPTOP-57FE7IRR\MSSQLSERVER01\MSSQLSERVER01 -LogNumber 0 -Text "login failed" | ft -AutoSize -Wrap | Out-File c:\test\SQLerrorlog.txt
        Invoke-Item C:\test\SQLerrorlog.txt

        # find any search term with -Text parameter from older (1) Errorlog
        cls
        Get-DbaErrorLog -SqlInstance LAPTOP-57FE7IRR\MSSQLSERVER01\MSSQLSERVER01 -LogNumber 1 -Text "CPU" | ft -AutoSize -Wrap | Out-File c:\test\SQLerrorlog1.txt
        Invoke-Item C:\test\SQLerrorlog1.txt

        # find any search term with -Text parameter from older (1) Errorlog with specific date Before /After
        cls
        Get-DbaErrorLog -SqlInstance LAPTOP-57FE7IRR\MSSQLSERVER01\MSSQLSERVER01 -LogNumber 1 -Text "login" -Before '2025-02-20 00:00:00'| ft -AutoSize -Wrap | Out-File c:\test\SQLerrorlog_database.txt
        Invoke-Item C:\test\SQLerrorlog_database.txt

        cls
        Get-DbaErrorLog -SqlInstance LAPTOP-57FE7IRR\MSSQLSERVER01\MSSQLSERVER01 -LogNumber 1 -Text "Database" -After '2024-10-28 00:00:00'| ft -AutoSize -Wrap | Out-File c:\test\SQLerrorlog_database.txt
        Invoke-Item C:\test\SQLerrorlog_database.txt



# Get-DbaProcess: 
        #get DB processes that are not system SPIDS
        Get-DbaProcess -SqlInstance LAPTOP-57FE7IRR\MSSQLSERVER01 -ExcludeSystemSpids | ft -Wrap

 # Get-DbaIoLatency

             # get IO Latency details
               Get-DbaIoLatency -SqlInstance LAPTOP-57FE7IRR\MSSQLSERVER01 | Out-GridView
               Get-DbaIoLatency SQLServerInstance1 | Select-Object * | Out-File C:\test\IOLatency.txt
               Invoke-Item C:\test\IOLatency.txt


#------------------ DATABASES ------------------

<#
Get-DbaDatabase
Test-DBADiskSpeed

Get-DbaLogin
Export-DbaLogin
 Export-DbaInstance

#> 

# Get-DbaInstanceInstallDate 

            #: displays SQL installed details
            <# ---------- parameters: -SQLinstance : <SQL instance name>  #>

            # Get-DbaDatabase 

             # get list of databases
                Get-DbaDatabase -SqlInstance localhost | ft -AutoSize -Wrap
                Get-DbaDatabase -SqlInstance LAPTOP-57FE7IRR\MSSQLSERVER01 | ft -AutoSize -Wrap

             # Test-DBADiskSpeed

             # test diskspeed for databases
               Test-DBADiskSpeed -SQlInstance LAPTOP-57FE7IRR\MSSQLSERVER01 -Database tempdb | Out-Gridview         

             # Get-DbaLogin
             # get logins on instance
                Get-DbaLogin -SqlInstance LAPTOP-57FE7IRR\MSSQLSERVER01 | Out-GridView

            # export-DbaLogin
                Export-DbaLogin -SqlInstance LAPTOP-57FE7IRR\MSSQLSERVER01 -Path 'C:\test\'
                Export-DbaInstance -SqlInstance LAPTOP-57FE7IRR\MSSQLSERVER01 -Path C:\test\
        

# -------------- Connections --------------

<#

Connect-DbaInstance
Get-DbaConnectedInstance
Get-DbaConnection
Test-DbaConnection

#> 

            # Connect-DbaInstance

                    # connect SQL instance
                        Connect-DbaInstance -SqlInstance LAPTOP-57FE7IRR\MSSQLSERVER01
                    # connect via windows login
                        $wincred = Get-Credential Domain\Login123
                        Connect-DbaInstance -SqlInstance LAPTOP-57FE7IRR\MSSQLSERVER01 -SqlCredential $wincred
                    # connect via SQL login
                        $sqlcred = Get-Credential test
                        $server = Connect-DbaInstance -SqlInstance LAPTOP-57FE7IRR\MSSQLSERVER01 -SqlCredential $sqlcred
        
            # Get-DbaConnectedInstance

                    # Get a list of all connected instances
                        Get-DbaConnectedInstance
                    # Gets all connected SQL Server instances and shows the associated connectionstrings as well
                        Get-DbaConnectedInstance | Select *

            # Get-DbaConnection
        
                    # Returns a bunch of information from dm_exec_connections
                    cls
                    #local connection
                    Get-DbaConnection | ft
                    # remote connection
                   Get-DbaConnection -SqlInstance LAPTOP-57FE7IRR\MSSQLSERVER01 | Out-GridView

            # Test-DbaConnection
                    # Tests the connection to a single instance.
                    Test-DbaConnection -SqlInstance LAPTOP-57FE7IRR\MSSQLSERVER01








# -------------- Backups --------------

 # Backup ALL Databases
       Backup-DbaDatabase -SqlInstance LAPTOP-57FE7IRR\MSSQLSERVER01 -Database 'adventureworks2019' -BackupDirectory 'C:\test'



# -------------- Health check --------------

    Get-DbaLastGoodCheckDb -SqlInstance LAPTOP-57FE7IRR\MSSQLSERVER01 | ft -Wrap





# Logspace used by Databases
    Get-DbaDbLogSpace -SqlInstance LAPTOP-57FE7IRR\MSSQLSERVER01 | ft










