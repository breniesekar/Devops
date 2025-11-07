#!/bin/bash
# ----------------------------------------------------------------------
# Script Name: http_status_check.sh
# Description: Checks the HTTP status code of guvi.in and
#              prints a success or failure message based on
#              the response.
# -----------------------------------------------------------------------

# Step 1: Define the website URL to check
url="https://www.guvi.in"

# Step 2: Use curl to retrieve only the HTTP status code
# -o /dev/null : Discards the response body
# -s          	 : Runs in silent mode (no progress or errors shown)
# -w "%{http_code}" : Prints only the HTTP status code
status_code=$(curl -o /dev/null -s -w "%{http_code}" "$url")

# Step 3: Display the retrieved HTTP status code
echo "HTTP Status Code for $url: $status_code"

# Step 4: Evaluate the response code and print result
if [ "$status_code" -eq 200 ]; then
    # If status code is 200, the website is reachable
    echo "Success: The website is reachable."
else
    # If not 200, it indicates a failure or error response
    echo "Failure: The website returned an error (code $status_code)."
fi
