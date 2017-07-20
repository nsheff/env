# Nathan's quick aliases.
# To use these, just source this file in your .bashrc


alias scount="squeue | awk '{print \$4 \"(\" \$5 \")\"}' | sort | uniq -c  | tr \"\n\" \"\t\" | sed 's/\([0-9][0-9]*\) /\1:/g' | sed 's/ //g' | fmt"
alias myq='squeue -o " %.48j %.8i %.4P %.2t %.10M %.7m %z %c %.8R %.8n" -u `whoami` -S i; scount'


subq() {
	squeue -o " %.48j %.8i %.4P %.2t %.10M %.7m %z %c %.8R %.8n" -u $1 -S i;
}

ourq() {
	primary_group=`groups | cut -f1 -d' '`
	for x in `getent group $primary_group | cut -f4 -d':' | sed 's/,/ /g' -`; do
	echo "$x"; subq $x;
	done
	scount
}

