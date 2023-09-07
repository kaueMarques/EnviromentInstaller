# EnviromentInstaller


## Windows Mode

1. Start Power Shell with administration mode 

2. Run command to enable scripts 

```shell
 Set-ExecutionPolicy RemoteSigned
```

3. Start a instalation 
```shell
iex (iwr https://raw.githubusercontent.com/kaueMarques/EnviromentInstaller/master/WIN11-DevEnviromentInstaller.ps1).Content
```

## Linux Mode

Run with sudo
```shell
sudo curl -s https://raw.githubusercontent.com/kaueMarques/EnviromentInstaller/master/Linux-DevEnviromentInstaller.sh | bash
```
