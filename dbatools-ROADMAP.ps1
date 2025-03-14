<#------------------dbatools-------------------------------------#>
# --- source: chatGPT -----------------------#
<#
Week 1: Getting Started with dbatools & Basic SQL Server Management

        # Day 1-2: Setup & Installation

                # --------- Install dbatools module:--------------------------#

                        Install-Module dbatools -Scope CurrentUser

                # --------- Check if dbatools is installed::--------------------------#

                        Get-Module -Name dbatools -ListAvailable

                #----------- Import and verify: ------------#

                        Import-Module dbatools
                        Get-Command -Module dbatools

                # --------- Get help and documentation: ------------#

                        Get-Help dbatools

                # ---------- test the connectivity to SINGLE INSTANCE--------------#

                        test-dbaconnection -sqlinstance LAPTOP-57FE7IRR\MSSQLSERVER01
                        Test-DbaConnection -SqlInstance $Env:ComputerName

                # ------------ find-dbacommand <'search_term'> ----------#

                        find-dbacommand DBCC
                        find-dbacommand -tag job

                # ------------ Get SQL Server instances: ------------#

                        Find-DbaInstance -ComputerName localhost
                        Get-DbaInstanceProperty -SqlInstance localhost
                        find-dbainstance -computername localhost
                

                #------------- Get SQL Server instances: --------------#

                        Find-DbaInstance -ComputerName localhost
                        Get-DbaInstanceProperty -SqlInstance localhost

        
                # ----------------list the database names -----------------#

                        get-sqldatabase -ServerInstance 'LAPTOP-57FE7IRR\MSSQLSERVER01' | where {$_.name -notin ('tempdb')} | Out-GridView
                        get-sqldatabase -ServerInstance 'LAPTOP-57FE7IRR\MSSQLSERVER01' | where {$_.name -notin ('tempdb')} | ft -AutoSize

        
                #------------------ Check SQL Server services: ----------------------------#

                        Get-DbaService -ComputerName localhost

#>


<#

    # -------- Week 2: Backups, Restores, and Database Maintenance ----------------#


                #-------------- Full database backup: -----------------#

                Backup-DbaDatabase -SqlInstance localhost -Database AdventureWorks -Path C:\Backups
        
                #---------------- Restore a database: ------------------#

                Restore-DbaDatabase -SqlInstance localhost -Path C:\Backups\AdventureWorks.bak -WithReplace

                #----------------- Check database integrity --------------#

                   Get-DbaLastGoodCheckDb -SqlInstance LAPTOP-57FE7IRR\MSSQLSERVER01
           
                #----------- perform DBCC CHECKDB -------------#

                Invoke-DbaDbDbccCheckConstraint -SqlInstance laptop-57fe7irr\mssqlserver01
                Invoke-DbaDbDbccCheckConstraint -SqlInstance SqlServer2017 -Database CurrentDB





#>


