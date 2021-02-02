//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	/* {"Mem:", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	30,		0}, */
	/* {"", "date '+%b %d (%a) %I:%M%p'",					5,		0}, */
	{"" , "sh /home/baizeyv/willGit/dwmblocks/script/pkg.sh" , 0  , 8} ,
	{"" , "sh /home/baizeyv/willGit/dwmblocks/script/disk.sh"     , 1  , 7} ,
	{"" , "sh /home/baizeyv/willGit/dwmblocks/script/vol.sh"   , 1  , 3} ,
	{"" , "sh /home/baizeyv/willGit/dwmblocks/script/cpu.sh"      , 1  , 4} ,
	{"" , "sh /home/baizeyv/willGit/dwmblocks/script/battery.sh"  , 60 , 2} ,
	{"" , "sh /home/baizeyv/willGit/dwmblocks/script/internet.sh" , 1  , 6} ,

    {"" , "sh /home/baizeyv/willGit/dwmblocks/script/nettraf.sh"  , 2  , 5} ,
    {"" , "echo \"                                   \""  , 0 , 9} ,
    {"" , "echo \"                                  \""  , 0 , 9} ,
	{"" , "sh /home/baizeyv/willGit/dwmblocks/script/datetime.sh"        , 1  , 1} ,


    /* {"" , "echo \"                      \""  , 60 , 9} , */

};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " ";
static unsigned int delimLen = 5;
