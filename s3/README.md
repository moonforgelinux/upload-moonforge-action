# Configuring the service with s3cmd

This document summarizes:

* Common configurations for the s3-compatible services when using this GitHub action.
* Usage examples of the s3cmd CLI tool to apply these configurations.

## Install s3cmd

To install [s3cmd](https://github.com/s3tools/s3cmd):

```sh
$ pip install --user s3cmd
$ s3cmd --version
$ s3cmd --configure # for interactive setup of credentials
$ s3cmd ls s3://my-bucket
```

## Life cycle management

To configure the service to automatically delete uploaded artifacts:

```sh
$ s3cmd expire s3://my-bucket --expiry-days=7 --expiry-prefix=my/prefix/to/pr/artifacts/
```

If multiple rules are needed for different prefixes:

```sh
$ s3cmd getlifecycle s3://my-bucket # check for current rules
$ s3cmd dellifecycle s3://my-bucket # delete all current rules
$ s3cmd setlifecycle lifecycle.xml s3://my-bucket # upload new set of rules
```

Check [lifecycle.xml](./lifecycle.xml) for a complete XML policy example.
