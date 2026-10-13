$computer = Get-ciminstance -classname win32_computersystem
$disk = get-ciminstance -classname win32_logicaldisk

$CPU = get-ciminstance -classname win32_processor 

$OS = get-ciminstance -classname win32_operatingsystem


$route = find-netroute -remoteipaddress "1.1.1.1" 

$adapterindex = $route | select-object -first 1 -expandproperty interfaceindex


$network = get-netipconfiguration -interfaceindex $adapterindex

$DNS = $network.DNSserver.ServerAddresses




$inventory = foreach($drive in $disk ){
         
if ($drive.size -le 0) {
        continue 
  }                                                                                        
     $diskspace = [math]::round($drive.freespace / $drive.size * 100, 2 )

   $diskstatus = if($diskspace -lt 15) { 'LOW'} else { 'OK'} 



 [pscustomobject]@{
 computername = $computer.name
 manufacturer = $computer.manufacturer
 model = $computer.model
 Drive = $drive.deviceid
 ram_in_GiB = [math]::round($computer.totalphysicalmemory /1GB, 2)
 Diskspercent = $diskspace 
 diskstate = $diskstatus
 DiskSize_GiB   = [math]::round($drive.size /1GB, 2) 
 freespace_GiB    = [math]::round($drive.freespace /1GB, 2) 
 CPU = $CPU.name 
 Operating_system = $OS.caption 
 Operating_system_version = $OS.version
 IPV4_adress = $network.ipv4address.IPAddress
 DNS_Server = $DNS -join ","
 networkadapter = $network.interfacealias

}




}
$inventory | export-csv -path   inventory2.csv       -notypeinformation 
  

