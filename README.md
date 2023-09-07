# EnviromentInstaller


## Windows Mode

To enable to use in Windows:

Start Administrator Power Shell

```shell
Get-ExecutionPolicy
```
```shell
 Set-ExecutionPolicy RemoteSigned
```

Quick install command:
```shell
iex (iwr https://raw.githubusercontent.com/kaueMarques/EnviromentInstaller/master/WIN11-DevEnviromentInstaller.ps1).Content
```

## Linux Mode
```shell
sudo curl -s https://raw.githubusercontent.com/kaueMarques/EnviromentInstaller/master/Linux-DevEnviromentInstaller.sh | bash
```
