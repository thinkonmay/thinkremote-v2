#Requires -RunAsAdministrator

# auto run daemon after logon
$current_dir = Get-Location


$url = $args[0]

$action = New-ScheduledTaskAction -Execute "$current_dir\daemon.exe" -Argument "--url $url" -WorkingDirectory $current_dir
$trigger = New-ScheduledTaskTrigger -AtLogon
$principal = New-ScheduledTaskPrincipal -GroupId "NT AUTHORITY\SYSTEM" -RunLevel Highest
$settings = New-ScheduledTaskSettingsSet -Hidden
$task = New-ScheduledTask -Action $action  -Trigger $trigger -Settings $settings -Principal $principal

Register-ScheduledTask thinkremote -InputObject $task 


# disable UAC (User Access Control)
Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -Value 0
