# Contino learning on Katacoda 

This repo stores the code for the [Katacoda scenarios](https://katacoda.com/contino/) which we're currently using to run our Kubernetes training.

Each `.json` in the parent directory creates a course, which scenarios belong to.

## Contributions

First, you want to fork this repo and sign up at [Katacoda](https://katacoda.com/login) with your GitHub handle.

For each scenario, please do the following:

1. Create a card on the respective [Trello board](https://trello.com/b/7SvNAROB/kubernetes-training)
1. Work on the scenario, try it out in your own environment `https://www.katacoda.com/$GITHUBHANDLE`
1. When you're satisfied, send in a pull request.
1. Next, get two reviews/thumbs up from team members (@mindfulmonk, @joshuatalb and @andresguisado)
1. Once your scenario has been reviewed, we will merge it and it will appear on https://katacoda.com/contino

## Resources

View the [Katacoda documentation](https://www.katacoda.com/docs) for information on how to edit environments, scenarios and more. [scenario-examples](https://github.com/katacoda/scenario-examples) github.

## Tips

### Katacoda proflies

Make sure you create a profile that's dedicated to the fork of the contino repo, this way it will have it's own deployment and testing lifecycle.

If you'd like to test out katacoda lessons that aren't contino based, having a different katacoda profile and repo will ensure the testing and deployment and repo merging is simple and avoid any confusion.

You can use a variety of Google, Github and Email accounts for this. eg:

**Drew's Contino based:** KataCoda Profile: https://www.katacoda.com/drewkhoury-contino

- Login: Google Account Andrew.khoury@contino.io 
- Repo: https://github.com/drewkhoury/katacoda-scenarios-1 (fork of: https://github.com/contino/katacoda-scenarios)

**Drew's Sandbox/Personal:** KataCoda Profile: https://www.katacoda.com/drewkhoury
- Login: GitHub drew.khoury@gmail.com (or I could have used Google Account drew.khoury@gmail.com)
- Repo: https://github.com/drewkhoury/katacoda-drewkhoury


### Basic Katacoda Syntax in markdown

#### Open a file

```
`relative/path/to/file.foo`{{open}}
```

#### Replace file

```
<pre class="file" data-filename="relative/path/to/file.foo" data-target="replace">
you
multi
line
content
</pre>
```

#### Execute a command

```
`your command`{{execute}}
```

### Deployments

Useful dashboard links to verify that deployments were successful:

- https://dashboard.katacoda.com/content/
- https://dashboard.katacoda.com/content/testruns/
  
It can take 1 minute, or 20 minutes for deployed courses to show up on your profile.
  
You can inspect the page and look for "gitCommit" to verify what deployment you're seeing, eg: `<meta name="gitCommit" content="2ef3f7244365837307f9003875e0746f9cd3e825">`

### Displaying a Progress Spinner / Wait Script

Example from katacoda: [scenario-examples/displaying-progress-spinner](https://github.com/katacoda/scenario-examples/tree/main/displaying-progress-spinner)

In [foreground.sh](https://github.com/katacoda/scenario-examples/blob/main/displaying-progress-spinner/foreground.sh) they use a `sleep 1` however that could fail (might take a few seconds to load the foreground script). Use this instead:
  
```
while [ ! -f /usr/local/bin/wait.sh ]
do
  sleep 0.2
done
```

Here's an example of how to include the wait script (which needs to be done on the host) alongside other assets in `index.json`:
```
    "assets": {
      "client": [{
        "file": "*",
        "target": "~/"
      }],
        "host01": [
            {"file": "wait.sh", "target": "/usr/local/bin/", "chmod": "+x"}
        ]
    }  
```
  
### VS Code Layout
 
https://www.katacoda.community/essentials/layouts.html
  
At the moment, VS Code integration is only supported in our **Ubuntu based environments** but this is being rolled out across all our environments.

### Relative path for files when interacting with editor

You may want to use relative links in your markdown, as well as having a default folder accessable in your IDE.
  
Let's assume you have the following folder structure in your repo for `scenario-foo`: `assets/folder/path/to/your/app` then you would set your `uieditorpath` to:
 
```
  "environment": {
    "uieditorpath": "/root/folder/path/to/your/app"
  },  
```

Then you can do things like this:

```
`relative/path/to/file.foo`{{open}}
```
  
Instead of:

```
`/root/folder/path/to/your/app/relative/path/to/file.foo`{{open}}
```
  
### Sample `index.json`

This is an example of an `index.json` skeleton.

Files that need to live in the root of the lesson repo (alongside `index.json`):  

- steps/intro/finish: `*.md`
- courseData: `background.sh` (katacoda runs this script you specify in the background on lesson-start)
- code: `foreground.sh` (katacoda runs this script you specify in the forground on lesson-start)

Files that need to live in the `assets/` folder in the lesson repo:
  
- `wait.sh` this needs to be available in the terminal (if you want to support progress spinner feature), so we include it in `assets/` and copy it to `host01`
- anything else we need available for our lesson, in our example we have `assets/folder/path/to/your/app` which contains our application
  
 ```
 {
  "title": "My Senario",
  "description": "My Senario",
  "difficulty": "Beginner",
  "time": "30 minutes",
  "icon": "fa-java",
  "details": {
    "steps": [
      {
        "title": "Step 1",
        "text": "step1.md"
      },
      {
        "title": "Step 2",
        "text": "step2.md"
      }
    ],
    "intro": {
      "text": "intro.md",
      "courseData": "background.sh",
      "code": "foreground.sh"
    },
    "finish": {
      "text": "finish.md"
    },
    "assets": {
      "client": [{
        "file": "*",
        "target": "~/"
      }],
        "host01": [
            {"file": "wait.sh", "target": "/usr/local/bin/", "chmod": "+x"}
        ]
    }
  },
  "environment": {
    "uieditorpath": "/root/folder/path/to/your/app",
    "uilayout": "vscode-terminal-split"
  },
  "backend": {
    "imageid": "ubuntu:2004"
  }
}
 ```
