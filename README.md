# PyInstaller Compiler

Here is another alternative to cross-compiling Python applications for different operating systems using PyInstaller with Docker.

### Prereqs:

- docker installed
- `requirements.txt` file in the project root directory

### Run the following command in command prompt (windows)/terminal (mac)

```
docker run -v ${PWD}/:/app/ ghcr.io/jcucuzza/pyinstaller-compiler-linux \
    "pyinstaller -F main.py --onefile --name hello-world --clean"
```

Within the quotation marks of the docker command above, run your pyinstaller command. The output of pyinstaller will be located in the dist/ folder. It is important to note that if you did not add the pyinstaller command --onefile, it will revert to its default behavior of --onedir. Using the --onefile option will result in a fat executable containing all dependencies.
