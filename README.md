# upload-moonforge-action

This GitHub action can upload [Moonforge](https://github.com/moonforgelinux/meta-moonforge) images to AWS S3 or any S3-compatible service.

## Usage

See the following example:

```yml
jobs:
  build:
    runs-on: self-hosted
    steps:
      - uses: moonforgelinux/upload-moonforge-action@main
        with:
          host_base: ${{ secrets.S3_HOST_BASE }}
          access_key: ${{ secrets.S3_ACCESS_KEY }}
          secret_key: ${{ secrets.S3_SECRET_KEY }}
          bucket: ${{ secrets.S3_BUCKET }}
          source: build/tmp/deploy/images
          destination: '/builds/${{ github.run_id }}/'
          exclude: '*'
          include: '*.wic.bz2'
          use_https: false
```

## Inputs

| Input       | Description                                            | Mandatory | Default
| ----------- | ------------------------------------------------------ | --------- | -------
| access_key  | Access key for S3-compatible storage                   | Yes       |
| secret_key  | Secret key for S3-compatible storage                   | Yes       |
| host_base   | HOSTNAME:PORT to S3-compatible storage                 | Yes       |
| bucket      | Bucket name from S3-compatible storage                 | Yes       |
| source      | Path to the source directory or file                   | Yes       |
| destination | Path to the destination directory or file              | Yes       |
| use_https   | Use HTTPS connection to S3-compatible storage          | No        | true
| exclude     | Exclude files with this glob pattern (e.g., *.bin)     | No        | ''
| include     | Include files with this glob pattern (e.g., *.wic.bz2) | No        | ''

## Legal

MIT License

Copyright (c) 2026 Igalia, S.L.
