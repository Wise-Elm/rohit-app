This is a simple bash script I made for a friend that sends the contests of email.txt
to the emails listed in emaillist.txt using gmail. This is meant to be scheduled through
an app such as cron on Linux, or any other scheduling app.


sendemail.sh 
    Make sure it is executable with chmod +x sendemail.sh. This is the main script that runs everything. Replace the google app password with one you make up. See the comment in the script for that.

email.txt
    Anything in this file will be the body of the email you send out. Have your another script replace the contents of this with the information you want sent out.

emaillist.txt
    Addresses you want the email sent to. Put each address on a new line. Don't add commas or anything like that.

log.txt
    This shows you a record of everything sendemail.sh has done.

