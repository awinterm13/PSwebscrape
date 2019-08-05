<#
This works in 5.0  not supported in core.
#>

Add-Type -AssemblyName System.Speech

$voice = New-Object System.Speech.Synthesis.SpeechSynthesizer
$voice.Speak("Hello World")
 