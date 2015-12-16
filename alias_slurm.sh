# Nathan's quick aliases.
# To use these, just source this file in your .bashrc


alias scount="squeue | awk '{print \$4 \"(\" \$5 \")\"}' | sort | uniq -c"
alias myq='squeue -o " %.42j %.8i %.4P %.2t %.8M %.5m %z %c %.4R %n" -u `whoami` -S i; scount'


