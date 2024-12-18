######################################################################
# chtf

# Uncomment and change the value to override the default:
#CHTF_AUTO_INSTALL="ask" # yes/no/ask

if [[ -f "$(brew --prefix)/share/chtf/chtf.sh" ]]; then
	source "$(brew --prefix)/share/chtf/chtf.sh"
fi
