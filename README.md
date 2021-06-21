# tftpd

Simple tftp server based on tftpd-hpa

## Environment variables

Name          | Default Value                                         | Description
--------------|-------------------------------------------------------|------------
TFTP_USERNAME | "tftp"                                                | tftp username
TFTP_DIRECTORY| "/srv/tftp"                                           | tftp directory
TFTP_ADDRESS  | ":69"                                                 | tftp address and port to listen on
TFTP_OPTIONS  | "<nobr>--foreground</nobr> <nobr>--secure</nobr>"      | tftp options (you could also override it by using different startup command) <br />Note: --foreground can't be disabled as it leads to container exit 

List of possible option can be found [here](https://manpages.debian.org/testing/tftpd-hpa/tftpd.8.en.html)

## Tips and Tricks
* To be able to write files, use option "--create"
* For convinience, you could use it back to back with FTP container. For example, [this one](https://github.com/stilliard/docker-pure-ftpd). Just make sure you're using the same user and folder mappings. Note: to avoid possible "race conditions" don't define "--create" option (as by default) or mount a volume for tftp container as read-only 