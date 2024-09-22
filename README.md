# Chapter Master Beta

This is a fork of Chapter Master: Adeptus Dominus.\
Chapter Master (CM) is described as a strategy/simulation game written in GML2, originally designed and developed by Duke.\
Currently, Chapter Master: Adeptus Dominus is further on development by a new team of developers.\
It aims to continue development on the game, fix any bugs, expand and add features.

## The Fork

The fork's main differences are:\
Be more liberal to the interpretation of 40k lore and rules;\
Tuning down the anti-player events and mechanics;\
And otherwise being more generous to how player wants to play.

## Links

[Discord](https://discord.gg/zAGpqHzsXQ)
A place where majority of devs are hanging out.\
[Bay12Forum](http://www.bay12forums.com/smf/index.php?topic=142620.0)
Where Chapter Master was also discussed.\
There also used to be a link on 1d4chan, though we now have a 1d6chan:\
[1d6chan](https://1d6chan.miraheze.org/wiki/Chapter_Master_(game))
There also was tg.

## Contributing

Discord is the best option on contacting the developers.\
There are developer, bug report, suggestion and discussion channels there.\
If you can code or design or draw and you have an interest in WH40K, or grimdark in general, you are welcome to join.

## Running the game locally and developing

To simply play the game, you only need GameMaker.\
0. Ensure you have [GameMaker](https://gamemaker.io/en/download) installed. Ideally versions IDE v2023.8.2.108; Runtime v2023.8.2.152.
1. Clone the repo.
2. Open ChapterMaster.yyp with GameMaker.
3. In GameMaker, click the Run button or press F5 to build the project and start the game.

If You are using more advanced features of GameMaker, the further instructions are as follows:\

The game will then run inside a web app managed by GameMaker, which should also open a new tab in your browser.\
	- If no new tab opens check the output log in GameMaker, there should be a line like this:\
	  _Attempting to open browser - "" with URL "http://localhost:51264/runner.html?game=ChapterMaster"._ \
      Use the link to open the game instance.
4. Play the game!
5. (Optional) Read the code, modify it, test, repeat.

CM does not currently use any external dependencies except GameMaker.

For code changes, you can use any text editor you like, just remember to periodically compile and test in GameMaker.

If you are new to Git, then we recommend reading [Pro Git](https://git-scm.com/book/en/v2). You only need to read the first 3 chapters to comfortably work with Git, optionally chapter 6 to get more info on GitHub. If you prefer a GUI based approach to Git, then we recommend one of the below:
- [GitKraken](https://www.gitkraken.com/) + [tutorials](https://www.gitkraken.com/learn/git/tutorials)
- [Sourcetree](https://www.sourcetreeapp.com/) + [tutorials](https://confluence.atlassian.com/get-started-with-sourcetree)

Both are free and popular. 

## Exporting and creating packages

Creating a package (i.e. creating an .exe with the game) unfortunately requires a GameMaker's Creator paid subscription. If you don't have one, you will only be able to test the game locally and upload the source code and any assets to the repo. 

However, periodically we do create packages from this repo's _main_ branch, so even if you do not have a licence, any changes that you make, publish and get successfully merged to this repo will get exported at some point and the created package will be hosted on a server somewhere, for players to download, play and enjoy. 

[GameMaker subscriptions comparison](https://gamemaker.io/en/get) - you need the Desktop Exports option to create the .exe.\
[Setting up GameMaker export for Windows](https://help.yoyogames.com/hc/en-us/articles/235186048-Setting-Up-For-Windows) - if you have a subscription which allows for creating executables, this link will help you setup the process.