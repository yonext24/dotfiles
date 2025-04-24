# Since i mapped Caps Lock key to be AltGr, sometimes when i play something i need to map AltGr to do nothing
# because i keep pressing it and alt-tabbing, so i made this script to inter-change two files, one that has my default config
# and another one that has the AltGr key mapped to nothing

cd $HOME
cd 'C:\Users\yoni\AppData\Local\Microsoft\PowerToys\Keyboard Manager'
cp default.json defaultbackup.json
rm -Force default.json
mv otherone.json default.json
mv defaultbackup.json otherone.json

taskkill /F /IM PowerToys.KeyboardManagerEngine.exe
& 'C:\Users\yoni\AppData\Local\PowerToys\KeyboardManagerEngine\Powertoys.KeyboardManagerEngine.exe'
