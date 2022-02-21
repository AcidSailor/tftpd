# tftpd

Simple tftp server based on tftpd-hpa

## Environment variables

| Name           | Default Value | Description                        |
| -------------- | ------------- | ---------------------------------- |
| TFTP_USERNAME  | "tftp"        | tftp username                      |
| TFTP_DIRECTORY | "/srv/tftp"   | tftp directory                     |
| TFTP_ADDRESS   | ":69"         | tftp address and port to listen on |

You can also pass [options](https://manpages.debian.org/bullseye/tftpd-hpa/in.tftpd.8.en.html) as a command, see [example](https://github.com/AcidSailor/tftpd/blob/master/examples/back2back/docker-compose.yaml#L32)

## Tips and Tricks
* To be able to write files, use option "--create"
* For convenience, you could use it back to back with FTP container. For example, [this one](https://github.com/stilliard/docker-pure-ftpd). Just make sure you're using the same user and folder mappings. Note: to avoid possible "race conditions" don't define "--create" option (as by default) or mount a volume for tftp container as read-only 
