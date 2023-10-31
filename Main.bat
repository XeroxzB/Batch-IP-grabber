@echo off
setlocal enabledelayedexpansion

REM Use a web service to get the external IP address
curl -s "https://ipinfo.io/json" > ipinfo.json

REM Parse the JSON response to get the IP address
for /f "tokens=2 delims" %%a in ('type ipinfo.json ^| find "ip"') do (
    set "ip=%%a"
)

REM Define your Discord webhook URL here
set "webhookUrl=YOUR_DISCORD_WEBHOOK_URL"

REM Send the IP address to Discord using curl
curl -X POST -H "Content-Type: application/json" -d "{\"content\":\"External IP Address: !ip!\"}" %webhookUrl%

REM Clean up the temporary JSON file
del ipinfo.json

endlocal
