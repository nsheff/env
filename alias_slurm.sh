# Nathan's quick aliases.
# To use these, just source this file in your .bashrc


# Count jobs by username
alias scount="squeue | awk '{print \$4 \"(\" \$5 \")\"}' | sort | uniq -c  | sort -n -k1,1 | tr \"\n\" \"\t\" | sed 's/\([0-9][0-9]*\) /\1:/g' | sed 's/ //g' | fmt -w 140"

# Look at just current user's queue
alias myq='squeue -o " %.42j %.8i %.4P %.2t %.10M %.7m %z %c %.8R %.8n %.8a" -u `whoami` -S i; scount'

# Given a particular user, look at just this user's queue.
subq() {
	squeue -o " %.42j %.8i %.4P %.2t %.10M %.7m %z %c %.8R %.8n %.8a" -u $1 -S i;
}

# Look at the queues for all users in my primary group
ourq() {
	primary_group=`groups | cut -f1 -d' '`
	for x in `getent group $primary_group | cut -f4 -d':' | sed 's/,/ /g' -`; do
	echo "$x"; subq $x;
	done
	scount
}

# Show historical jobs in recent history for a given user
subhist() {
	sacct --starttime `date +%Y-%m-%d -d "-3 month"` --units=G -u $1 -o "User,JobID,Jobname%30,partition,state,start,elapsed,MaxRss%6,ncpus%1,Account%6"
}

# Show my recent jobs
myhist() {
	subhist `whoami`
}

# Show personal recent jobs for all members of my primary group
ourhist() {
	primary_group=`groups | cut -f1 -d' '`
	for x in `getent group $primary_group | cut -f4 -d':' | sed 's/,/ /g' -`; do
	echo "$x"; subhist $x;
	done
}

