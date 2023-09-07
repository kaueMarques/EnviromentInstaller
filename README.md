# EnviromentInstaller


## Windows Mode

To enable to use in Windows:

Start Power Shell in administration mode

Enable Power Shell Script

```shell
 Set-ExecutionPolicy RemoteSigned
```

Run the script
```shell
iex (iwr https://raw.githubusercontent.com/kaueMarques/EnviromentInstaller/master/WIN11-DevEnviromentInstaller.ps1).Content
```

## Linux Mode
```shell
sudo curl -s https://raw.githubusercontent.com/kaueMarques/EnviromentInstaller/master/Linux-DevEnviromentInstaller.sh | bash
```
