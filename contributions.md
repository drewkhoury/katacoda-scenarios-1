# How to setup your own Katacoda pipeline

Make sure you create a katacoda account that's linked to your own repo which is a fork of the contino repo. Here why:

- You have full control over all your changes
- You can deploy and then test your changes
- You can use/deliver training if you have an immediate need
- You can inlcude a link to the working scenario in your PR for review
- There's no other way to deploy/test changes without forking and using your own repo
- Merging back in is clean 

**eg: Drew's Contino** KataCoda Profile: https://www.katacoda.com/drewkhoury-contino

- Login: Google Account Andrew.khoury@contino.io 
- Repo: https://github.com/drewkhoury/katacoda-scenarios-1 (fork of: https://github.com/contino/katacoda-scenarios)

## What if you want to work on your own Katacoda modules independent from Contino?

If you'd like to test katacoda lessons that aren't contino based, or have multiple deployments at once, having independent accounts and github repos is essential (and easy).

You can use a variety of Google, Github and Email accounts for this. eg:

**Drew's Sandbox/Personal:** KataCoda Profile: https://www.katacoda.com/drewkhoury
- Login: GitHub drew.khoury@gmail.com (or I could have used Google Account drew.khoury@gmail.com)
- Repo: https://github.com/drewkhoury/katacoda-drewkhoury


# Deployments

Useful dashboard links to verify that deployments were successful:

- https://dashboard.katacoda.com/content/
- https://dashboard.katacoda.com/content/testruns/
- https://dashboard.katacoda.com/content/debug/
  
It can take 1 minute, or 20 minutes for deployed courses to show up on your profile.
  
You can inspect the page and look for "gitCommit" to verify what deployment you're seeing, eg: `<meta name="gitCommit" content="2ef3f7244365837307f9003875e0746f9cd3e825">`

## Viewing your own lesson / debug

When viewing your own lesson you can access debug from the "SCENARIO AUTHORING INFORMATION" link at the top of the page.

e.g: if your background script is downloading software through apt it might look like this:

```
Warning: Permanently added 'host01,172.17.0.12' (ECDSA) to the list of known hosts. WARNING: apt does not have a stable CLI interface. Use with caution in scripts. Reading package lists... Building dependency tree... Reading state information... The following packages were automatically installed and are no longer required: libc-ares2 libnetplan0 nodejs-doc python3-netifaces Use 'apt autoremove' to remove them. The following additional packages will be installed: ant ant-optional antlr bnd groovy ivy java-wrappers junit4 libantlr-java �� libasm-java libbcel-java libbcpg-java libbcprov-java libbindex-java libbsf-java libbsh-java libcommons-codec-java libcommons-collections3-java � libcommons-compress-java libcommons-lang-java libcommons-logging-java lib
```

# Tips

View the [Katacoda documentation](https://www.katacoda.com/docs) for information on how to edit environments, scenarios and more. [scenario-examples](https://github.com/katacoda/scenario-examples) github.

## Courses

[Courses](https://www.katacoda.community/essentials/git-repository-structure.html#courses) - each `*-pathway.json` in the parent directory creates a course, which can point to a collection of scenarios.

The scenarios can be grouped by a common subject, and this is represented with a course. A Katacoda course is defined by creating a pathway file. The pathway defines which scenarios should be included in the course and the order to display them.

## Basic Katacoda Syntax in markdown

### Open a file

```
`relative/path/to/file.foo`{{open}}
```

### Replace file

```
<pre class="file" data-filename="relative/path/to/file.foo" data-target="replace">
you
multi
line
content
</pre>
```

### Execute a command

```
`your command`{{execute}}
```

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
