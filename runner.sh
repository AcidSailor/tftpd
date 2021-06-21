#!/bin/bash
# ENV parsing & provisioning
if [[ $TFTP_USERNAME != "tftp" && $TFTP_DIRECTORY != "/srv/tftp" ]]; then
    echo "Creating $TFTP_DIRECTORY"
    mkdir -p $TFTP_DIRECTORY
    echo "$TFTP_DIRECTORY Created"
    echo "Creating $TFTP_USERNAME"
    useradd $TFTP_USERNAME --home $TFTP_DIRECTORY --shell /usr/sbin/nologin
    echo "$TFTP_USERNAME Created"
fi

# ENV 2 CFG
echo "Generating Config..."
echo "# /etc/default/tftpd-hpa
                          
TFTP_USERNAME=\""$TFTP_USERNAME"\"      
TFTP_DIRECTORY=\""$TFTP_DIRECTORY"\"
TFTP_ADDRESS=\""$TFTP_ADDRESS"\"
TFTP_OPTIONS=\"--foreground $@\"

" | tee /etc/default/tftpd-hpa 

# Startup
echo "Running TFTPD"
echo "  /etc/init.d/tftpd-hpa start"

exec /etc/init.d/tftpd-hpa start 
