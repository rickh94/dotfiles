# Defined in /tmp/fish.T6QUOL/diceware_pass_insert.fish @ line 1
function diceware_pass_insert
	if not set -q argv[1]
    echo "specify path to save password"
  else
    yes (diceware -d" ") | pass insert -e $argv
  end
end
