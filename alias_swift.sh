# Aliases for interacting with the SwiftStack file system.

# Prompt for a password on first swift use, to prevent
# storing password in plain text file.
# if password ($ST_KEY) is not already set in current shell,
# prompt for it and set it. Use 'swf' as a replacement for 'swift'
swf() {
  if [ -z ${ST_KEY} ]; then echo -e "ST_USER:${ST_USER}\nPassword:"; read -s ST_KEY; fi
  export ST_KEY
  swift "$@"
}


# It's annoying that you have to specify --segment-size if the
# file is too big. Here's an alias to make that easier
# swift upload
swfu() {
  swf upload --segment-size 1073741824 "$@"
}  