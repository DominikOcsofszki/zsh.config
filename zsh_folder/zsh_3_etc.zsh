countGitAuthor(){
	git ls-files | while read f; do git blame -w -M -C -C --line-porcelain "$f" | grep -I '^author '; done | sort -f | uniq -ic | sort -n
}



alias T='nvim -c "Typr"'
alias t='nvim -c "Typr"'
alias 'docker-build'='docker-buildx build'

function initspring(){
spring init \
  --build=gradle \
  --language=kotlin \
  --boot-version=3.4.5 \
  --packaging=jar \
  --java-version=21 \
  --groupId=org.priv \
  --artifactId=spring \
  --name=spring \
  --description="Demo project for Spring Boot" \
  --package-name=org.priv.spring \
  --dependencies=web,devtools \
  --type gradle-project-kotlin spring
}
function append-safari(){
	cmd=$(cat ~/tmp.menu.txt |fzf|xargs)
	defaults read com.apple.Safari.plist NSUserKeyEquivalents
	defaults write com.apple.Safari.plist NSUserKeyEquivalents -dict-add $cmd $1
	defaults read com.apple.Safari.plist NSUserKeyEquivalents
}

