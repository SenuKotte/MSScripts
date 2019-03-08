$ThemeSounds = Get-ChildItem hkcu:\AppEvents\Schemes\Apps -Recurse | Get-ItemProperty
foreach ($regkey in $ThemeSounds){
    $strVal = [string]$regkey.'(default)'
    if($strVal.EndsWith(".wav")){
        Set-ItemProperty -Path $regkey.PSPath -name "(default)" -Value ""
    }
}