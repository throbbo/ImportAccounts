Db Readme
===============

1. Run restore.bat
2. Make a copy of deploy.bat.templ and prefix it with "dev_" and change extenion to .bat
3. Edit your batch file created in step 2 and modify the following variables:
	- server
	- database
	- user
	- password
4. Run the batch file using arguments 
	- create			=> creates database but does not drop
	- upgrade			=> upgrades existing database
	- dropcreate		=> drops database first then creates database and runs scripts
