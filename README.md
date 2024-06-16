# Main 
## Android App 
## IOS APP 


# TO ALLOW USER TO SWITCH BETWEEN LIGHT MODE AND DARK MODE
- install provider
- add theme provider file in the themes file 
- Provider.of<ThemeProvider>(context, listen: false).toggleTheme(); //to toggle theme

- Scaffold background color : backgroundColor: Theme.of(context).colorScheme.surface,