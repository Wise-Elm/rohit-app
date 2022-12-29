#!/bin/bash

# Sender address.
sender="rohit.dhume@gmail.com"

# Email addresses.
addresses=$(cat emaillist.txt)

# Log file.
log=log.txt

# Email subject.
sub="Squash parking info for $(date +%Y-%m-%d)"

# Go to this address to setup a google app password.
# https://myaccount.google.com/apppasswords
# Google app password.
gapp="replace this with your Google app password!"

# Read email body from file.
# Anything in this file will be sent as the email body.
emailbody=$(cat email.txt)

logmessage="
$(date +%Y-%m-%d_%H:%M)\n
Attempting to sent email...\n
Sent from: $sender\n
Subject: $sub\n
Body: \n$emailbody\n
Sent to:
"

# Log to screen.
echo -e $logmessage
# Log to log file.
echo -e $logmessage >> $log

# Iterate through email list (recipient) and send emails.
for receiver in $addresses
	do
	# Send email for each address in emaillist.txt.
	# curl command for accessing the smtp server
	# Send email for each email in emaillist.txt.
    curl -s --url 'smtps://smtp.gmail.com:465' --ssl-reqd \
    --mail-from $sender \
    --mail-rcpt $receiver\
    --user $sender:$gapp \
     -T <(echo -e "From: ${sender}
To: ${receiver}
Subject:${sub}

 ${emailbody}")


	# Log sender to log file.
	echo -e $receiver >> $log
	# Log sender to screen.
	echo -e "$receiver"

	# Sleep for a few seconds between emails.
	sleep 1
	done

# Line reached upon success.
# Log to screen.
echo -e "Emails sent."
# Log to log.
echo -e "Emails sent." >> $log

# Add space at end of log entry.
echo -e "\n" >> $log

exit 0
