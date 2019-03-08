$someSounds = Get-ChildItem hkcu:\AppEvents\Schemes\Apps -Recurse | Get-ItemProperty
foreach ($regkey in $someSounds){
    $strVal = [string]$regkey.'(default)'
    if($strVal.EndsWith(".wav")){
        Set-ItemProperty -Path $regkey.PSPath -name "(default)" -Value ""
    }
}
