cls
$ErrorActionPreference = "Stop"

echo "Building firmware..."
zig build

$VolumeLabel = "RPI-RP2"
Write-Host "Waiting for USB drive with volume label '$VolumeLabel'..." -ForegroundColor Cyan

$FIRMWARE="zig-out/firmware/zigmkay.uf2"
# Keep checking until the drive appears
while ($true) {
    # Get all volumes with a drive letter
    $drive = Get-Volume | Where-Object {
        $_.DriveLetter -and $_.FileSystemLabel -eq $VolumeLabel
    }

    if ($drive) {
        $TARGET = $drive.DriveLetter + ":\zigmkay.uf2"
        Write-Host "Rp2040 detected as drive $($drive.DriveLetter). Copying to $TARGET" -ForegroundColor Green
        cp "$FIRMWARE" "$TARGET"
        break
    }

    Start-Sleep -Seconds 1
}

# Continue with whatever you want to do next
Write-Host "Performing next steps with drive $letter..." -ForegroundColor Yellow

