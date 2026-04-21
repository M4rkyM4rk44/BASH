#!/usr/bin/env bash

# Tools needed: curl & jq (sudo apt install curl jq)

# Have I Been Pwned API Key
api="[API_KEY]" # Your API Key goes here

# List of Emails to Check
emails=(
    "email@test.com"
    )

# Loop
for i in "${emails[@]}"
do
    curl -H "hibp-api-key:$api" https://haveibeenpwned.com/api/v3/breachedaccount/$i?truncateResponse=false | jq . > $i.json
    
    # Check if the file is empty
    if [ ! -s "$i.json" ]; then
        rm "$i.json"
    fi
    
    # Update backup file
    if [ -f "$i.json.bak" ]; then
        echo "" >> "$i.json.bak"
        echo "=================================" >> "$i.json.bak"
        date >> "$i.json.bak"
        echo "=================================" >> "$i.json.bak"
        echo "" >> "$i.json.bak"
        cat "$i.json" >> "$i.json.bak"
        
    # Create backup file
    else
        if [ -f "$i.json" ]; then
            cp "$i.json" "$i.json.bak"
        fi
    fi
    # Pause for 6 seconds for API throttle
    sleep 6s
done
