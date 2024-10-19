- [Set Up a Python Virtual Environment](#set-up-a-python-virtual-environment)
- [Set Up Interactive Plotting in Bash Shell](#set-up-interactive-plotting-in-bash-shell)
- [Resolve LaTeX Error in Matplotlib](#resolve-latex-error-in-matplotlib)
- [Return to Default Plotting Settings After Using SciencePlot](#return-to-default-plotting-settings-after-using-scienceplot)


## Set Up a Python Virtual Environment
**1. Create a Virtual Environment**
A virtual environment can be created using Python's venv module. 
One can name it epoch_venv or a cool name of choice:

```
python3 -m venv ~/epoch_venv
```

**2. Activate the Virtual Environment**
To activate the virtual environment:

```
source ~/epoch_venv/bin/activate
```

Upon activation, the terminal prompt will change to indicate that the virtual environment is active.

**3. Install Required Python Packages**
With the virtual environment activated, the necessary Python packages can be installed using pip:

```
pip install numpy matplotlib scipy
```

## Set Up Interactive Plotting in Bash Shell

**1. Install IPython and PyQt5**
For interactive plotting, IPython is recommended. 
It, along with PyQt5, should be installed within the activated virtual environment:

```
pip install ipython
pip install pyqt5
```

**2. Verify Installation**
To confirm that Matplotlib can successfully switch to the Qt5Agg backend:
IPython should be started with the Qt backend:

```
ipython --matplotlib=qt
```
- **In the event of the following warning:**
`Warning: Ignoring XDG_SESSION_TYPE=wayland on Gnome. Use QT_QPA_PLATFORM=wayland to run on Wayland anyway.`

The installation of additional packages and the configuration of environment variables may be necessary:

Install QtWayland:

```
sudo apt install qtwayland5
```

Set the Qt Platform Environment Variable:

```
echo 'export QT_QPA_PLATFORM=xcb' >> ~/.bashrc
source ~/.bashrc
```

**3. Execute a Python Script in IPython**
To execute a Python script directly from the IPython shell, the following command can be utilized:

```
exec(open('<path_to_your_script>').read())
```
Replace <path_to_your_script> with the actual path of the script to be executed.


## Resolve LaTeX Error in Matplotlib
adding the following line to the Python script:
(import matplotlib as mpl)
```
mpl.rcParams['text.usetex'] = False
```
to the Python script

## Return to Default Plotting Settings After Using SciencePlot
adding the following line to the Python script:
(import matplotlib as mpl)
```
mpl.rcdefaults()
```

