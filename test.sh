rdom () { local IFS=\> ; read -d \< E C ;}


function check()
{
	echo $1
	if [[ $(file --mime-type -b $1) == "text/xml" ]]; then
		echo "HIT"
		rdom $1
	fi
}

# Check each file to commit
for line in $(git diff --name-only --cached)
do
	check $line
done

# END
echo "Pre-commit-end" >&2
exit 1
echo "do not come here"