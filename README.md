# Daily Naukri Update
[![license](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://github.com/navchandar/Naukri/blob/master/LICENSE) 
[![Test](https://github.com/navchandar/Naukri/actions/workflows/main.yml/badge.svg?branch=master)](https://github.com/navchandar/Naukri/actions/workflows/main.yml)
[![Code Climate](https://codeclimate.com/github/navchandar/Naukri.svg)](https://codeclimate.com/github/navchandar/Naukri)
[![made-with-python](https://img.shields.io/badge/Made%20with-Python-1f425f.svg)](https://www.python.org/) 


### Selenium and Python powered automation script

This script is used to automate information update on the job portal "Naukri". Most recruiters may filter users having the most recent updates on their profile.

Use this script to update your Naukri Profile on schedule everyday, this can be completed in seconds.

In order to use this, you need Git, Python 3, Google Chrome and Selenium webdriver for Chrome in your machine.

## Installation

Install [Python 3.10+](https://www.python.org/getit/) and run the below commands

```bash
git clone https://github.com/navchandar/Naukri.git
cd Naukri
pip install --upgrade pip
python3 -m venv .venv      # create virtual environment for installing dependencies
./.venv/bin/activate.ps1   # source ./.venv/bin/activate  # command for macOS/linux
pip install -r requirements.txt
```

Update ResumePath, Naukri login username, password, mobile number in naukri.py file and then run the script
```bash
python naukri.py
```


## Browsers support

| [<img src="https://raw.githubusercontent.com/alrra/browser-logos/master/src/chrome/chrome_48x48.png" alt="Chrome" width="24px" height="24px" />](http://godban.github.io/browsers-support-badges/)<br>Chrome |
| --------- |
| last 10 versions

