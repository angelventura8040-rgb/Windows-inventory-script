# Windows-inventory-script

## Project overview 

This is a script I created based on PowerShell to collect hardware, operating system, and network configuration from different Windows machines. 

It creates a CSV file, which them can be open using excel. 

## Features of the script 

It collects the computer name, manufacturer, and model. 

Gets CPU and operating system information, like CPU model and operating system version. 

Retrieves and calculates memory and storage information in GIB for clearer identification. 

If a drive has less than 15% of free space, it will flag that drive, and the row on the Excel file will say "low" with red format coloring. 

It will collect network information like IPv4 and DNS server, and it will even tell you what type of network adapter you have.

## Requirements 

Windows operating system 

Windows PowerShell 5.1 or comparable 

Access to Windows CIM and networking commands 

Microsoft Excel 

## How to run 

Download the script. 

Go to the folder where the script is located. 

Run the script. 

The CSV file will be in the folder where you executed the script or the path location if you specify a path 

## Testing 

I tested the script with multiple simulated logical drives, so it works with multiple drives. 

I also tested the script with no network information and configure in a way that it works without internet. 

## Challenges and Solutions 

The part requiring to make the script recognize multiple drives was very complicated for me. I did some research and was able to figure it out using foreach.

Being able to figure out other networks than wifi was complicated since initially i did not know how to make my script recognize other networks like ethernet, but by using FIND netroute and interfaceindex i found a way to do it. Now it should be able to recognize other network like ethernet. 

## Limitations 

It only works on Windows systems. 

Network selection is based on the preferred route to 1.1.1.1 and may differ for other destinations. 

The script has not been tested in every possible network configuration, so problems may arise 

Some hardware information may require appropriate system permissions. 

## Technologies Used 

Powershell 

Common information model (CIM)

Windows networking Commands 

Microsoft Excel 

GITHUD
