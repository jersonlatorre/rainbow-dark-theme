jq 'del(.tokenColors[] | select(.name == "js/ts italic"))' ./themes/vibrant-dark-color-theme.json > tmp.json && mv tmp.json ./themes/vibrant-dark-color-theme.json
vsce package
code --install-extension jersonlatorre-0.0.1.vsix
git add .
git commit -m "update"
git push