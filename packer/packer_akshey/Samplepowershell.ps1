echo "starting powershell"
mkdir newasset
cd newasset
New-Item assetfile.txt
$computername = hostname
Set-Content assetfile.txt $computername
get-Content assetfile.txt
Echo "Powershell Completed"