# Disable shadow in screenshots of windows.
defaults write com.apple.screencapture disable-shadow -bool true

# Treat punctuation (e.g., periods) as word-boundaries for ⌥-arrow-key skipping
# and double-click selection.
defaults write .GlobalPreferences AppleTextBreakLocale en_US_POSIX

# Set Cursor as the default editor for various file types.
# Change to `com.microsoft.VSCode` for VS Code.
duti -s com.todesktop.230313mzl4w4u92 public.data all # Works for files without a filename extension.
duti -s com.todesktop.230313mzl4w4u92 public.json all
duti -s com.todesktop.230313mzl4w4u92 public.plain-text all
duti -s com.todesktop.230313mzl4w4u92 public.python-script all
duti -s com.todesktop.230313mzl4w4u92 public.shell-script all
duti -s com.todesktop.230313mzl4w4u92 public.source-code all
duti -s com.todesktop.230313mzl4w4u92 public.text all
duti -s com.todesktop.230313mzl4w4u92 public.unix-executable all
duti -s com.todesktop.230313mzl4w4u92 .c all
duti -s com.todesktop.230313mzl4w4u92 .cfg all
duti -s com.todesktop.230313mzl4w4u92 .conf all
duti -s com.todesktop.230313mzl4w4u92 .cpp all
duti -s com.todesktop.230313mzl4w4u92 .cs all
duti -s com.todesktop.230313mzl4w4u92 .css all
duti -s com.todesktop.230313mzl4w4u92 .go all
duti -s com.todesktop.230313mzl4w4u92 .java all
duti -s com.todesktop.230313mzl4w4u92 .js all
duti -s com.todesktop.230313mzl4w4u92 .json all
duti -s com.todesktop.230313mzl4w4u92 .jsx all
duti -s com.todesktop.230313mzl4w4u92 .less all
duti -s com.todesktop.230313mzl4w4u92 .log all
duti -s com.todesktop.230313mzl4w4u92 .lua all
duti -s com.todesktop.230313mzl4w4u92 .md all
duti -s com.todesktop.230313mzl4w4u92 .mdx all
duti -s com.todesktop.230313mzl4w4u92 .php all
duti -s com.todesktop.230313mzl4w4u92 .pl all
duti -s com.todesktop.230313mzl4w4u92 .py all
duti -s com.todesktop.230313mzl4w4u92 .rb all
duti -s com.todesktop.230313mzl4w4u92 .sass all
duti -s com.todesktop.230313mzl4w4u92 .scss all
duti -s com.todesktop.230313mzl4w4u92 .sql all
duti -s com.todesktop.230313mzl4w4u92 .svg all
duti -s com.todesktop.230313mzl4w4u92 .toml all
duti -s com.todesktop.230313mzl4w4u92 .ts all
duti -s com.todesktop.230313mzl4w4u92 .tsx all
duti -s com.todesktop.230313mzl4w4u92 .txt all
duti -s com.todesktop.230313mzl4w4u92 .vue all
duti -s com.todesktop.230313mzl4w4u92 .wsdl all
duti -s com.todesktop.230313mzl4w4u92 .yaml all
duti -s com.todesktop.230313mzl4w4u92 .yml all
