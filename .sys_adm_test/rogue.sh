#!/bin/bash

#finding rogue file and paste the output
sudo find / -type f -printf "%s\t%p\n" | sort -n | tail -1; find / -type f -printf '%s %p\n' | sort -nr | head -10 |& tee -a rogue_output.txt

#sending the alert email
echo "This is the message body and contains the message" | mailx -v -r "Metestemail@yahoo.com" -a /rogue_output.txt -s "This is the subject" -S smtp="mail.yahoo.com:587" -S smtp-use-starttls -S smtp-auth=login -S smtp-auth-user="Metestemail@yahoo.com" -S smtp-auth-password="abc123" -S ssl-verify=ignore alarm@animapoint.net 