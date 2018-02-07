Author: Guillermo Camacho
Topic: Laboratory 1 - IBIO4680
Date: 6/02/2018

1. What is the grep command?
It is a command used to search text. It searches the given file for lines containing a match to the given strings or words. The syntax is as follows:

grep 'word' filename
grep 'word' file1 file2 file3
grep 'string1 string2'  filename
cat otherfile | grep 'something'
command | grep 'something'
command option1 | grep 'data'
grep --color 'data' fileName

source: 
https://www.cyberciti.biz/faq/howto-use-grep-command-in-linux-unix/

2. What is the meaning of #! /bin/bash at the start of scripts?
It tells the shell to use the bash program to interpret the script with, when executed. Some other examples are:
#!/bin/sh — Execute the file using sh, the Bourne shell, or a compatible shell
#!/bin/csh — Execute the file using csh, the C shell, or a compatible shell
#!/usr/bin/perl -T — Execute using Perl with the option for taint checks
#!/usr/bin/php — Execute the file using the PHP command line interpreter
#!/usr/bin/python -O — Execute using Python with optimizations to code
#!/usr/bin/ruby — Execute using Ruby
source:
https://stackoverflow.com/questions/13872048/bash-script-what-does-bin-bash-mean

3. How many users exist in the course server?

To obtain the users I have selected the commands compgen, wc,

vision@ing-542:~$ compgen -u | wc

The results are,

     42      42     345

So, there are 42 users

4. What command will produce a table of Users and Shells sorted by shell (tip: using cut and sort )

cut -d ":" -f 1,7 /etc/passwd | sort -t: -k2 

The command cut allows to cut the data from columns 1 (user) and 7 (shell). It uses a delimiter “:”
The command sort allows to sort the data with respect to the second column. 
The result is in Appendix 1

5. Create a script for finding duplicate images based on their content (tip: hash or checksum) You may look in the internet for ideas, Do not forget to include the source of any code you use.


Assuming that I have an array A with the checksum of each image, I propose the next algorithm

int main ()
{
int i=0;
for(int i = 0 ; i < n ; i ++)
{	
	for(int j=0 ; j<n ; j++)
		{
		if ( A[i]==A[j])
			cout<<nameOf(A[j})<<” ”;
		}
	cout<<endl;	
}			
return 0;
}


The function  nameOf(x) returns the name of the picture with checksum x

6. Download the bsds500 image segmentation database and decompress it (keep it in you hard drive, we will come back over this data in a few weeks).

tar -xzvf BSR_bsds500.tgz.part -C ./lab1Images

7. What is the disk size of the uncompressed dataset, How many images are in the directory 'BSR/BSDS500/data/images'?

guillermo@guillermo-Latitude-E6420:~/sipi_images/lab1Images$ du -hs ./BSR
73M	./BSR

guillermo@guillermo-Latitude-E6420:~/sipi_images/lab1Images$ find ./BSR/BSDS500/data/images -name "*" | wc -l
507

8. What is their resolution, what is their format?

Some of them have resolution is 481x321, other ones have resolution 321x481. Those data were obtained with the next bash-script


#!/bin/bash
# go to Lab directory
cd ~/sipi_images/lab1Images

# find all files whose name end in .jpg
images=$(find ./BSR/BSDS500/data/images -name *.jpg)

#iterate over them
for im in ${images[*]}
	do
		# print the format
		identify $im | cut -d " " -f 3
	done


The format of all the images is jpg. It was conclude with the command,

find ./BSR/BSDS500/data/images -name "*"

9. How many of them are in landscape orientation (opposed to portrait)

landscape= 481x321

I have founded 348 images in landscape. The result was computed with the next code,

#!/bin/bash
# go to Lab directory
cd ~/sipi_images/lab1Images
num_landscape=0
# find all files whose name end in .jpg
images=$(find ./BSR/BSDS500/data/images -name *.jpg)
#iterate over them
for im in ${images[*]}
	do
		# print the format
		identify $im | cut -d " " -f 3 | grep -q -i 481x321
		# $? gives the exit code of the last command,  it will be zero if a match was found
		if [ $? -eq 0 ]
			then
			let num_landscape=num_landscape+1
			echo $im is landscape
		else
			echo $im is portrait
		fi
	done
echo $num_landscape

10. Crop all images to make them square (256x256). Tip: do not forget about imagemagick

Work this point with the commands
mogrify -crop 640x480+50+100 foo.png
convert foo.png -crop 640x480+50+100 out.png

source> https://codeyarns.com/2014/11/15/how-to-crop-image-using-imagemagick/




Appendix 1

acastillo:/bin/bash
alejandromateo:/bin/bash
diegoangulo:/bin/bash
estebanfederico:/bin/bash
ingcg:/bin/bash
jcleon:/bin/bash
juansantiago:/bin/bash
lapardo:/bin/bash
pa.arbelaez:/bin/bash
root:/bin/bash
rvandres:/bin/bash
vision:/bin/bash
_apt:/bin/false
colord:/bin/false
landscape:/bin/false
messagebus:/bin/false
postfix:/bin/false
syslog:/bin/false
systemd-bus-proxy:/bin/false
systemd-network:/bin/false
systemd-resolve:/bin/false
systemd-timesync:/bin/false
usbmux:/bin/false
uuidd:/bin/false
sync:/bin/sync
backup:/usr/sbin/nologin
bin:/usr/sbin/nologin
daemon:/usr/sbin/nologin
games:/usr/sbin/nologin
gnats:/usr/sbin/nologin
irc:/usr/sbin/nologin
list:/usr/sbin/nologin
lp:/usr/sbin/nologin
mail:/usr/sbin/nologin
man:/usr/sbin/nologin
news:/usr/sbin/nologin
nobody:/usr/sbin/nologin
proxy:/usr/sbin/nologin
sshd:/usr/sbin/nologin
sys:/usr/sbin/nologin
uucp:/usr/sbin/nologin
www-data:/usr/sbin/nologin
