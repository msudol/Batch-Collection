# Datagrabber

Based on the concept of data sync with robocopy snippet

robocopy "\\COMPUTERNAME\c$\FOLDER_of_DATA" "D:\Saved\COMPUTERNAME" /FFT /COPY:DAT /MIR /TEE /LOG+:"C:\Logs\COMPUTERNAME.log" /R:1 /W:1

## Usage

Datagrabber batch script has 3 major actions.

1. A robocopy mirror from a source to a destination.
2. Log the changes only to a logfile.
3. Iterate the logfile and copies just the changes from the source, to a 3rd destination.


