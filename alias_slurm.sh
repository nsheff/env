# Nathan's quick aliases.
# To use these, just source this file in your .bashrc


alias scount="squeue | awk '{print \$4 \"(\" \$5 \")\"}' | sort | uniq -c"
alias myq='squeue -o " %.48j %.8i %.4P %.2t %.10M %.7m %z %c %.8R %.8n" -u `whoami` -S i; scount'


