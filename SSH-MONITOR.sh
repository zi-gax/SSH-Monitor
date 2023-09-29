#!/bin/bash

WEBHOOK_URL=""
JSON_INFO=$(curl -s http://ip-api.com/json/$PAM_RHOST\?fields\=country,city,isp,query)
COUNTRY=$(echo "$JSON_INFO" | jq -r '.country')
CITY=$(echo "$JSON_INFO" | jq -r '.city')
ISP=$(echo "$JSON_INFO" | jq -r '.isp')

case "$PAM_TYPE" in
    open_session)
        PAYLOAD='{
            "embeds": [
                {
                "title": " '$PAM_USER' Log in to '$HOSTNAME' ",
                "description": "Country : '$COUNTRY'\nCity  :  '$CITY'\nISP : '$ISP'\nIP : '$PAM_RHOST'\n  ",
                "color": 65280,
                "footer": {
                    "text": "Created By Zi-Gax",
                    "icon_url": "https://avatars.githubusercontent.com/u/67065043?v=4"
                },
                "timestamp": "'"$(date -u +"%Y-%m-%dT%H:%M:%S.000Z")"'"
                }
            ],
            "username": "・Hunt (SSH-log)・",
            "avatar_url": "https://github.com/zi-gax/zi-gax/assets/67065043/354b9630-7b3d-4364-a605-866b884dd57f"
            }'
        ;;
    close_session)
        PAYLOAD='{
            "embeds": [
                {
                "title": " '$PAM_USER' Log out to '$HOSTNAME' ",
                "description": "Country : '$COUNTRY'\nCity  :  '$CITY'\nISP : '$ISP'\nIP : '$PAM_RHOST'\n  ",
                "color": 16711680,
                "footer": {
                    "text": "Created By Zi-Gax",
                    "icon_url": "https://avatars.githubusercontent.com/u/67065043?v=4"
                },
                "timestamp": "'"$(date -u +"%Y-%m-%dT%H:%M:%S.000Z")"'"
                }
            ],
            "username": "・Hunt (SSH-log)・",
            "avatar_url": "https://github.com/zi-gax/zi-gax/assets/67065043/354b9630-7b3d-4364-a605-866b884dd57f"
            }'
        ;;
esac

if [ -n "$PAYLOAD" ] ; then
    curl -X POST -H 'Content-Type: application/json' -d "$PAYLOAD" "$WEBHOOK_URL"
fi
