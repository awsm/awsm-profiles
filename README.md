# awsm profiles

Support multiple AWS profiles in AWSM. Easily switch between Production and Non Production.

[![asciicast](https://asciinema.org/a/3cov0pfdbwl4y9mksikiafxm4.png)](https://asciinema.org/a/3cov0pfdbwl4y9mksikiafxm4)


# Usage

AWS uses both `~/.aws/config` and `~/.aws/credentials` as configuration files. AWSM profile uses only `~/.aws/config` and never reads or modifies the `credentials` file. If you do not have a `config` file present, take a look at your credentials file and use the below as an example:

`~/.aws/config`
```
[default]
region = ap-southeast-2

[profile prod]
region = ap-southeast-2

[profile services]
region = ap-southeast-2

[profile nonprod]
region = ap-southeast-2
```

`~/.aws/credentials`
```
[default]
aws_access_key_id = aws_access_key_id
aws_secret_access_key = aws_secret_access_key

[prod]
aws_access_key_id = aws_access_key_id
aws_secret_access_key = aws_secret_access_key

[nonprod]
aws_access_key_id = aws_access_key_id
aws_secret_access_key = aws_secret_access_key

[services]
aws_access_key_id = aws_access_key_id
aws_secret_access_key = aws_secret_access_key

```


