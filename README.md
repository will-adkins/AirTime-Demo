<div align="center">
<img src="https://gyazo.com/26a1dc0b6fa056fad0e1831b8640d2dc.png = 50x50" width="200">


# <b> [playPORTAL](https://www.playportal.io) 
</div>

### App Overview
<br/>
<p>AirTime is an app that brings the playPORTAL SDK and the Apple Watch together! Go outside and get on your pogo stick and track your jumps using our app.</p>

## Getting Started (playPORTAL setup)

* ### <b>Step 1:</b> Create playPORTAL Studio Account

	* Navigate to [playPORTAL Studio](https://studio.playportal.io)
	* Click on <b>Sign Up For FREE Account</b>
	* After creating your account, email us at accounts@playportal.io to introduce yourself and your project and we will consider you for early access.
 

* ### <b>Step 2:</b> Register your App with playPORTAL

	* After confirmation, log in to the [playPORTAL Studio](https://studio.playportal.io)
	* In the left navigation bar click on the <b>Apps</b> tab.
	* In the <b>Apps</b> panel, click on the "+ Add App" button.
	* Add an icon, <b>name</b> & description for your app.
	* For "Environment" leave "Sandbox" selected.
	* Click "Add App"
	
	
* ### <b>Step 3:</b> Generate your Client ID and Client Secret

	* Tap "Client IDs & Secrets"
	* Tap "Generate Client ID"
	* The values generated will be used later.
	* CAUTION: Keep your Client ID & Secret private! Do not commit your credentials!
 
* ### <b>Step 4:</b> Setup GitHub Repo
    * Fork this repo
    * After forking, download or clone it to your local machine
 
* ### <b>Step 5:</b> Fetch repo to all machines
```
 git clone https://github.com/Clemson-Hack-a-Thon-2018/AirTime-Demo.git
 cd AirTime
```
* ### <b>Step 6:</b> Launch Terminal and install Cocopods version 1.6 [Here](https://cocoapods.org/)
	* ### <b> Step 6.1: </b>After Cocopods is installed 
	 * Open up a terminal, and move into your project folder and do a pod install.
```
pod install
```
* ### <b>Step 7:</b> Launch Xcode 
    * Open up the .xcworkspace file
    * Select a simulator that runs an iPhone and Apple Watch together 
    * Press the play button and run AirTime

* ### <b>Step 8:</b> Hide your keys.
	* The Client ID, & Secrets tied to your application <b>NEED</b> to be hidden
	* This can be done by creating a .gitignore file 
```
cd AirTime
touch .gitignore
```

* ### <b>Step 8.1:</b> Open up the project in a different IDE
	* To edit your .gitignore open the project in either [Atom](https://atom.io/) or [VSCode](https://code.visualstudio.com/)
	* After the project is open, add the file you stored keys in to the .gitignore
	
* ### <b>Step 9:</b> Develop! 
	* If you made it this far, great you are ready!!!
	* Good luck and have fun developing. 
    
    
* ### <b>Got Stuck?</b> If you did on any of the steps listed here are some links to help!
    * Here is another cocoapods installation directions [link](https://iosdevcenters.blogspot.com/2015/12/how-to-install-cocoapods-in-xcode.html)
    * Read [this](https://github.com/joshnh/Git-Commands) to get a refresher on Git commands 




