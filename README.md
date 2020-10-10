# Commits
iOS App: view most recent 25 commits from a repo using the GitHub API.

Please see Notes for custom use.

## CommitsGM App

### User Stories

#### REQUIRED 
- [X] User taps on app icon to open.
- [X] The most recent commits (at least 25) are retrieved from GitHub API and displayed in a list with author, hash, and commit message.

#### BONUS
- [X] App icon is displayed on phone screen.
- [X] AutoLayout implemented.
- [X] Use of SwiftyJSON to fetch data from API.
- [X] Hybrid TDD with unit tests and asserts.
- [X] Styling.

### App Walkthrough GIF

<img src="https://github.com/Power186/Commits/blob/master/github.gif" width=250><br>

### Notes

For GitHub [Commits](https://docs.github.com/en/free-pro-team@latest/rest/reference/repos#list-commits), an owner and repo parameter is required. Example, you cannot generally fetch the most recent commits made to GitHub website, but you can for a repository. So to reuse this app for your needs, you would need to make changes to the URL parameters -> GET /repos/{owner}/{repo}/commits.  Source: [GitHub REST API](https://docs.github.com/en/free-pro-team@latest/rest/reference/repos#list-commits)

SwiftyJSON made parsing and displaying data a breeze with minimal code.  Unit testing, assertions, and documenting my code were my favorite implementations, as well as adding the launch and home screen icons. 

## Built with:
* Swift
* Xcode12
* SwiftyJSON
* MVC
* Code refactoring
* GitHub API
