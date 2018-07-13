#!/bin/bash

ip=$(ipconfig getifaddr en0)
publicIp=$(dig +short myip.opendns.com @resolver1.opendns.com)

echo "$ip | $publicIp"
