#Requires -RunAsAdministrator
$current_dir = Get-Location


$url = $args[0]

$action = New-ScheduledTaskAction -Execute "$current_dir\daemon.exe" -Argument "--url $url" -WorkingDirectory $current_dir
$trigger = New-ScheduledTaskTrigger -AtLogon
$principal = New-ScheduledTaskPrincipal -GroupId "BUILTIN\Administrators" -RunLevel Highest
$settings = New-ScheduledTaskSettingsSet -Hidden
$task = New-ScheduledTask -Action $action  -Trigger $trigger -Settings $settings -Principal $principal

Register-ScheduledTask thinkremote -InputObject $task 