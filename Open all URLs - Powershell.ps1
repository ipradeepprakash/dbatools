
cls
$url1 = @(
"https://wordsontech.com/sql-server-always-on-and-read-scale-availability-groups/",
"https://www.mssqltips.com/sqlservertip/3658/how-to-fix-a-corrupt-msdb-sql-server-database/",
"https://mssqltrek.com/2020/09/03/sql-server-read-scale-availability-groups-aka-cluster-less-ags/",
"https://www.sqlshack.com/read-scale-availability-group-in-a-clusterless-availability-group/",
"https://www.mssqltips.com/sqlservertip/1010/sql-database-snapshots-for-reporting-auditing-and-data-recovery/"
)

foreach ($a in $url1) {


Start-Process -FilePath $a -Wait



}
